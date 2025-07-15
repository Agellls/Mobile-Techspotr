import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/widgets/custom_field.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shimmer/shimmer.dart';
import 'dart:math' as math;

import '../../shared/theme.dart';
import '../../utilities/loading.dart';

// Sample controller class - replace with your actual implementation
class RepliesWidgetController extends GetxController {
  final RxBool isLoading = false.obs;
  final RxList<File> selectedImages = <File>[].obs;

  void removeImage(int index) {
    if (index >= 0 && index < selectedImages.length) {
      selectedImages.removeAt(index);
    }
  }

  Future<void> submitReplyDiscuss(
      {required String parentId, required String content}) async {
    isLoading.value = true;
    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));
    // Add your actual API call here
    isLoading.value = false;
    Get.back(); // Close bottom sheet
  }
}

class RepliesWidget extends StatelessWidget {
  final TextEditingController commentController;
  final int id;
  RepliesWidget({
    super.key,
    required this.commentController,
    required this.id,
  });

  final box = GetStorage();
  final RxList<XFile?> _pickedImages = <XFile?>[null, null].obs;
  final List<TextEditingController> _captionControllers = [
    TextEditingController(),
    TextEditingController(),
  ];
  final repliesWidgetController = Get.put(RepliesWidgetController());

  int countActualPickedImages() {
    return _pickedImages.where((image) => image != null).length;
  }

  void clearAllImages() {
    for (int i = 0; i < _pickedImages.length; i++) {
      _pickedImages[i] = null;
      _captionControllers[i].clear();
    }
    repliesWidgetController.selectedImages.clear();
  }

  void pickImage(String source) async {
    final ImagePicker picker = ImagePicker();
    XFile? image;

    if (source == 'camera') {
      image = await picker.pickImage(source: ImageSource.camera);
    } else {
      image = await picker.pickImage(source: ImageSource.gallery);
    }

    if (image != null) {
      // Find first empty slot
      for (int i = 0; i < _pickedImages.length; i++) {
        if (_pickedImages[i] == null) {
          _pickedImages[i] = image;
          repliesWidgetController.selectedImages.add(File(image.path));
          break;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: defaultSpace / 2,
        horizontal: defaultSpace,
      ),
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(
            color: blackColor,
            thickness: 3,
            height: 10,
            indent: 165,
            endIndent: 165,
          ),
          const SizedBox(height: defaultSpace / 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ClipOval(
                    child: CachedNetworkImage(
                      imageUrl: box.read('profileImage') ?? '',
                      width: 45,
                      height: 45,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Shimmer.fromColors(
                        baseColor: secondaryColor,
                        highlightColor: thirdtyColor,
                        child: const ShimmerPerProfile(),
                      ),
                      errorWidget: (context, url, error) => Image.network(
                        'https://icons.veryicon.com/png/o/business/new-vision-2/picture-loading-failed-1.png',
                        width: 45,
                        height: 45,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: defaultSpace / 2),
                  Text(
                    box.read('name') ?? 'User',
                    style: blackTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: bold,
                    ),
                  ),
                ],
              ),
              Text(
                'Replies to',
                style: blackTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: bold,
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ClipOval(
                    child: CachedNetworkImage(
                      imageUrl: box.read('profileImage') ?? '',
                      width: 45,
                      height: 45,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Shimmer.fromColors(
                        baseColor: secondaryColor,
                        highlightColor: thirdtyColor,
                        child: const ShimmerPerProfile(),
                      ),
                      errorWidget: (context, url, error) => Image.network(
                        'https://icons.veryicon.com/png/o/business/new-vision-2/picture-loading-failed-1.png',
                        width: 45,
                        height: 45,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: defaultSpace / 2),
                  Text(
                    box.read('name') ?? 'User',
                    style: blackTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultSpace / 2),
            child: CustomField(
              hintText: 'Type your comment here...',
              fillColor: secondaryColor,
              controller: commentController,
            ),
          ),
          Obx(
            () => Column(
              children:
                  List.generate(math.min(_pickedImages.length, 2), (index) {
                if (_pickedImages[index] != null) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                            width: 50,
                            height: 44,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Image.file(
                                File(_pickedImages[index]!.path),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: SizedBox(
                          height: 44.0,
                          child: TextFormField(
                            cursorColor: activeColor,
                            controller: _captionControllers[index],
                            decoration: InputDecoration(
                              hintText: 'Add a caption...(Optional)',
                              hintStyle: blackTextStyle.copyWith(
                                fontSize: 16.0,
                                fontWeight: regular,
                                color: blackColor.withOpacity(0.7),
                              ),
                              border: InputBorder.none,
                            ),
                            style: TextStyle(color: blackColor),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          File? imageFile = _pickedImages[index] != null
                              ? File(_pickedImages[index]!.path)
                              : null;

                          _pickedImages[index] = null;
                          _captionControllers[index].clear();

                          if (imageFile != null) {
                            int controllerIndex = repliesWidgetController
                                .selectedImages
                                .indexWhere(
                                    (img) => img.path == imageFile.path);
                            if (controllerIndex != -1) {
                              repliesWidgetController
                                  .removeImage(controllerIndex);
                            }
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            color: thirdtyColor,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.close,
                            color: whiteColor,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  );
                } else {
                  return Container();
                }
              }),
            ),
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  if (_pickedImages[1] != null) {
                    Get.snackbar(
                      '',
                      '',
                      titleText: Text(
                        'Oops!',
                        style: whiteTextStyle.copyWith(
                          fontSize: 18,
                          fontWeight: bold,
                        ),
                      ),
                      messageText: Text(
                        'Its only can send 2 images',
                        style: whiteTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: regular,
                        ),
                      ),
                      snackPosition: SnackPosition.TOP,
                      colorText: whiteColor,
                      backgroundColor: activeColor,
                      margin: const EdgeInsets.only(
                        top: defaultSpace / 2,
                        left: defaultSpace / 2,
                        right: defaultSpace / 2,
                      ),
                    );
                  } else {
                    pickImage('camera');
                  }
                },
                child: Icon(
                  Icons.photo_camera_outlined,
                  color: thirdtyColor,
                  size: 32,
                ),
              ),
              const SizedBox(width: 10),
              GestureDetector(
                onTap: () {
                  if (_pickedImages[1] != null) {
                    Get.snackbar(
                      '',
                      '',
                      titleText: Text(
                        'Oops!',
                        style: whiteTextStyle.copyWith(
                          fontSize: 18,
                          fontWeight: bold,
                        ),
                      ),
                      messageText: Text(
                        'Its only can send 2 images',
                        style: whiteTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: regular,
                        ),
                      ),
                      snackPosition: SnackPosition.TOP,
                      colorText: whiteColor,
                      backgroundColor: activeColor,
                      margin: const EdgeInsets.only(
                        top: defaultSpace / 2,
                        left: defaultSpace / 2,
                        right: defaultSpace / 2,
                      ),
                    );
                  } else {
                    pickImage('gallery');
                  }
                },
                child: Icon(
                  Icons.insert_photo_outlined,
                  color: thirdtyColor,
                  size: 30,
                ),
              ),
              const Spacer(),
              Obx(
                () => ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: activeColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(60),
                    ),
                  ),
                  onPressed: () async {
                    if (commentController.text.trim().isEmpty) {
                      Get.rawSnackbar(
                        duration: const Duration(seconds: 2),
                        message: 'Comment cannot be empty',
                        borderRadius: 10,
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: activeColor,
                        margin: const EdgeInsets.only(
                            bottom: 20, left: 20, right: 20),
                      );
                      return;
                    }

                    await repliesWidgetController.submitReplyDiscuss(
                      parentId: id.toString(),
                      content: commentController.text,
                    );

                    clearAllImages();
                  },
                  child: repliesWidgetController.isLoading.value
                      ? SizedBox(
                          width: 25,
                          height: 25,
                          child: CircularProgressIndicator(
                            color: whiteColor,
                            strokeWidth: 3,
                          ),
                        )
                      : Text(
                          'Post Comment',
                          style: whiteTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: bold,
                          ),
                        ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
