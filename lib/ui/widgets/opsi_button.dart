import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/shared/theme.dart';
import 'package:flutter_svg/svg.dart';

class OpsiButton extends StatelessWidget {
  final String iconSvg;
  final String text;
  final void Function()? ontap;
  final bool fullWidth;
  const OpsiButton({
    super.key,
    required this.iconSvg,
    required this.text,
    this.ontap,
    this.fullWidth = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: fullWidth
          ? Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: defaultSpace * 2,
                vertical: defaultSpace,
              ),
              decoration: BoxDecoration(
                color: secondaryColor,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.string(
                    iconSvg,
                    width: 25,
                    height: 25,
                    color: compareColor,
                  ),
                  const SizedBox(width: defaultSpace / 2),
                  Text(
                    text,
                    style: blackTextStyle.copyWith(
                      fontWeight: bold,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            )
          : IntrinsicWidth(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: defaultSpace * 2,
                  vertical: defaultSpace,
                ),
                decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.string(
                      iconSvg,
                      width: 25,
                      height: 25,
                      color: compareColor,
                    ),
                    const SizedBox(width: defaultSpace / 2),
                    Text(
                      text,
                      style: blackTextStyle.copyWith(
                        fontWeight: bold,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
