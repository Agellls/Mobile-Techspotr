import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../shared/theme.dart';

class WriteDiscussController extends GetxController {
  var isLoading = false.obs;
  var selectedImages = RxList<File>([]);

  void setImage(File? image) {
    if (image != null) {
      if (selectedImages.length < 2) {
        selectedImages.add(image);
      } else {
        Get.rawSnackbar(
          message: 'Maximum 2 images allowed',
          borderRadius: 10,
          duration: const Duration(seconds: 2),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: activeColor,
          margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
        );
      }
    }
  }

  void removeImage(int index) {
    if (index >= 0 && index < selectedImages.length) {
      selectedImages.removeAt(index);
    }
  }

  void removeImageByPath(String path) {
    int index = selectedImages.indexWhere((img) => img.path == path);
    if (index != -1) {
      selectedImages.removeAt(index);
    }
  }

  void clearAllImages() {
    selectedImages.clear();
  }
}
