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

class AwardResponseWidget extends StatelessWidget {
  final Color mainColor;
  AwardResponseWidget({super.key, required this.mainColor});

  final TextEditingController reasonController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: defaultSpace,
        vertical: defaultSpace / 2,
      ),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(defaultSpace),
        boxShadow: [
          BoxShadow(
            color: blackColor.withOpacity(0.5),
            blurRadius: 1,
            offset: const Offset(0, 0),
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
                    imageUrl:
                        'https://wallpapers.com/images/featured-full/cool-profile-picture-87h46gcobjl5e4xu.jpg',
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
                      'John Doe',
                      style: blackTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: bold,
                      ),
                    ),
                    Text(
                      '1 Reactions',
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
                  '2 days ago',
                  style: blackTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: regular,
                    color: blackColor,
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: defaultSpace / 2, vertical: defaultSpace / 2),
            child: Text(
              'Think to get this one for our new home.',
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: regular,
              ),
            ),
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
                      '0 Likes',
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
