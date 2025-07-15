import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../shared/theme.dart';

class InputImage extends StatelessWidget {
  final String title;
  final String subtitle;
  final String secTitle;
  final String secSubtitle;
  final Function(File?) onImageSelected;

  InputImage({
    super.key,
    required this.title,
    required this.subtitle,
    required this.secTitle,
    required this.secSubtitle,
    required this.onImageSelected,
  });

  final RxBool _hasImage = false.obs;
  final Rx<File?> _selectedImage = Rx<File?>(null);
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      _selectedImage.value = File(image.path);
      _hasImage.value = true;
      onImageSelected(_selectedImage.value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 5),
          Text(
            title,
            style: blackTextStyle.copyWith(
              fontSize: 18,
              fontWeight: bold,
            ),
          ),
          const SizedBox(height: 5),
          Obx(
            () => _hasImage.value
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.file(
                          _selectedImage.value!,
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: _pickImage,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 5,
                                horizontal: 10,
                              ),
                              decoration: BoxDecoration(
                                color: thirdtyColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                'Change Image',
                                style: whiteTextStyle.copyWith(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              _selectedImage.value = null;
                              _hasImage.value = false;
                              onImageSelected(null);
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 5,
                                horizontal: 10,
                              ),
                              decoration: BoxDecoration(
                                color: compareColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                'Remove',
                                style: whiteTextStyle.copyWith(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                : GestureDetector(
                    onTap: _pickImage,
                    child: DottedBorder(
                      padding: const EdgeInsets.all(5),
                      strokeWidth: 0.5,
                      color: thirdtyColor,
                      borderType: BorderType.RRect,
                      radius: const Radius.circular(10),
                      dashPattern: const [6, 3],
                      child: SizedBox(
                        height: 200,
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.image,
                              size: 48,
                              color: thirdtyColor,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Add Image',
                              style: blackTextStyle.copyWith(
                                fontSize: 16,
                                color: thirdtyColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
