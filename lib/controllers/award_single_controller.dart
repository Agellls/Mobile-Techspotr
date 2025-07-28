import 'package:get/get.dart';
import '../services/api_services.dart';

class AwardSingleController extends GetxController {
  final ApiServices api = ApiServices();

  var award = Rxn<Map<String, dynamic>>();
  var isLoading = false.obs;

  Future<void> fetchAward(int awardId) async {
    isLoading.value = true;
    final result = await api.fetchSingleAward(awardId);
    award.value = result;
    isLoading.value = false;
  }
}
