import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/shared/theme.dart';

class ButtonTextMenu extends StatelessWidget {
  final bool isActive;
  final String text;
  final VoidCallback? onTap;

  const ButtonTextMenu({
    super.key,
    this.isActive = false,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(
          right: defaultSpace / 2,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: defaultSpace / 2,
          horizontal: defaultSpace,
        ),
        decoration: BoxDecoration(
          color: isActive ? thirdtyColor : secondaryColor,
          borderRadius: BorderRadius.circular(defaultSpace / 2),
        ),
        child: Text(
          text,
          style: whiteTextStyle.copyWith(
            fontSize: 14,
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            color: isActive ? secondaryColor : blackColor,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
