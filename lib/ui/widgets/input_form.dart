import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/widgets/custom_field.dart';

import '../../shared/theme.dart';

class InputForm extends StatelessWidget {
  final String title;
  final String subtitle;
  final TextEditingController controller;
  final String hintText;
  final int maxLines;
  final bool isBottomRounded;
  final VoidCallback? pickImage;
  final VoidCallback? openCamera;
  final bool obscureText;
  const InputForm({
    super.key,
    required this.title,
    required this.subtitle,
    required this.controller,
    required this.hintText,
    required this.maxLines,
    this.isBottomRounded = true,
    this.pickImage,
    this.openCamera,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: isBottomRounded
          ? const EdgeInsets.only(bottom: 10)
          : const EdgeInsets.only(),
      child: Column(
        children: [
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: blackTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: bold,
                ),
              ),
              Text(
                subtitle,
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: regular,
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Theme(
            data: ThemeData(
              textSelectionTheme: TextSelectionThemeData(
                cursorColor: blackColor,
                selectionColor: blackColor,
                selectionHandleColor: blackColor,
              ),
            ),
            child: CustomField(
              controller: controller,
              hintText: hintText,
              maxLines: maxLines,
              fillColor: secondaryColor,
              isHavePickedImage: false,
              obscureText: obscureText,
            ),
          ),
          if (!isBottomRounded)
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
                    onTap: () => pickImage!(),
                    child: Icon(
                      Icons.photo_outlined,
                      color: thirdtyColor,
                      size: 30,
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () => openCamera!(),
                    child: Icon(
                      Icons.camera_alt_outlined,
                      color: thirdtyColor,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
