import 'package:flutter/material.dart';
import 'package:flutter_application_1/shared/theme.dart';
import 'package:lottie/lottie.dart';

class CustomFieldWithLogo extends StatelessWidget {
  final String hintText;
  final Color fillColor;
  final bool obscureText;
  final int maxLines;
  final TextEditingController controller;
  final bool isHavePickedImage;
  final String? svgIcon;
  final double iconSize;
  final String lottieAsset;

  const CustomFieldWithLogo({
    super.key,
    required this.hintText,
    required this.controller,
    this.fillColor = const Color(0xFFFFFFFF),
    this.maxLines = 5,
    this.obscureText = false,
    this.isHavePickedImage = false,
    this.svgIcon,
    this.iconSize = 24,
    this.lottieAsset = 'assets/user.json',
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: secondaryColor,
          selectionColor: secondaryColor,
          selectionHandleColor: secondaryColor,
        ),
      ),
      child: TextFormField(
        obscureText: obscureText,
        maxLines: maxLines,
        controller: controller,
        cursorColor: activeColor,
        enableInteractiveSelection: false,
        style: blackTextStyle.copyWith(
          fontSize: 16,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: whiteTextStyle.copyWith(
            fontSize: 16,
            color: blackColor.withOpacity(0.5),
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Lottie.asset(
              lottieAsset,
              frameRate: FrameRate.max,
              width: 30,
              height: 30,
            ),
          ),
          prefixIconConstraints: const BoxConstraints(
            minWidth: 10,
            minHeight: 10,
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
              color: thirdtyColor,
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
              color: secondaryColor,
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
