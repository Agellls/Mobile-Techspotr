import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/widgets/custom_field.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../shared/theme.dart';

class ReactWidgetController extends GetxController {
  var isLoading = false.obs;
  var selectedImages = RxList<File>([]);

  void setImage(File? image) {
    if (image != null) {
      if (selectedImages.length < 2) {
        selectedImages.add(image);
      }
      // Remove the snackbar from here since we handle it in the UI
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

  Future<void> submitReact(
      {required String parentId, required String content}) async {
    isLoading.value = true;
    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));
    // Add your actual API call here
    isLoading.value = false;
    Get.back(); // Close bottom sheet
  }
}

class ReactWidget extends StatefulWidget {
  final TextEditingController reactController;
  final int id;
  const ReactWidget(
      {super.key, required this.reactController, required this.id});

  @override
  State<ReactWidget> createState() => _ReactWidgetState();
}

class _ReactWidgetState extends State<ReactWidget> {
  final reactWidgetController = Get.put(ReactWidgetController());
  final ImagePicker _picker = ImagePicker();
  final RxList<XFile?> _pickedImages = RxList<XFile?>.filled(2, null);

  // Add a method to count actual images in the UI
  int countActualPickedImages() {
    return _pickedImages.where((image) => image != null).length;
  }

  // Add a method to clear all images
  void clearAllImages() {
    _pickedImages.clear();
    _pickedImages.addAll(List<XFile?>.filled(2, null));
    reactWidgetController.clearAllImages();
  }

  Future<void> pickImage(String source) async {
    // Check if we already have 2 images picked
    if (countActualPickedImages() >= 2) {
      Get.rawSnackbar(
        message: 'Maximum 2 images allowed',
        borderRadius: 10,
        duration: const Duration(seconds: 2),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: activeColor,
        margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
      );
      return;
    }

    try {
      final XFile? image = await _picker.pickImage(
        source: source == 'camera' ? ImageSource.camera : ImageSource.gallery,
      );

      if (image != null) {
        // Add to controller first
        reactWidgetController.setImage(File(image.path));

        // Find next empty slot and place image there
        for (int i = 0; i < _pickedImages.length; i++) {
          if (_pickedImages[i] == null) {
            _pickedImages[i] = image;
            break;
          }
        }
      }
    } catch (e) {
      // Handle any errors during image picking
      Get.rawSnackbar(
        message: 'Error picking image',
        borderRadius: 10,
        duration: const Duration(seconds: 2),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
      );
    }
  }

  void removeImage(int index) {
    if (index >= 0 &&
        index < _pickedImages.length &&
        _pickedImages[index] != null) {
      reactWidgetController.removeImageByPath(_pickedImages[index]!.path);
      _pickedImages[index] = null;
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(
            color: blackColor,
            thickness: 3,
            height: 10,
            indent: 165,
            endIndent: 165,
          ),
          const SizedBox(height: defaultSpace / 2),
          Text(
            'React product type',
            style: blackTextStyle.copyWith(
                fontSize: 16, fontWeight: semibold, color: thirdtyColor),
          ),
          Text(
            'What is the type of television ?',
            style: blackTextStyle.copyWith(
              fontSize: 18,
              fontWeight: bold,
            ),
          ),
          Theme(
            data: ThemeData(
              textSelectionTheme: TextSelectionThemeData(
                cursorColor: blackColor,
                selectionColor: blackColor,
                selectionHandleColor: blackColor,
              ),
            ),
            child: CustomField(
              controller: widget.reactController,
              hintText: 'Enter your reaction here',
              maxLines: 3,
              fillColor: secondaryColor,
              isHavePickedImage: true,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 10,
            ),
            decoration: BoxDecoration(
              color: secondaryColor,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              border: Border(
                top: BorderSide(color: secondaryColor),
              ),
            ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => pickImage('gallery'),
                  child: Icon(
                    Icons.photo_outlined,
                    color: thirdtyColor,
                    size: 30,
                  ),
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: () => pickImage('camera'),
                  child: Icon(
                    Icons.camera_alt_outlined,
                    color: thirdtyColor,
                    size: 30,
                  ),
                ),
              ],
            ),
          ),
          // Add image preview section
          Obx(() => _pickedImages.any((img) => img != null)
              ? Container(
                  margin: const EdgeInsets.only(top: 10),
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _pickedImages.length,
                    itemBuilder: (context, index) {
                      final image = _pickedImages[index];
                      if (image == null) return const SizedBox.shrink();

                      return Container(
                        margin: const EdgeInsets.only(right: 10),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.file(
                                File(image.path),
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              top: 5,
                              right: 5,
                              child: GestureDetector(
                                onTap: () => removeImage(index),
                                child: Container(
                                  padding: const EdgeInsets.all(2),
                                  decoration: const BoxDecoration(
                                    color: Colors.red,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.close,
                                    color: Colors.white,
                                    size: 16,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                )
              : const SizedBox.shrink()),
          const SizedBox(height: defaultSpace / 2),
          Row(
            children: [
              const Spacer(),
              Obx(() => ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: compareColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60),
                      ),
                    ),
                    onPressed: reactWidgetController.isLoading.value
                        ? null
                        : () async {
                            if (widget.reactController.text.trim().isEmpty) {
                              Get.rawSnackbar(
                                duration: const Duration(seconds: 2),
                                message: 'React cannot be empty',
                                borderRadius: 10,
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: thirdtyColor,
                                margin: const EdgeInsets.only(
                                    bottom: 20, left: 20, right: 20),
                              );
                              return;
                            }

                            await reactWidgetController.submitReact(
                              parentId: widget.id.toString(),
                              content: widget.reactController.text,
                            );
                          },
                    child: reactWidgetController.isLoading.value
                        ? SizedBox(
                            width: 25,
                            height: 25,
                            child: CircularProgressIndicator(
                              color: whiteColor,
                              strokeWidth: 3,
                            ),
                          )
                        : Text(
                            'Send Reaction',
                            style: whiteTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: bold,
                            ),
                          ),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
