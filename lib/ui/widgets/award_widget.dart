import 'package:flutter/material.dart';
import 'package:flutter_application_1/shared/theme.dart';
import 'package:flutter_svg/svg.dart';

import '../../shared/app_svg.dart';

class AwardWidget extends StatelessWidget {
  final Color mainColor;
  final Map<String, dynamic>? award;
  final VoidCallback? ontap;
  final VoidCallback? ontapRoute;

  const AwardWidget({
    super.key,
    required this.mainColor,
    this.award,
    this.ontap,
    this.ontapRoute,
  });

  @override
  Widget build(BuildContext context) {
    final int totalLikes = award?['total_useful'] ?? 0;
    final String title = award?['title'] ?? '';
    final String subtitle = award?['teaser_text'] ?? '';

    return GestureDetector(
      onTap: ontapRoute,
      child: Container(
        margin: const EdgeInsets.only(bottom: defaultSpace),
        width: double.infinity,
        height: 110,
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(defaultSpace),
          ),
          boxShadow: [
            BoxShadow(
              color: blackColor.withOpacity(0.3),
              blurRadius: 2,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(defaultSpace),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: ontap,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: const Color(0xffbe185d),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color(0xffec4899),
                          width: 2,
                        ),
                      ),
                      child: SvgPicture.string(
                        AppSvg.liked,
                        width: 20,
                        color: whiteColor,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 5,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: mainColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      '$totalLikes Likes',
                      style: whiteTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: semibold,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      title,
                      style: blackTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.end,
                    ),
                    Text(
                      subtitle,
                      style: blackTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: light,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.end,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
