import 'dart:io';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../controllers/write_discuss_controller.dart';
import '../../shared/theme.dart';
import '../widgets/input_form.dart';
import '../widgets/input_tags.dart';

class WriteDiscussPage extends StatelessWidget {
  WriteDiscussPage({super.key});

  final WriteDiscussController writeDiscussController =
      Get.put(WriteDiscussController());
  final titleController = TextEditingController();
  final contentController = TextEditingController();
  final titleArticleController = TextEditingController();
  final introArticleController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  final List<XFile?> _pickedImages = List<XFile?>.filled(10, null).obs;
  final List<TextEditingController> _captionControllers =
      List<TextEditingController>.generate(
          10, (index) => TextEditingController());
  final RxList<String> tagsList = <String>[].obs;

  // Add a method to count actual images in the UI
  int countActualPickedImages() {
    return _pickedImages.where((image) => image != null).length;
  }

  // Add a method to clear all images
  void clearAllImages() {
    for (int i = 0; i < _pickedImages.length; i++) {
      _pickedImages[i] = null;
      _captionControllers[i].clear();
    }
    writeDiscussController.clearAllImages();
  }

  Future<void> pickImage(String source) async {
    // Check current images count in the UI list instead of controller
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

    final XFile? image = await _picker.pickImage(
      source: source == 'camera' ? ImageSource.camera : ImageSource.gallery,
    );

    if (image != null) {
      // Add to controller
      writeDiscussController.setImage(File(image.path));

      // Find next empty slot and place image there
      for (int i = 0; i < _pickedImages.length; i++) {
        if (_pickedImages[i] == null) {
          _pickedImages[i] = image;
          break;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Write Discussion',
          style: blackTextStyle.copyWith(
            fontSize: 22,
            fontWeight: extrabold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.close,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        foregroundColor: blackColor,
        surfaceTintColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultSpace),
        child: SingleChildScrollView(
          child: Column(
            children: [
              InputForm(
                title: 'Title *',
                subtitle: '',
                controller: titleController,
                hintText: 'Got a title in mind?',
                maxLines: 1,
              ),
              InputForm(
                title: 'Content *',
                subtitle: '',
                controller: contentController,
                hintText: 'Let the keyboard do the talking...',
                maxLines: 3,
                isBottomRounded: false,
                pickImage: () => pickImage('gallery'),
                openCamera: () => pickImage('camera'),
              ),

              Obx(() => Column(
                    children: List.generate(math.min(_pickedImages.length, 2),
                        (index) {
                      if (_pickedImages[index] != null) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Row(
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
                                    style: TextStyle(
                                      color: blackColor,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              GestureDetector(
                                onTap: () {
                                  // Keep track of which image we're removing
                                  File? imageFile = _pickedImages[index] != null
                                      ? File(_pickedImages[index]!.path)
                                      : null;

                                  // Remove from UI list
                                  _pickedImages[index] = null;
                                  _captionControllers[index].clear();

                                  // Remove from controller - use the actual image to remove
                                  if (imageFile != null) {
                                    int controllerIndex = writeDiscussController
                                        .selectedImages
                                        .indexWhere((img) =>
                                            img.path == imageFile.path);
                                    if (controllerIndex != -1) {
                                      writeDiscussController
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
                          ),
                        );
                      } else {
                        return Container();
                      }
                    }),
                  )),

              const SizedBox(height: defaultSpace),
              InputTags(
                title: 'Tags *',
                hintText: 'Tags...(Enter to save your tags)',
                subtitle:
                    'Add tags to your review, separate them with commas (,) or generate tag using AI',
                onItemsChanged: (items) {
                  tagsList.value = items;
                },
                initialItems: const [],
                inputControllers: [titleController, contentController],
                postId: '1',
              ),

              // submit question
              const SizedBox(height: defaultSpace),
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(defaultSpace),
                  decoration: BoxDecoration(
                    color: compareColor,
                    borderRadius: BorderRadius.circular(60),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      writeDiscussController.isLoading.value
                          ? SizedBox(
                              width: 25,
                              height: 25,
                              child: CircularProgressIndicator(
                                color: whiteColor,
                                strokeWidth: 3,
                              ),
                            )
                          : Icon(
                              Icons.send_rounded,
                              color: whiteColor,
                              size: 25,
                            ),
                      const SizedBox(width: 10),
                      writeDiscussController.isLoading.value
                          ? Text(
                              'Submitting.....',
                              style: whiteTextStyle.copyWith(
                                fontSize: 16,
                                fontWeight: bold,
                              ),
                            )
                          : Text(
                              'Submit Question',
                              style: whiteTextStyle.copyWith(
                                fontSize: 16,
                                fontWeight: bold,
                              ),
                            ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
