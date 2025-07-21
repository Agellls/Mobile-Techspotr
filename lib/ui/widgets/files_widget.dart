import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class FilesWidget extends StatelessWidget {
  final Color mainColor;
  final String title;
  final String timeLine;
  final VoidCallback? ontap;
  const FilesWidget(
      {super.key,
      required this.mainColor,
      required this.title,
      required this.timeLine,
      this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: 170,
        height: 220,
        padding: const EdgeInsets.all(defaultSpace),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: blackColor.withOpacity(0.3),
              blurRadius: 2,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: blackTextStyle.copyWith(
                fontSize: 14,
                fontWeight: bold,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              timeLine,
              style: blackTextStyle.copyWith(
                fontSize: 12,
                fontWeight: regular,
              ),
              textAlign: TextAlign.center,
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: defaultSpace,
                vertical: defaultSpace / 2,
              ),
              decoration: BoxDecoration(
                color: mainColor,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.file_present,
                    color: Colors.white,
                  ),
                  const SizedBox(width: defaultSpace),
                  Text(
                    'View Files',
                    style: whiteTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: bold,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              'Press the download button save this file',
              style: blackTextStyle.copyWith(
                fontSize: 12,
                fontWeight: regular,
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
