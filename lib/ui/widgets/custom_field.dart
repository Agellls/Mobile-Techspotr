import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class CustomField extends StatelessWidget {
  final String hintText;
  final Color fillColor;
  final bool obscureText;
  final int maxLines;
  final TextEditingController controller;
  final bool isHavePickedImage;
  final bool cantype;
  const CustomField({
    super.key,
    required this.hintText,
    required this.controller,
    this.fillColor = const Color(0xFFFFFFFF),
    this.maxLines = 5,
    this.obscureText = false,
    this.isHavePickedImage = false,
    this.cantype = true,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: activeColor,
          selectionColor: activeColor.withOpacity(0.3),
          selectionHandleColor: activeColor,
        ),
      ),
      child: TextFormField(
        enabled: cantype,
        obscureText: obscureText,
        maxLines: maxLines,
        controller: controller,
        cursorColor: thirdtyColor,
        style: blackTextStyle.copyWith(
          fontSize: 16,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: whiteTextStyle.copyWith(
            fontSize: 16,
            color: blackColor.withOpacity(0.5),
          ),
          border: OutlineInputBorder(
            borderRadius: isHavePickedImage
                ? const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  )
                : BorderRadius.circular(10),
            borderSide: BorderSide(
              color: secondaryColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: isHavePickedImage
                ? const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  )
                : BorderRadius.circular(10),
            borderSide: BorderSide(
              color: secondaryColor,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: isHavePickedImage
                ? const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  )
                : BorderRadius.circular(10),
            borderSide: BorderSide(
              color: secondaryColor.withOpacity(0.8),
            ),
          ),
          filled: true,
          fillColor: fillColor,
          contentPadding: const EdgeInsets.all(10),
        ),
      ),
    );
  }
}
