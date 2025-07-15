import 'package:get/get.dart';
import 'package:flutter_application_1/services/api_services.dart';
import 'package:flutter_application_1/controllers/get_posts_controller.dart';

class GetCategoryController extends GetxController {
  final ApiServices _apiServices = ApiServices();

  // Observable list for categories
  final RxList<Map<String, dynamic>> categories = <Map<String, dynamic>>[].obs;
  final RxInt selectedCategoryId = 0.obs; // 0 means all categories

  // Loading and error states
  final RxBool isLoading = false.obs;
  final RxBool hasError = false.obs;
  final RxString errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  Future<void> fetchCategories() async {
    try {
      isLoading.value = true;
      hasError.value = false;
      errorMessage.value = '';

      final categoryList = await _apiServices.fetchCategories();
      categories.assignAll(categoryList);
    } catch (e) {
      hasError.value = true;
      errorMessage.value = e.toString();
      print('Error fetching categories: $e');
    } finally {
      isLoading.value = false;
    }
  }

  void selectCategory(int categoryId) {
    selectedCategoryId.value = categoryId;

    // Get the posts controller and fetch posts by category
    final GetPostsController postsController = Get.find<GetPostsController>();

    // Fetch posts by category first, then clear search
    postsController.fetchPostsByCategory(categoryId).then((_) {
      // Clear search after category data is loaded
      postsController.clearSearch();
    });
  }

  String get selectedCategoryName {
    if (selectedCategoryId.value == 0) return 'All';
    final category = categories.firstWhereOrNull(
      (cat) => cat['id'] == selectedCategoryId.value,
    );
    return category?['name'] ?? 'Unknown';
  }
}
