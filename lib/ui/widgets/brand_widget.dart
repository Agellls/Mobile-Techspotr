import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/routes/routes_name.dart';
import 'package:flutter_application_1/shared/theme.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../utilities/loading.dart';

class BrandWidget extends StatelessWidget {
  final String brandImageUrl;
  final String brandName;
  final int totalProduct;
  final String brandImageUrl1;
  final String brandImageUrl2;
  final String brandImageUrl3;
  final String brandImageUrl4;
  const BrandWidget({
    super.key,
    required this.brandImageUrl,
    required this.brandName,
    required this.totalProduct,
    this.brandImageUrl1 = '',
    this.brandImageUrl2 = '',
    this.brandImageUrl3 = '',
    this.brandImageUrl4 = '',
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
                    imageUrl: brandImageUrl,
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
                const SizedBox(width: defaultSpace),
                Text(
                  brandName,
                  style: blackTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: bold,
                  ),
                ),
                const Spacer(),
                Text(
                  totalProduct.toString(),
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: bold,
                  ),
                ),
                const SizedBox(width: defaultSpace / 2),
                Icon(
                  Icons.shopify_rounded,
                  color: blackColor,
                  size: 30,
                ),
              ],
            ),
            if (brandImageUrl1.isNotEmpty ||
                brandImageUrl2.isNotEmpty ||
                brandImageUrl3.isNotEmpty ||
                brandImageUrl4.isNotEmpty)
              const SizedBox(height: defaultSpace / 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: defaultSpace,
              children: [
                if (brandImageUrl1.isNotEmpty)
                  Container(
                    padding: const EdgeInsets.all(defaultSpace / 2),
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: blackColor,
                        width: 0.2,
                      ),
                    ),
                    child: Center(
                      child: CachedNetworkImage(
                        imageUrl: brandImageUrl1,
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => Shimmer.fromColors(
                          baseColor: whiteColor,
                          highlightColor: thirdtyColor,
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
                if (brandImageUrl2.isNotEmpty)
                  Container(
                    padding: const EdgeInsets.all(defaultSpace / 2),
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: blackColor,
                        width: 0.2,
                      ),
                    ),
                    child: Center(
                      child: CachedNetworkImage(
                        imageUrl: brandImageUrl2,
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => Shimmer.fromColors(
                          baseColor: whiteColor,
                          highlightColor: thirdtyColor,
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
                if (brandImageUrl3.isNotEmpty)
                  Container(
                    padding: const EdgeInsets.all(defaultSpace / 2),
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: blackColor,
                        width: 0.2,
                      ),
                    ),
                    child: Center(
                      child: CachedNetworkImage(
                        imageUrl: brandImageUrl3,
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => Shimmer.fromColors(
                          baseColor: whiteColor,
                          highlightColor: thirdtyColor,
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
                if (brandImageUrl4.isNotEmpty)
                  Container(
                    padding: const EdgeInsets.all(defaultSpace / 2),
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: blackColor,
                        width: 0.2,
                      ),
                    ),
                    child: Center(
                      child: CachedNetworkImage(
                        imageUrl: brandImageUrl4,
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => Shimmer.fromColors(
                          baseColor: whiteColor,
                          highlightColor: thirdtyColor,
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
                if (brandImageUrl1.isNotEmpty ||
                    brandImageUrl2.isNotEmpty ||
                    brandImageUrl3.isNotEmpty ||
                    brandImageUrl4.isNotEmpty)
                  GestureDetector(
                    onTap: () => Get.toNamed(RouteName.detailBrand, arguments: {
                      'brandImageUrl': brandImageUrl,
                      'brandName': brandName,
                      'totalProduct': totalProduct,
                    }),
                    child: Container(
                      width: 55,
                      height: 55,
                      padding: const EdgeInsets.symmetric(
                          vertical: defaultSpace / 2),
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: blackColor,
                          width: 0.2,
                        ),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.arrow_outward_sharp,
                          color: blackColor,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
