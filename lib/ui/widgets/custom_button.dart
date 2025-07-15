import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class CustomButton extends StatelessWidget {
  final String hintText;
  final Color textColor;
  final bool withoutColor;
  final VoidCallback? ontap;
  final double width;
  final double height;
  final double borderRadius;
  final bool useBorder;
  const CustomButton({
    super.key,
    this.withoutColor = false,
    required this.hintText,
    this.ontap,
    this.width = double.infinity,
    this.height = 60,
    this.textColor = Colors.white,
    this.borderRadius = 60,
    this.useBorder = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: withoutColor ? secondaryColor : thirdtyColor,
          borderRadius: BorderRadius.circular(borderRadius),
          border: useBorder
              ? Border.all(
                  color: thirdtyColor,
                  width: 2,
                )
              : null,
        ),
        child: Center(
          child: Text(
            hintText,
            style: TextStyle(
              color: textColor,
              fontSize: 16,
              fontWeight: bold,
            ),
          ),
        ),
      ),
    );
  }
}
