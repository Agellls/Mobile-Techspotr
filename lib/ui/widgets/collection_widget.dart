import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/widgets/report_widget.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shimmer/shimmer.dart';

import '../../routes/routes_name.dart';
import '../../shared/app_svg.dart';
import '../../shared/theme.dart';
import '../../utilities/loading.dart';

class CollectionWidget extends StatelessWidget {
  final String imageProfileUrl;
  final String profileName;
  final int totalCollection;
  final int totalItems;
  final Color mainColor;
  final String productImageUrl1;
  final String productImageUrl2;
  final String productImageUrl3;
  final String title;
  const CollectionWidget({
    super.key,
    required this.imageProfileUrl,
    required this.profileName,
    required this.totalCollection,
    required this.totalItems,
    required this.mainColor,
    this.productImageUrl1 = '',
    this.productImageUrl2 = '',
    this.productImageUrl3 = '',
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: defaultSpace),
      child: Container(
        padding: const EdgeInsets.all(defaultSpace / 2),
        decoration: BoxDecoration(
          color: primaryColor,
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
          children: [
            Row(
              children: [
                ClipOval(
                  child: CachedNetworkImage(
                    imageUrl: imageProfileUrl,
                    width: 55,
                    height: 55,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Shimmer.fromColors(
                      baseColor: whiteColor,
                      highlightColor: thirdtyColor,
                      child: const ShimmerPerProfile(),
                    ),
                    errorWidget: (context, url, error) => Image.network(
                      'https://icons.veryicon.com/png/o/business/new-vision-2/picture-loading-failed-1.png',
                      width: 55,
                      height: 55,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: defaultSpace / 2),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      profileName,
                      style: blackTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: bold,
                      ),
                    ),
                    Text(
                      '1 Collection',
                      style: blackTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: regular,
                        color: mainColor,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () =>
                      Get.toNamed(RouteName.singleCollection, arguments: {
                    'profileImageUrl': imageProfileUrl,
                    'profileName': profileName,
                    'totalCollection': totalCollection,
                  }),
                  child: Container(
                    height: 35,
                    padding: const EdgeInsets.symmetric(
                        horizontal: defaultSpace / 2),
                    decoration: BoxDecoration(
                      color: mainColor.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(60),
                      border: Border.all(color: mainColor, width: 2),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.remove_red_eye_outlined, color: whiteColor),
                        const SizedBox(width: defaultSpace / 2),
                        Text(
                          'Preview',
                          style: whiteTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: regular,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            if (productImageUrl1.isNotEmpty ||
                productImageUrl2.isNotEmpty ||
                productImageUrl3.isNotEmpty)
              const SizedBox(height: defaultSpace),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: defaultSpace,
              children: [
                if (productImageUrl1.isNotEmpty)
                  Container(
                    decoration: BoxDecoration(
                      color: whiteColor,
                    ),
                    child: Center(
                      child: CachedNetworkImage(
                        imageUrl: productImageUrl1,
                        width: 65,
                        height: 65,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => Shimmer.fromColors(
                          baseColor: whiteColor,
                          highlightColor: thirdtyColor,
                          child: const ShimmerPerProfile(),
                        ),
                        errorWidget: (context, url, error) => Image.network(
                          'https://icons.veryicon.com/png/o/business/new-vision-2/picture-loading-failed-1.png',
                          width: 65,
                          height: 65,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                if (productImageUrl2.isNotEmpty)
                  Container(
                    decoration: BoxDecoration(
                      color: whiteColor,
                    ),
                    child: Center(
                      child: CachedNetworkImage(
                        imageUrl: productImageUrl2,
                        width: 65,
                        height: 65,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => Shimmer.fromColors(
                          baseColor: whiteColor,
                          highlightColor: thirdtyColor,
                          child: const ShimmerPerProfile(),
                        ),
                        errorWidget: (context, url, error) => Image.network(
                          'https://icons.veryicon.com/png/o/business/new-vision-2/picture-loading-failed-1.png',
                          width: 65,
                          height: 65,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                if (productImageUrl3.isNotEmpty)
                  Container(
                    decoration: BoxDecoration(
                      color: whiteColor,
                    ),
                    child: Center(
                      child: CachedNetworkImage(
                        imageUrl: productImageUrl3,
                        width: 65,
                        height: 65,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => Shimmer.fromColors(
                          baseColor: whiteColor,
                          highlightColor: thirdtyColor,
                          child: const ShimmerPerProfile(),
                        ),
                        errorWidget: (context, url, error) => Image.network(
                          'https://icons.veryicon.com/png/o/business/new-vision-2/picture-loading-failed-1.png',
                          width: 65,
                          height: 65,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                Container(
                  width: 65,
                  height: 65,
                  decoration: BoxDecoration(
                    color: whiteColor,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        totalItems.toString(),
                        style: blackTextStyle.copyWith(
                          fontSize: 28,
                          fontWeight: bold,
                        ),
                      ),
                      Text(
                        'ITEMS',
                        style: blackTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: regular,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: defaultSpace),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultSpace / 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      title,
                      style: blackTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: bold,
                      ),
                    ),
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
                          ReportWidget(
                              reasonController: TextEditingController(), id: 1),
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
          ],
        ),
      ),
    );
  }
}
