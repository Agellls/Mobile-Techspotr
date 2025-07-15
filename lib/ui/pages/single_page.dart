import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:get/get.dart';

import '../../controllers/comparison_controller.dart';
import '../../routes/routes_name.dart';
import '../../shared/app_svg.dart';
import '../../shared/theme.dart';
import '../../utilities/loading.dart';
import '../widgets/comparison_widget.dart';
import '../widgets/opsi_button.dart';
import '../widgets/store_button.dart';

class SinglePage extends StatelessWidget {
  const SinglePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ComparisonController comparisonController = Get.find();
    final args = Get.arguments ?? {};
    final String productName = args['productName'] ?? 'Unknown Product';
    final String productImage = args['productImage'] ??
        'https://icons.veryicon.com/png/o/business/new-vision-2/picture-loading-failed-1.png';
    final double productRating = (args['productRating'] ?? 0).toDouble();
    final String brandName = args['brandName'] ?? 'Unknown Brand';
    final String brandImage = args['brandImage'] ??
        'https://icons.veryicon.com/png/o/business/new-vision-2/picture-loading-failed-1.png';
    final List<dynamic> productPrice = args['productPrice'] ?? [499.99, 499.99];
    final List<dynamic> productPriceImages = args['productPriceImages'] ??
        [
          'https://t0.gstatic.com/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&url=http://buywiseappliances.co.uk&size=128',
          'https://t0.gstatic.com/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&url=http://buywiseappliances.co.uk&size=128'
        ];
    final TextEditingController reasonController = TextEditingController();
    final TextEditingController reactController = TextEditingController();

    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Single Products',
          style: blackTextStyle.copyWith(
            fontSize: 22,
            fontWeight: extrabold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.close,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        foregroundColor: blackColor,
        surfaceTintColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                const SizedBox(width: defaultSpace / 2),
                CachedNetworkImage(
                  imageUrl: productImage,
                  width: 70,
                  height: 70,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Shimmer.fromColors(
                    baseColor: secondaryColor,
                    highlightColor: thirdtyColor,
                    child: const ShimmerPerProfile(),
                  ),
                  errorWidget: (context, url, error) => Image.network(
                    'https://icons.veryicon.com/png/o/business/new-vision-2/picture-loading-failed-1.png',
                    width: 70,
                    height: 70,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: defaultSpace / 2),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          productName,
                          style: blackTextStyle.copyWith(
                            fontWeight: bold,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '${productRating.toStringAsFixed(1)} Scores',
                          style: blackTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: regular,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: defaultSpace / 2),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: defaultSpace / 1.3,
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(defaultSpace / 2),
                    decoration: BoxDecoration(
                      color: secondaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ClipOval(
                      child: CachedNetworkImage(
                        imageUrl: brandImage,
                        width: 30,
                        height: 30,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => Shimmer.fromColors(
                          baseColor: secondaryColor,
                          highlightColor: thirdtyColor,
                          child: const ShimmerPerProfile(),
                        ),
                        errorWidget: (context, url, error) => Image.network(
                          'https://icons.veryicon.com/png/o/business/new-vision-2/picture-loading-failed-1.png',
                          width: 30,
                          height: 30,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: defaultSpace / 2),
                  Text(
                    brandName,
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: extrabold,
                    ),
                  ),
                  const Spacer(),
                  StoreButton(
                    logoUrl: productPriceImages.isNotEmpty
                        ? productPriceImages[0]
                        : 'https://t0.gstatic.com/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&url=http://buywiseappliances.co.uk&size=128',
                    price: productPrice.isNotEmpty
                        ? (productPrice[0] is num
                            ? productPrice[0].toDouble()
                            : 499.99)
                        : 499.99,
                    currency: '£',
                  ),
                  const SizedBox(width: 10),
                  StoreButton(
                    logoUrl: productPriceImages.length > 1
                        ? productPriceImages[1]
                        : 'https://t0.gstatic.com/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&url=http://buywiseappliances.co.uk&size=128',
                    price: productPrice.length > 1
                        ? (productPrice[1] is num
                            ? productPrice[1].toDouble()
                            : 499.99)
                        : 499.99,
                    currency: '£',
                  ),
                ],
              ),
            ),
            const SizedBox(height: defaultSpace / 2),
            // opsi menu
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: OpsiButton(
                          iconSvg: AppSvg.guide,
                          text: 'Guides',
                          ontap: () => Get.toNamed(RouteName.guides),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: OpsiButton(
                          iconSvg: AppSvg.review,
                          text: 'Reviews',
                          ontap: () => Get.toNamed(
                            RouteName.review,
                            arguments: {'isCompare': false},
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: OpsiButton(
                          iconSvg: AppSvg.dicuss,
                          text: 'Discussions',
                          ontap: () => Get.toNamed(
                            RouteName.discuss,
                            arguments: {'isCompare': false},
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: OpsiButton(
                          iconSvg: AppSvg.award,
                          text: 'Awards',
                          ontap: () => Get.toNamed(RouteName.award),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  OpsiButton(
                    iconSvg: AppSvg.compare,
                    text: 'Comparisons',
                    fullWidth: true,
                    ontap: () => Get.toNamed(RouteName.moreCompare),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: defaultSpace,
              ),
              width: double.infinity,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Menu Tabs
                  Obx(() {
                    final tabs = [
                      'General Specifications',
                      'Performance',
                      'Camera',
                      'Battery',
                    ];
                    final RxInt selectedTab =
                        comparisonController.selectedTabIndex;
                    return Stack(
                      children: [
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(tabs.length, (index) {
                              final isActive = selectedTab.value == index;
                              return GestureDetector(
                                onTap: () => selectedTab.value = index,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        bottom: 3,
                                        left: defaultSpace / 2,
                                        right: defaultSpace / 2,
                                      ),
                                      child: Text(
                                        tabs[index],
                                        style: blackTextStyle.copyWith(
                                          fontSize: 16,
                                          fontWeight: extrabold,
                                          color: isActive
                                              ? blackColor
                                              : blackColor.withOpacity(0.6),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: defaultSpace / 2),
                                    AnimatedContainer(
                                      duration:
                                          const Duration(milliseconds: 200),
                                      height: 3,
                                      width: isActive
                                          ? (tabs[index].length * 8)
                                          : 0,
                                      decoration: BoxDecoration(
                                        color: isActive
                                            ? blackColor
                                            : Colors.transparent,
                                        borderRadius: BorderRadius.circular(2),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 36),
                          height: 1,
                          color: blackColor.withOpacity(0.2),
                        ),
                      ],
                    );
                  }),
                  const SizedBox(height: defaultSpace),
                  // Tab Content
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: defaultSpace / 2,
                    ),
                    child: Obx(
                      () {
                        switch (comparisonController.selectedTabIndex.value) {
                          case 0:
                            return Column(
                              children: [
                                // example content 1
                                ComparisonWidget(
                                  idComparison: 1,
                                  title: 'Refrigerator Type',
                                  question:
                                      'Whats the type of this refigerator ?',
                                  votes: 21,
                                  productImage1:
                                      'https://m-cdn.phonearena.com/images/phones/84862-350/Samsung-Galaxy-S25.webp',
                                  productName1: 'Samsung Galaxy S25',
                                  productSpec1: 'QLED',
                                  productScore1: 90,
                                  productImage2:
                                      'https://m-cdn.phonearena.com/images/phones/82890-350/Apple-iPhone-13-Pro-Max.webp',
                                  productName2: 'Phone in this rangge',
                                  productSpec2: 'QLED',
                                  productScore2: 80,
                                  totalLikes: 17,
                                  shareUrl: 'https://google.com/',
                                  reasonController: reasonController,
                                  reactController: reactController,
                                  isComparison: false,
                                ),
                                Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 15),
                                  height: 1,
                                  color: blackColor.withOpacity(0.2),
                                ),

                                // example content 2
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Available Colors',
                                            style: blackTextStyle.copyWith(
                                              fontSize: 14,
                                              fontWeight: extrabold,
                                              color: thirdtyColor,
                                            ),
                                          ),
                                          const SizedBox(height: 5),
                                          Text(
                                            'Stainless Steel',
                                            style: blackTextStyle.copyWith(
                                              fontSize: 14,
                                              fontWeight: regular,
                                            ),
                                          ),
                                          const SizedBox(height: 5),
                                          Text(
                                            'Fingerprint Resistant Stainless Steel',
                                            style: blackTextStyle.copyWith(
                                              fontSize: 14,
                                              fontWeight: regular,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Flexible(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            'Refrigerant Type',
                                            style: blackTextStyle.copyWith(
                                              fontSize: 14,
                                              fontWeight: extrabold,
                                              color: thirdtyColor,
                                            ),
                                          ),
                                          const SizedBox(height: 5),
                                          Text(
                                            'R-600A',
                                            style: blackTextStyle.copyWith(
                                              fontSize: 14,
                                              fontWeight: regular,
                                            ),
                                          ),
                                          const SizedBox(height: 5),
                                          Text(
                                            'R-600A',
                                            style: blackTextStyle.copyWith(
                                              fontSize: 14,
                                              fontWeight: regular,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 15),
                                  height: 1,
                                  color: blackColor.withOpacity(0.2),
                                ),

                                // example content 3
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Condenser Type',
                                            style: blackTextStyle.copyWith(
                                              fontSize: 14,
                                              fontWeight: extrabold,
                                              color: thirdtyColor,
                                            ),
                                          ),
                                          const SizedBox(height: 5),
                                          Text(
                                            'Air-cooled',
                                            style: blackTextStyle.copyWith(
                                              fontSize: 14,
                                              fontWeight: regular,
                                            ),
                                          ),
                                          const SizedBox(height: 5),
                                          Text(
                                            'Air-cooled',
                                            style: blackTextStyle.copyWith(
                                              fontSize: 14,
                                              fontWeight: regular,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Flexible(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            'Door Style Configuration',
                                            style: blackTextStyle.copyWith(
                                              fontSize: 14,
                                              fontWeight: extrabold,
                                              color: thirdtyColor,
                                            ),
                                          ),
                                          const SizedBox(height: 5),
                                          Text(
                                            'Side-by-Side',
                                            style: blackTextStyle.copyWith(
                                              fontSize: 14,
                                              fontWeight: regular,
                                            ),
                                          ),
                                          const SizedBox(height: 5),
                                          Text(
                                            'French Door',
                                            style: blackTextStyle.copyWith(
                                              fontSize: 14,
                                              fontWeight: regular,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            );
                          case 1:
                            return Row(
                              children: [
                                Text(
                                  'Performance',
                                  style: blackTextStyle,
                                ),
                              ],
                            );
                          case 2:
                            return Row(
                              children: [
                                Text(
                                  'Camera',
                                  style: blackTextStyle,
                                ),
                              ],
                            );
                          case 3:
                            return Row(
                              children: [
                                Text(
                                  'Battery',
                                  style: blackTextStyle,
                                ),
                              ],
                            );
                          default:
                            return const SizedBox.shrink();
                        }
                      },
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
