// ...existing code...
import 'package:get/get.dart';
import '../services/api_services.dart';

class GetDiscussionController extends GetxController {
  final ApiServices apiServices = ApiServices();

  var discussions = <Map<String, dynamic>>[].obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var page = 1;
  var hasMore = true.obs;
  var isLoadingMore = false.obs;

  void resetPagination() {
    page = 1;
    hasMore.value = true;
    discussions.clear();
  }

  Future<void> loadMoreDiscussions({required int postId}) async {
    if (isLoadingMore.value || !hasMore.value) return;
    isLoadingMore.value = true;
    try {
      final result =
          await apiServices.fetchDiscussions(postId: postId, page: page + 1);
      if (result.isNotEmpty) {
        page++;
        discussions.addAll(result);
      } else {
        hasMore.value = false;
      }
    } catch (e) {
      hasMore.value = false;
    } finally {
      isLoadingMore.value = false;
    }
  }

  Future<void> fetchDiscussions({
    required int postId,
    List<int>? notIds,
    String sort = 'recently',
    int limit = 10,
    int page = 1,
  }) async {
    isLoading.value = true;
    errorMessage.value = '';
    this.page = page;
    hasMore.value = true;
    try {
      final result = await apiServices.fetchDiscussions(
        postId: postId,
        notIds: notIds,
        sort: sort,
        limit: limit,
        page: page,
      );
      discussions.value = result;
      hasMore.value = result.length == limit;
    } catch (e) {
      errorMessage.value = e.toString();
      discussions.clear();
      hasMore.value = false;
    } finally {
      isLoading.value = false;
    }
  }
}
