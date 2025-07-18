import 'package:get/get.dart';
import '../services/api_services.dart';

class GetAttributeController extends GetxController {
  final ApiServices apiServices = ApiServices();

  var attributes = {}.obs;
  var isLoading = false.obs;
  var hasError = false.obs;

  Future<void> fetchAttributes(int postId) async {
    isLoading.value = true;
    hasError.value = false;
    try {
      final data = await apiServices.fetchReviewAttributes(postId);
      attributes.value = data;
    } catch (e) {
      hasError.value = true;
    } finally {
      isLoading.value = false;
    }
  }
}
