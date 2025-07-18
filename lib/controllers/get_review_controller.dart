import 'package:get/get.dart';
import '../services/api_services.dart';

class GetReviewController extends GetxController {
  final ApiServices api = ApiServices();
  var reviews = <Map<String, dynamic>>[].obs;
  var isLoading = false.obs;
  var hasError = false.obs;
  var isLoadingMore = false.obs;
  var hasMore = true.obs;

  final int _limit = 3;

  Future<void> fetchReviews(int? postId) async {
    if (postId == null) return; // Prevent null error
    isLoading.value = true;
    hasError.value = false;
    hasMore.value = true;
    try {
      final result = await api.fetchReviews(postId: postId, limit: _limit);
      reviews.value = result;
      hasMore.value = result.length == _limit;
    } catch (e) {
      hasError.value = true;
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> loadMoreReviews(int? postId) async {
    if (isLoadingMore.value || !hasMore.value || postId == null) return;
    isLoadingMore.value = true;
    try {
      // Collect all shown review IDs
      final blacklistIds = reviews.map((r) => r['id'] as int? ?? 0).toList();
      // Always blacklist ID 14
      if (!blacklistIds.contains(14)) {
        blacklistIds.add(14);
      }
      if (!blacklistIds.contains(13)) {
        blacklistIds.add(13);
      }
      // Pass them as notIds to the API
      final result = await api.fetchReviews(
        postId: postId,
        limit: _limit,
        notIds: blacklistIds,
      );
      // Prevent further fetches if result is empty
      if (result.isNotEmpty) {
        reviews.addAll(result);
        hasMore.value = result.length == _limit;
      } else {
        hasMore.value = false;
      }
    } catch (e) {
      hasMore.value = false; // Prevent further fetches on error
    } finally {
      isLoadingMore.value = false;
    }
  }
}
