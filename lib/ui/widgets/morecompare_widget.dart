import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/shared/app_svg.dart';
import 'package:flutter_application_1/ui/widgets/report_widget.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shimmer/shimmer.dart';

import '../../shared/theme.dart';
import '../../utilities/loading.dart';

class MorecompareWidget extends StatelessWidget {
  final Color mainColor;
  final String name;
  final String timedate;
  final String profileImageUrl;
  final String imagePost1;
  final String imagePost2;
  final int totalCompare;
  final int totalLikes;
  MorecompareWidget({
    super.key,
    required this.mainColor,
    required this.name,
    required this.timedate,
    required this.profileImageUrl,
    required this.imagePost1,
    required this.imagePost2,
    required this.totalCompare,
    required this.totalLikes,
  });

  final TextEditingController reasonController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
          bottom: defaultSpace, left: defaultSpace, right: defaultSpace),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: defaultSpace),
          // header row
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultSpace),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipOval(
                  child: CachedNetworkImage(
                    imageUrl: profileImageUrl,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Shimmer.fromColors(
                      baseColor: secondaryColor,
                      highlightColor: thirdtyColor,
                      child: const ShimmerPerProfile(),
                    ),
                    errorWidget: (context, url, error) => Image.network(
                      'https://icons.veryicon.com/png/o/business/new-vision-2/picture-loading-failed-1.png',
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: defaultSpace),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: blackTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: bold,
                      ),
                    ),
                    Text(
                      '$totalCompare Comparison',
                      style: blackTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: regular,
                        color: mainColor,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Text(
                  timedate,
                  style: blackTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: regular,
                    color: blackColor,
                  ),
                ),
              ],
            ),
          ),

          // product comparison section
          const SizedBox(height: defaultSpace),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultSpace),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // product 1
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CachedNetworkImage(
                        imageUrl: imagePost1,
                        width: 120,
                        height: 120,
                        placeholder: (context, url) => Shimmer.fromColors(
                          baseColor: secondaryColor,
                          highlightColor: thirdtyColor,
                          child: const ShimmerPerProfile(),
                        ),
                        errorWidget: (context, url, error) => Image.network(
                          'https://icons.veryicon.com/png/o/business/new-vision-2/picture-loading-failed-1.png',
                          width: 120,
                          height: 120,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
                // versus line
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 1,
                      height: 80,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            blackColor.withOpacity(0.0), // 0% opacity bottom
                            blackColor.withOpacity(1.0), // 100% opacity top
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(defaultSpace / 2),
                      decoration: BoxDecoration(
                        border: Border.all(color: blackColor, width: 1.5),
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Center(
                        child: Text(
                          'VS',
                          style: blackTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: bold,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 1,
                      height: 80,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            blackColor.withOpacity(1.0), // 100% opacity bottom
                            blackColor.withOpacity(0.0), // 0% opacity top
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                // product 2
                Expanded(
                  child: Column(
                    children: [
                      CachedNetworkImage(
                        imageUrl: imagePost2,
                        width: 120,
                        height: 120,
                        placeholder: (context, url) => Shimmer.fromColors(
                          baseColor: secondaryColor,
                          highlightColor: thirdtyColor,
                          child: const ShimmerPerProfile(),
                        ),
                        errorWidget: (context, url, error) => Image.network(
                          'https://icons.veryicon.com/png/o/business/new-vision-2/picture-loading-failed-1.png',
                          width: 120,
                          height: 120,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Divider(
            color: blackColor.withOpacity(0.3),
            height: 15,
          ),

          // function
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultSpace / 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 35,
                      height: 35,
                      padding: const EdgeInsets.all(defaultSpace / 2),
                      decoration: BoxDecoration(
                        color: mainColor.withOpacity(0.8),
                        shape: BoxShape.circle,
                        border: Border.all(color: mainColor, width: 2),
                      ),
                      child: Center(
                        child: SvgPicture.string(
                          AppSvg.liked,
                          width: 20,
                          color: whiteColor,
                        ),
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      '$totalLikes Likes',
                      style: blackTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: regular,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => Share.share(
                          'Check this out, agellls has write reviews in troupon. you can view more here https://troupon.com/review'),
                      child: Container(
                        width: 35,
                        height: 35,
                        padding: const EdgeInsets.all(defaultSpace / 2),
                        decoration: BoxDecoration(
                          color: mainColor.withOpacity(0.8),
                          shape: BoxShape.circle,
                          border: Border.all(color: mainColor, width: 2),
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
                          color: mainColor.withOpacity(0.8),
                          shape: BoxShape.circle,
                          border: Border.all(color: mainColor, width: 2),
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
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: defaultSpace / 2),
        ],
      ),
    );
  }
}
