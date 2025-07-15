import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/widgets/react_widget.dart';
import 'package:flutter_application_1/ui/widgets/report_widget.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shimmer/shimmer.dart';

import '../../shared/app_svg.dart';
import '../../shared/theme.dart';
import '../../utilities/loading.dart';

class ComparisonWidget extends StatelessWidget {
  final int idComparison;
  final String title;
  final String question;
  final int votes;
  final String productImage1;
  final String productName1;
  final String productSpec1;
  final int productScore1;
  final String productImage2;
  final String productName2;
  final String productSpec2;
  final int productScore2;
  final int totalLikes;
  final String shareUrl;
  final bool isComparison;
  final TextEditingController reasonController;
  final TextEditingController reactController;
  const ComparisonWidget({
    super.key,
    required this.idComparison,
    required this.title,
    required this.question,
    required this.votes,
    required this.productImage1,
    required this.productName1,
    required this.productSpec1,
    required this.productScore1,
    this.productImage2 = '',
    this.productName2 = '',
    this.productSpec2 = '',
    this.productScore2 = 0,
    required this.totalLikes,
    required this.shareUrl,
    required this.reasonController,
    required this.reactController,
    required this.isComparison,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: extrabold,
                color: activeColor,
              ),
            ),
            Text(
              '$votes VOTES',
              style: blackTextStyle.copyWith(
                fontSize: 14,
                fontWeight: bold,
                color: blackColor.withOpacity(0.6),
              ),
            ),
          ],
        ),
        const SizedBox(height: defaultSpace / 2),
        Text(
          question,
          style: blackTextStyle.copyWith(
            fontSize: 18,
            fontWeight: semibold,
          ),
        ),
        const SizedBox(height: defaultSpace / 2),
        Row(
          children: [
            CachedNetworkImage(
              imageUrl: productImage1,
              width: 45,
              height: 45,
              fit: BoxFit.cover,
              placeholder: (context, url) => Shimmer.fromColors(
                baseColor: secondaryColor,
                highlightColor: thirdtyColor,
                child: const ShimmerPerProfile(),
              ),
              errorWidget: (context, url, error) => Image.network(
                'https://icons.veryicon.com/png/o/business/new-vision-2/picture-loading-failed-1.png',
                width: 45,
                height: 45,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: defaultSpace / 2),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productName1,
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: regular,
                  ),
                ),
                Text(
                  productSpec1,
                  style: blackTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: bold,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SvgPicture.string(
                  AppSvg.scores,
                  width: 25,
                  color: Color(0xff84cc16),
                ),
                Text(
                  '$productScore1 Scores',
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: bold,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: defaultSpace),
        Row(
          children: [
            isComparison
                ? CachedNetworkImage(
                    imageUrl: productImage2,
                    width: 45,
                    height: 45,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Shimmer.fromColors(
                      baseColor: secondaryColor,
                      highlightColor: thirdtyColor,
                      child: const ShimmerPerProfile(),
                    ),
                    errorWidget: (context, url, error) => Image.network(
                      'https://icons.veryicon.com/png/o/business/new-vision-2/picture-loading-failed-1.png',
                      width: 45,
                      height: 45,
                      fit: BoxFit.cover,
                    ),
                  )
                : SvgPicture.string(
                    AppSvg.undefinedProduct,
                    height: 50,
                    color: compareColor,
                  ),
            const SizedBox(width: defaultSpace / 2),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productName2,
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: regular,
                  ),
                ),
                Text(
                  productSpec2,
                  style: blackTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: bold,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SvgPicture.string(
                  AppSvg.scores,
                  width: 25,
                  color: Color(0xffec4899),
                ),
                Text(
                  '$productScore2 Scores',
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: bold,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: defaultSpace),
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(
                defaultSpace / 2,
              ),
              decoration: BoxDecoration(
                color: activeColor.withOpacity(0.8),
                borderRadius: BorderRadius.circular(
                  100,
                ),
                border: Border.all(color: activeColor, width: 2),
              ),
              child: Row(
                children: [
                  Icon(
                    CupertinoIcons.heart,
                    size: 18,
                    color: whiteColor,
                  ),
                  const SizedBox(width: defaultSpace / 2),
                  Text(
                    '$totalLikes LIKE',
                    style: blackTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: bold,
                      color: whiteColor,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () => Share.share(
                  'Check this out, agellls has write reviews in troupon. you can view more here https://troupon.com/review'),
              child: Container(
                width: 35,
                height: 35,
                padding: EdgeInsets.all(defaultSpace / 2),
                decoration: BoxDecoration(
                  color: activeColor.withOpacity(0.8),
                  shape: BoxShape.circle,
                  border: Border.all(color: activeColor, width: 2),
                ),
                child: Center(
                  child: SvgPicture.string(
                    AppSvg.share,
                    width: 18,
                    color: whiteColor,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 5),
            GestureDetector(
              onTap: () => Get.bottomSheet(
                ReportWidget(reasonController: reasonController, id: 1),
                isScrollControlled: true,
              ),
              child: Container(
                width: 35,
                height: 35,
                padding: const EdgeInsets.all(defaultSpace / 2),
                decoration: BoxDecoration(
                  color: activeColor.withOpacity(0.8),
                  shape: BoxShape.circle,
                  border: Border.all(color: activeColor, width: 2),
                ),
                child: Center(
                  child: SvgPicture.string(
                    AppSvg.report,
                    width: 16,
                    color: whiteColor,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 5),
            GestureDetector(
              onTap: () => Get.bottomSheet(
                ReactWidget(
                  reactController: reactController,
                  id: 1,
                ),
                isScrollControlled: true,
              ),
              child: Container(
                padding: const EdgeInsets.all(defaultSpace / 2),
                decoration: BoxDecoration(
                  color: activeColor.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                    color: activeColor,
                    width: 2,
                  ),
                ),
                child: Row(
                  children: [
                    Text(
                      'REACT',
                      style: blackTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: bold,
                        color: whiteColor,
                      ),
                    ),
                    const SizedBox(width: defaultSpace / 2),
                    Icon(
                      Icons.chat_outlined,
                      size: 16,
                      color: whiteColor,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
