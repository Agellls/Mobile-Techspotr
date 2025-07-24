import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/shared/theme.dart';
import 'package:flutter_svg/svg.dart';

class ButtonWidget extends StatelessWidget {
  final Color bgColor;
  final Color bgActiveColor;
  final String text;
  final String icon;
  final bool isActive;
  final int totalReaction;
  final int height;
  final int width;
  const ButtonWidget({
    super.key,
    required this.bgColor,
    required this.bgActiveColor,
    required this.text,
    required this.icon,
    this.isActive = false,
    required this.totalReaction,
    this.height = 45,
    this.width = 125,
  });

  @override
  Widget build(BuildContext context) {
    return isActive
        ? Container(
            padding: const EdgeInsets.symmetric(
                horizontal: defaultSpace, vertical: defaultSpace / 2),
            width: width.toDouble(),
            height: height.toDouble(),
            decoration: BoxDecoration(
              color: bgActiveColor,
              borderRadius: BorderRadius.circular(60),
              border: Border.all(
                color: blackColor.withOpacity(0.3),
                width: 3,
                strokeAlign: BorderSide.strokeAlignInside,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '$totalReaction People',
                  style: whiteTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: bold,
                  ),
                ),
                const SizedBox(width: defaultSpace / 2),
                SvgPicture.string(
                  icon,
                  width: 20,
                  height: 20,
                  color: whiteColor,
                ),
              ],
            ),
          )
        : Container(
            padding: const EdgeInsets.symmetric(
                horizontal: defaultSpace, vertical: defaultSpace / 2),
            width: width.toDouble(),
            height: height.toDouble(),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(60),
              border: Border.all(
                color: blackColor.withOpacity(0.3),
                width: 3,
                strokeAlign: BorderSide.strokeAlignInside,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  text,
                  style: whiteTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: bold,
                  ),
                ),
                const SizedBox(width: defaultSpace / 2),
                SvgPicture.string(
                  icon,
                  width: 20,
                  height: 20,
                  color: whiteColor,
                ),
              ],
            ),
          );
  }
}
