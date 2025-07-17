import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../shared/theme.dart';
import '../../utilities/loading.dart';

class ArticlesWidget extends StatelessWidget {
  final Color mainColor;
  final String title;
  final String timeLine;
  final String imageUrl;
  final String urlSourceName;

  const ArticlesWidget({
    super.key,
    required this.mainColor,
    required this.title,
    required this.timeLine,
    required this.imageUrl,
    required this.urlSourceName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: defaultSpace),
      width: double.infinity,
      height: 115,
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
      child: // Content
          Padding(
        padding: const EdgeInsets.all(defaultSpace),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: mainColor,
                      width: 2,
                    ),
                  ),
                  child: ClipOval(
                    child: CachedNetworkImage(
                      imageUrl: imageUrl,
                      width: 40,
                      height: 40,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Shimmer.fromColors(
                        baseColor: whiteColor,
                        highlightColor: Colors.grey.shade200,
                        child: const ShimmerPerProfile(),
                      ),
                      errorWidget: (context, url, error) => Image.network(
                        'https://icons.veryicon.com/png/o/business/new-vision-2/picture-loading-failed-1.png',
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                      ),
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
                    urlSourceName,
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
                    title, // Use the passed title
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.end,
                  ),
                  Text(
                    timeLine, // Use the passed timeLine
                    style: blackTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: light,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.end,
                  ),
                  const SizedBox(height: 5),
                  Container(
                    width: 150,
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
                          Icons.library_books_outlined,
                          color: Colors.white,
                        ),
                        const SizedBox(width: defaultSpace),
                        Text(
                          'View Article',
                          style: whiteTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
