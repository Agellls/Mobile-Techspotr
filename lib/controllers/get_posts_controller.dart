import 'package:get/get.dart';
import 'package:flutter_application_1/services/api_services.dart';

class GetPostsController extends GetxController {
  final ApiServices _apiServices = ApiServices();

  // Observable lists for posts
  final RxList<Map<String, dynamic>> allPosts = <Map<String, dynamic>>[].obs;
  final RxList<Map<String, dynamic>> filteredPosts =
      <Map<String, dynamic>>[].obs;

  // Loading and error states
  final RxBool isLoading = false.obs;
  final RxBool isLoadingMore = false.obs;
  final RxBool hasError = false.obs;
  final RxString errorMessage = ''.obs;

  // Pagination variables
  final RxInt currentPage = 1.obs;
  final RxBool hasMoreData = true.obs;
  final RxString searchQuery = ''.obs;
  final RxInt selectedCategoryId = 0.obs; // Add category tracking

  @override
  void onInit() {
    super.onInit();
    fetchPosts();
  }

  Future<void> fetchPosts({bool isRefresh = false, int? categoryId}) async {
    try {
      if (isRefresh) {
        currentPage.value = 1;
        hasMoreData.value = true;
        isLoading.value = true;
      } else {
        isLoading.value = true;
      }

      hasError.value = false;
      errorMessage.value = '';

      // Use the provided categoryId or the current selected category
      final catId = categoryId ?? selectedCategoryId.value;
      final apiPosts = await _apiServices.fetchPopularPosts(
        page: currentPage.value,
        categoryId: catId > 0 ? catId : null,
      );

      // Map API response to expected format
      final mappedPosts =
          apiPosts.map((post) => _mapApiPostToProduct(post)).toList();

      if (isRefresh) {
        allPosts.assignAll(mappedPosts);
      } else {
        allPosts.addAll(mappedPosts);
      }

      // Check if we have more data
      hasMoreData.value = mappedPosts.length >= 6; // Based on your API limit

      // Apply current search filter
      _applySearchFilter();
    } catch (e) {
      hasError.value = true;
      errorMessage.value = e.toString();
      print('Error fetching posts: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> loadMorePosts() async {
    if (!hasMoreData.value || isLoadingMore.value) return;

    try {
      isLoadingMore.value = true;
      currentPage.value++;

      final catId = selectedCategoryId.value;
      final apiPosts = await _apiServices.fetchPopularPosts(
        page: currentPage.value,
        categoryId: catId > 0 ? catId : null,
      );
      final mappedPosts =
          apiPosts.map((post) => _mapApiPostToProduct(post)).toList();

      if (mappedPosts.isNotEmpty) {
        allPosts.addAll(mappedPosts);
        hasMoreData.value = mappedPosts.length >= 6;
      } else {
        hasMoreData.value = false;
      }

      // Apply current search filter
      _applySearchFilter();
    } catch (e) {
      print('Error loading more posts: $e');
      // Revert page increment on error
      currentPage.value--;
    } finally {
      isLoadingMore.value = false;
    }
  }

  // Map API post data to product format expected by UI
  Map<String, dynamic> _mapApiPostToProduct(Map<String, dynamic> apiPost) {
    return {
      'id': apiPost['id']?.toString() ?? '',
      'productName': apiPost['title'] ?? 'Unknown Product',
      'productImage': apiPost['image'] ??
          apiPost['featured_image'] ??
          'https://via.placeholder.com/350x350',
      'productRating': (apiPost['rating'] ?? 0.0).toDouble(),
      'productPrice': [
        (apiPost['price'] ?? 999.99).toDouble(),
        (apiPost['compare_price'] ?? apiPost['price'] ?? 999.99).toDouble(),
      ],
      'productPriceImages': [
        'https://t0.gstatic.com/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&url=http://store.example.com&size=128',
        'https://t0.gstatic.com/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&url=http://amazon.com&size=128'
      ],
      'brandImage':
          apiPost['brand']?['logo'] ?? 'https://via.placeholder.com/400x400',
      'brandName': apiPost['brand']?['name'] ??
          apiPost['category']?['name'] ??
          'Unknown Brand',
      'slug': apiPost['slug'] ?? '',
      'description': apiPost['description'] ?? '',
      'category': apiPost['category'] ?? {},
    };
  }

  // Add method to handle category change
  Future<void> fetchPostsByCategory(int categoryId) async {
    selectedCategoryId.value = categoryId;
    currentPage.value = 1;
    hasMoreData.value = true;

    await fetchPosts(isRefresh: true, categoryId: categoryId);

    // Ensure search is cleared after category data is loaded
    searchQuery.value = '';
    filteredPosts.assignAll(allPosts);
  }

  void filterPosts(String query) {
    searchQuery.value = query;
    _applySearchFilter();
  }

  // Add this method to clear search
  void clearSearch() {
    searchQuery.value = '';
    filteredPosts.assignAll(allPosts);
    // Force update by reassigning
    filteredPosts.refresh();
  }

  void _applySearchFilter() {
    if (searchQuery.value.isEmpty) {
      filteredPosts.assignAll(allPosts);
    } else {
      final lowercaseQuery = searchQuery.value.toLowerCase();
      filteredPosts.assignAll(allPosts.where((post) {
        final productName = post['productName']?.toString().toLowerCase() ?? '';
        final brandName = post['brandName']?.toString().toLowerCase() ?? '';
        return productName.contains(lowercaseQuery) ||
            brandName.contains(lowercaseQuery);
      }).toList());
    }
  }

  Future<void> refreshPosts() async {
    await fetchPosts(isRefresh: true);
  }
}
