import 'package:get/get.dart';
import '../services/api_services.dart';

class GetCollectionController extends GetxController {
  final ApiServices apiServices = ApiServices();
  var collections = <Map<String, dynamic>>[].obs;
  var isLoading = false.obs;
  var error = ''.obs;

  Future<void> loadCollections(
      {int? postId, String? keyword, int? userId}) async {
    isLoading.value = true;
    error.value = '';
    try {
      final result = await apiServices.fetchCollections(
        postId: postId,
        keyword: keyword,
        userId: userId,
      );
      collections.value = result;
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
