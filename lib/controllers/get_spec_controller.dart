import 'package:get/get.dart';
import '../services/api_services.dart';

class GetSpecController extends GetxController {
  final ApiServices _apiServices = ApiServices();

  // Observable variables
  final isLoading = false.obs;
  final isLoadingMore = false.obs; // Add this for bottom loading indicator
  final hasError = false.obs;
  final errorMessage = ''.obs;
  final specifications = <Map<String, dynamic>>[].obs;
  final currentPage = 1.obs;
  final hasMoreData = true.obs;
  final limit = 3.obs; // Set initial limit to 3

  // Initial fetch specifications method
  Future<void> fetchSpecifications(String postId, int specParentId) async {
    try {
      isLoading.value = true;
      isLoadingMore.value = false;
      hasError.value = false;
      errorMessage.value = '';
      currentPage.value = 1; // Reset page

      final specs = await _apiServices.fetchSpecifications(
        postId,
        specParentId,
        limit: limit.value,
      );

      if (specs.isEmpty) {
        hasMoreData.value = false;
      } else {
        specifications.assignAll(specs);
        hasMoreData.value = specs.length == limit.value;
      }
    } catch (e) {
      hasError.value = true;
      errorMessage.value = e.toString();
      print('Error fetching specifications: $e');
    } finally {
      isLoading.value = false;
      isLoadingMore.value = false;
    }
  }

  // Load more specifications (pagination, local slicing)
  Future<void> loadMoreSpecifications(String postId, int specParentId) async {
    if (!hasMoreData.value || isLoading.value || isLoadingMore.value) return;

    try {
      isLoadingMore.value = true;
      // Add artificial delay
      await Future.delayed(const Duration(seconds: 1));
      // Increase limit to fetch more data, but keep old data
      final newLimit = limit.value + 3;
      final allSpecs = await _apiServices.fetchSpecifications(
        postId,
        specParentId,
        limit: newLimit,
      );

      if (allSpecs.length <= specifications.length) {
        hasMoreData.value = false;
      } else {
        // Only add the new items to the list
        final newItems = allSpecs.sublist(specifications.length);
        specifications.addAll(newItems);
        limit.value = newLimit;
        hasMoreData.value = allSpecs.length == newLimit;
      }
    } catch (e) {
      print('Error loading more specifications: $e');
    } finally {
      isLoadingMore.value = false;
    }
  }

  // Reset controller state
  void resetController() {
    specifications.clear();
    currentPage.value = 1;
    hasMoreData.value = true;
    isLoading.value = false;
    isLoadingMore.value = false;
    hasError.value = false;
    errorMessage.value = '';
  }

  // Update specifications limit
  void updateLimit(int newLimit) {
    if (newLimit != limit.value) {
      limit.value = newLimit;
      resetController();
    }
  }
}
