import 'package:get/get.dart';
import '../services/api_services.dart';

class MoreCompareController extends GetxController {
  final ApiServices api = ApiServices();
  var moreComparisons = <Map<String, dynamic>>[].obs;
  var isLoading = false.obs;
  var error = ''.obs;

  Future<void> fetchMoreComparisons(int postId) async {
    isLoading.value = true;
    error.value = '';
    try {
      final data = await api.fetchComparison(postId);
      moreComparisons.value = data;
    } catch (e) {
      error.value = e.toString();
    }
    isLoading.value = false;
  }
}
