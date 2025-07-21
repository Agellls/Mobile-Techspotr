import 'package:get/get.dart';
import '../services/api_services.dart';

class GetAwardController extends GetxController {
  final ApiServices api = ApiServices();

  var awards = <Map<String, dynamic>>[].obs;
  var isLoading = false.obs;
  var error = ''.obs;

  Future<void> fetchAwards({
    required int postId,
    int limit = 7,
    String sort = 'recently',
    List<int>? notIds,
  }) async {
    isLoading.value = true;
    error.value = '';
    try {
      final result = await api.fetchAwards(
        postId: postId,
        limit: limit,
        sort: sort,
        notIds: notIds,
      );
      awards.value = result;
    } catch (e) {
      error.value = e.toString();
      awards.clear();
    } finally {
      isLoading.value = false;
    }
  }
}
