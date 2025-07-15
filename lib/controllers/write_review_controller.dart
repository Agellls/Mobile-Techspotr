import 'dart:io';

import 'package:get/get.dart';

class WriteReviewsController extends GetxController {
  var isLoading = false.obs;
  var selectedImage = Rx<File?>(null);

  void setImage(File? image) {
    selectedImage.value = image;
  }
}
