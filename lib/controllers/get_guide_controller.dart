import 'package:get/get.dart';
import '../services/api_services.dart';

class GetGuideController extends GetxController {
  final ApiServices api = ApiServices();
  var videos = <Map<String, dynamic>>[].obs;
  var articles = <Map<String, dynamic>>[].obs;
  var files = <Map<String, dynamic>>[].obs;

  var isVideosLoading = false.obs;
  var isArticlesLoading = false.obs;
  var isFilesLoading = false.obs;

  var hasError = false.obs;
  var errorMessage = ''.obs;

  Future<void> fetchVideos({
    required int postId,
    List<int>? notIds,
  }) async {
    isVideosLoading.value = true;
    hasError.value = false;
    errorMessage.value = '';
    videos.clear();
    try {
      videos.value = await api.fetchGuides(
        postId: postId,
        type: 'video',
        notIds: notIds,
      );
    } catch (e) {
      hasError.value = true;
      errorMessage.value = e.toString();
    } finally {
      isVideosLoading.value = false;
    }
  }

  Future<void> fetchArticles({
    required int postId,
    List<int>? notIds,
  }) async {
    isArticlesLoading.value = true;
    hasError.value = false;
    errorMessage.value = '';
    articles.clear();
    try {
      articles.value = await api.fetchGuides(
        postId: postId,
        type: 'article',
        notIds: notIds,
      );
    } catch (e) {
      hasError.value = true;
      errorMessage.value = e.toString();
    } finally {
      isArticlesLoading.value = false;
    }
  }

  Future<void> fetchFiles({
    required int postId,
    List<int>? notIds,
  }) async {
    isFilesLoading.value = true;
    hasError.value = false;
    errorMessage.value = '';
    files.clear();
    try {
      files.value = await api.fetchGuides(
        postId: postId,
        type: 'file',
        notIds: notIds,
      );
    } catch (e) {
      hasError.value = true;
      errorMessage.value = e.toString();
    } finally {
      isFilesLoading.value = false;
    }
  }

  Future<void> fetchAllGuides({required int postId, List<int>? notIds}) async {
    hasError.value = false;
    errorMessage.value = '';
    await Future.wait([
      fetchVideos(postId: postId, notIds: notIds),
      fetchArticles(postId: postId, notIds: notIds),
      fetchFiles(postId: postId, notIds: notIds),
    ]);
  }
}
