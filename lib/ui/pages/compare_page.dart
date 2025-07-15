import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/comparison_controller.dart';
import 'package:flutter_application_1/routes/routes_name.dart';
import 'package:flutter_application_1/shared/app_svg.dart';
import 'package:flutter_application_1/shared/theme.dart';
import 'package:flutter_application_1/ui/widgets/comparison_widget.dart';
import 'package:flutter_application_1/ui/widgets/opsi_button.dart';
import 'package:flutter_application_1/ui/widgets/store_button.dart';
import 'package:flutter_application_1/utilities/loading.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

// ignore: must_be_immutable
class ComparePage extends StatelessWidget {
  ComparePage({super.key});

  bool darkMode = false;
  bool useSides = true;
  double numberOfFeatures = 11;

  @override
  Widget build(BuildContext context) {
    final ComparisonController comparisonController = Get.find();
    var features = [
      "Specs",
      "Design",
      "Display",
      "Dimension",
      "Video",
      "Audio",
      "Smart Feature",
      "Game Feature",
      'Connectivity',
      'Accessories',
      'Power'
    ];
    var data = [
      [
        80,
        88,
        89,
        88,
        82,
        77,
        74,
        73,
        74,
        81,
        86
      ], // iPhone data (scaled to 0-35)
      [
        85,
        87,
        100,
        100,
        87,
        80,
        82,
        50,
        67,
        40,
        70
      ] // Poco data (scaled to 0-35)
    ];
    final TextEditingController reasonController = TextEditingController();
    final TextEditingController reactController = TextEditingController();

    features = features.sublist(0, numberOfFeatures.floor());
    data = data
        .map((graph) => graph.sublist(0, numberOfFeatures.floor()))
        .toList();

    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Compare Products',
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
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const SizedBox(width: defaultSpace),
                  Text(
                    'Selected products',
                    style: blackTextStyle.copyWith(
                      fontSize: 20,
                      fontWeight: extrabold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: defaultSpace / 2),
              if (comparisonController.comparisonProducts.isNotEmpty) ...[
                // comparison 1
                Obx(() {
                  final firstProduct =
                      comparisonController.comparisonProducts.isNotEmpty
                          ? comparisonController.comparisonProducts[0]
                          : null;

                  return firstProduct != null
                      ? Column(
                          children: [
                            Row(
                              children: [
                                const SizedBox(width: defaultSpace / 2),
                                CachedNetworkImage(
                                  imageUrl: firstProduct['productImage'] ??
                                      'https://icons.veryicon.com/png/o/business/new-vision-2/picture-loading-failed-1.png',
                                  width: 70,
                                  height: 70,
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) =>
                                      Shimmer.fromColors(
                                    baseColor: secondaryColor,
                                    highlightColor: thirdtyColor,
                                    child: const ShimmerPerProfile(),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      Image.network(
                                    'https://icons.veryicon.com/png/o/business/new-vision-2/picture-loading-failed-1.png',
                                    width: 70,
                                    height: 70,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(width: defaultSpace / 2),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          firstProduct['productName'] ??
                                              'Unknown Product',
                                          style: blackTextStyle.copyWith(
                                            fontWeight: bold,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          '8.7 Scores',
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
                                horizontal: defaultSpace,
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    padding:
                                        const EdgeInsets.all(defaultSpace / 2),
                                    decoration: BoxDecoration(
                                      color: secondaryColor,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: ClipOval(
                                      child: CachedNetworkImage(
                                        imageUrl: firstProduct['brandImage'] ??
                                            'https://icons.veryicon.com/png/o/business/new-vision-2/picture-loading-failed-1.png',
                                        width: 30,
                                        height: 30,
                                        fit: BoxFit.cover,
                                        placeholder: (context, url) =>
                                            Shimmer.fromColors(
                                          baseColor: secondaryColor,
                                          highlightColor: thirdtyColor,
                                          child: const ShimmerPerProfile(),
                                        ),
                                        errorWidget: (context, url, error) =>
                                            Image.network(
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
                                    firstProduct['brandName'] ??
                                        'Unknown Brand',
                                    style: blackTextStyle.copyWith(
                                      fontSize: 16,
                                      fontWeight: extrabold,
                                    ),
                                  ),
                                  const Spacer(),
                                  if (firstProduct['productPrice'] != null &&
                                      firstProduct['productPrice'] is List &&
                                      firstProduct['productPrice'].isNotEmpty)
                                    StoreButton(
                                      logoUrl: firstProduct[
                                                      'productPriceImages'] !=
                                                  null &&
                                              firstProduct['productPriceImages']
                                                  is List &&
                                              firstProduct['productPriceImages']
                                                  .isNotEmpty
                                          ? firstProduct['productPriceImages']
                                              [0]
                                          : 'https://t0.gstatic.com/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&url=http://buywiseappliances.co.uk&size=128',
                                      price: firstProduct['productPrice'][0],
                                      currency: '£',
                                    ),
                                  const SizedBox(width: 10),
                                  if (firstProduct['productPrice'] != null &&
                                      firstProduct['productPrice'] is List &&
                                      firstProduct['productPrice'].length > 1)
                                    StoreButton(
                                      logoUrl: firstProduct[
                                                      'productPriceImages'] !=
                                                  null &&
                                              firstProduct['productPriceImages']
                                                  is List &&
                                              firstProduct['productPriceImages']
                                                      .length >
                                                  1
                                          ? firstProduct['productPriceImages']
                                              [1]
                                          : 'https://t0.gstatic.com/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&url=http://buywiseappliances.co.uk&size=128',
                                      price: firstProduct['productPrice'][1],
                                      currency: '£',
                                    ),
                                ],
                              ),
                            ),
                          ],
                        )
                      : const SizedBox.shrink();
                }),
                const SizedBox(height: defaultSpace / 2),
                // versus line
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 1,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              blackColor.withOpacity(0.0), // 0% opacity left
                              blackColor.withOpacity(1.0), // 100% opacity right
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(defaultSpace),
                      decoration: BoxDecoration(
                        border: Border.all(color: blackColor, width: 1.5),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          'VS',
                          style: blackTextStyle.copyWith(
                            fontSize: 25,
                            fontWeight: bold,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 1,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.centerRight,
                            end: Alignment.centerLeft,
                            colors: [
                              blackColor.withOpacity(0.0), // 0% opacity left
                              blackColor.withOpacity(1.0), // 100% opacity right
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: defaultSpace / 2),
                // comparison 2
                Obx(() {
                  final secondProduct =
                      comparisonController.comparisonProducts.length > 1
                          ? comparisonController.comparisonProducts[1]
                          : null;

                  return secondProduct != null
                      ? Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const SizedBox(width: defaultSpace / 2),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          secondProduct['productName'] ??
                                              'Unknown Product',
                                          style: blackTextStyle.copyWith(
                                            fontWeight: bold,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const SizedBox(width: 5),
                                        Text(
                                          '8.5 Scores',
                                          style: blackTextStyle.copyWith(
                                            fontSize: 14,
                                            fontWeight: regular,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                CachedNetworkImage(
                                  imageUrl: secondProduct['productImage'] ??
                                      'https://icons.veryicon.com/png/o/business/new-vision-2/picture-loading-failed-1.png',
                                  width: 70,
                                  height: 70,
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) =>
                                      Shimmer.fromColors(
                                    baseColor: secondaryColor,
                                    highlightColor: thirdtyColor,
                                    child: const ShimmerPerProfile(),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      Image.network(
                                    'https://icons.veryicon.com/png/o/business/new-vision-2/picture-loading-failed-1.png',
                                    width: 70,
                                    height: 70,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(width: defaultSpace / 2),
                              ],
                            ),
                            const SizedBox(height: defaultSpace / 2),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: defaultSpace,
                              ),
                              child: Row(
                                children: [
                                  if (secondProduct['productPrice'] != null &&
                                      secondProduct['productPrice'] is List &&
                                      secondProduct['productPrice'].isNotEmpty)
                                    StoreButton(
                                      logoUrl: secondProduct[
                                                      'productPriceImages'] !=
                                                  null &&
                                              secondProduct[
                                                      'productPriceImages']
                                                  is List &&
                                              secondProduct[
                                                      'productPriceImages']
                                                  .isNotEmpty
                                          ? secondProduct['productPriceImages']
                                              [0]
                                          : 'https://t0.gstatic.com/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&url=http://buywiseappliances.co.uk&size=128',
                                      price: secondProduct['productPrice'][0],
                                      currency: '£',
                                    ),
                                  const SizedBox(width: 10),
                                  if (secondProduct['productPrice'] != null &&
                                      secondProduct['productPrice'] is List &&
                                      secondProduct['productPrice'].length > 1)
                                    StoreButton(
                                      logoUrl: secondProduct[
                                                      'productPriceImages'] !=
                                                  null &&
                                              secondProduct[
                                                      'productPriceImages']
                                                  is List &&
                                              secondProduct[
                                                          'productPriceImages']
                                                      .length >
                                                  1
                                          ? secondProduct['productPriceImages']
                                              [1]
                                          : 'https://t0.gstatic.com/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&url=http://buywiseappliances.co.uk&size=128',
                                      price: secondProduct['productPrice'][1],
                                      currency: '£',
                                    ),
                                  const Spacer(),
                                  Text(
                                    secondProduct['brandName'] ??
                                        'Unknown Brand',
                                    style: blackTextStyle.copyWith(
                                      fontSize: 16,
                                      fontWeight: semibold,
                                    ),
                                  ),
                                  const SizedBox(width: defaultSpace / 2),
                                  Container(
                                    padding:
                                        const EdgeInsets.all(defaultSpace / 2),
                                    decoration: BoxDecoration(
                                      color: secondaryColor,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: ClipOval(
                                      child: CachedNetworkImage(
                                        imageUrl: secondProduct['brandImage'] ??
                                            'https://icons.veryicon.com/png/o/business/new-vision-2/picture-loading-failed-1.png',
                                        width: 30,
                                        height: 30,
                                        fit: BoxFit.cover,
                                        placeholder: (context, url) =>
                                            Shimmer.fromColors(
                                          baseColor: secondaryColor,
                                          highlightColor: thirdtyColor,
                                          child: const ShimmerPerProfile(),
                                        ),
                                        errorWidget: (context, url, error) =>
                                            Image.network(
                                          'https://icons.veryicon.com/png/o/business/new-vision-2/picture-loading-failed-1.png',
                                          width: 30,
                                          height: 30,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      : const SizedBox.shrink();
                }),

                // Radar Chart
                // Container(
                //   height: 350,
                //   width: double.infinity,
                //   padding: const EdgeInsets.symmetric(
                //     horizontal: defaultSpace * 2,
                //     vertical: defaultSpace,
                //   ),
                //   decoration: BoxDecoration(
                //     color: primaryColor,
                //   ),
                //   child: Column(
                //     children: [
                //       Expanded(
                //         child: RadarChart.light(
                //           ticks: const [25, 50, 75, 100, 125],
                //           features: features,
                //           data: data,
                //           reverseAxis: false,
                //           useSides: useSides,
                //         ),
                //       ),
                //       // Legend
                //       Row(
                //         mainAxisAlignment: MainAxisAlignment.center,
                //         children: [
                //           Row(
                //             children: [
                //               Container(
                //                 width: 16,
                //                 height: 16,
                //                 decoration: BoxDecoration(
                //                   color: activeColor,
                //                   borderRadius: BorderRadius.circular(2),
                //                 ),
                //               ),
                //               const SizedBox(width: defaultSpace),
                //               ConstrainedBox(
                //                 constraints:
                //                     const BoxConstraints(maxWidth: 100),
                //                 child: Text(
                //                   comparisonController
                //                           .comparisonProducts.isNotEmpty
                //                       ? comparisonController
                //                                   .comparisonProducts[0]
                //                               ['productName'] ??
                //                           'Product 1'
                //                       : 'Product 1',
                //                   style: blackTextStyle.copyWith(
                //                     fontSize: 14,
                //                     fontWeight: bold,
                //                   ),
                //                   overflow: TextOverflow.ellipsis,
                //                   maxLines: 2, // allow up to 2 lines
                //                   softWrap: true,
                //                 ),
                //               ),
                //             ],
                //           ),
                //           const SizedBox(width: defaultSpace * 3),
                //           Row(
                //             children: [
                //               Container(
                //                 width: 16,
                //                 height: 16,
                //                 decoration: BoxDecoration(
                //                   color: compareColor,
                //                   borderRadius: BorderRadius.circular(2),
                //                 ),
                //               ),
                //               const SizedBox(width: defaultSpace),
                //               ConstrainedBox(
                //                 constraints:
                //                     const BoxConstraints(maxWidth: 100),
                //                 child: Text(
                //                   comparisonController
                //                               .comparisonProducts.length >
                //                           1
                //                       ? comparisonController
                //                                   .comparisonProducts[1]
                //                               ['productName'] ??
                //                           'Product 2'
                //                       : 'Product 2',
                //                   style: blackTextStyle.copyWith(
                //                     fontSize: 14,
                //                     fontWeight: bold,
                //                   ),
                //                   overflow: TextOverflow.ellipsis,
                //                   maxLines: 2, // allow up to 2 lines
                //                   softWrap: true,
                //                 ),
                //               ),
                //             ],
                //           ),
                //         ],
                //       ),
                //     ],
                //   ),
                // ),
                const SizedBox(height: defaultSpace),
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
                            child: Obx(() {
                              final comparisonController =
                                  Get.find<ComparisonController>();
                              final firstProduct = comparisonController
                                      .comparisonProducts.isNotEmpty
                                  ? comparisonController.comparisonProducts[0]
                                  : null;
                              final secondProduct = comparisonController
                                          .comparisonProducts.length >
                                      1
                                  ? comparisonController.comparisonProducts[1]
                                  : null;
                              return OpsiButton(
                                iconSvg: AppSvg.guide,
                                text: 'Guides',
                                ontap: () => Get.toNamed(
                                  RouteName.guides,
                                  arguments: {
                                    'firstProduct': firstProduct,
                                    'secondProduct': secondProduct,
                                    'isCompare': true,
                                  },
                                ),
                              );
                            }),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Obx(() {
                              final comparisonController =
                                  Get.find<ComparisonController>();
                              final firstProduct = comparisonController
                                      .comparisonProducts.isNotEmpty
                                  ? comparisonController.comparisonProducts[0]
                                  : null;
                              final secondProduct = comparisonController
                                          .comparisonProducts.length >
                                      1
                                  ? comparisonController.comparisonProducts[1]
                                  : null;
                              return OpsiButton(
                                iconSvg: AppSvg.review,
                                text: 'Reviews',
                                ontap: () => Get.toNamed(
                                  RouteName.review,
                                  arguments: {
                                    'firstProduct': firstProduct,
                                    'secondProduct': secondProduct,
                                    'isCompare': true,
                                  },
                                ),
                              );
                            }),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: Obx(() {
                              final comparisonController =
                                  Get.find<ComparisonController>();
                              final firstProduct = comparisonController
                                      .comparisonProducts.isNotEmpty
                                  ? comparisonController.comparisonProducts[0]
                                  : null;
                              final secondProduct = comparisonController
                                          .comparisonProducts.length >
                                      1
                                  ? comparisonController.comparisonProducts[1]
                                  : null;
                              return OpsiButton(
                                iconSvg: AppSvg.dicuss,
                                text: 'Discussions',
                                ontap: () => Get.toNamed(
                                  RouteName.discuss,
                                  arguments: {
                                    'firstProduct': firstProduct,
                                    'secondProduct': secondProduct,
                                    'isCompare': true,
                                  },
                                ),
                              );
                            }),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Obx(() {
                              final comparisonController =
                                  Get.find<ComparisonController>();
                              final firstProduct = comparisonController
                                      .comparisonProducts.isNotEmpty
                                  ? comparisonController.comparisonProducts[0]
                                  : null;
                              final secondProduct = comparisonController
                                          .comparisonProducts.length >
                                      1
                                  ? comparisonController.comparisonProducts[1]
                                  : null;
                              return OpsiButton(
                                iconSvg: AppSvg.award,
                                text: 'Awards',
                                ontap: () => Get.toNamed(
                                  RouteName.award,
                                  arguments: {
                                    'firstProduct': firstProduct,
                                    'secondProduct': secondProduct,
                                    'isCompare': true,
                                  },
                                ),
                              );
                            }),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Obx(() {
                        final comparisonController =
                            Get.find<ComparisonController>();
                        final firstProduct =
                            comparisonController.comparisonProducts.isNotEmpty
                                ? comparisonController.comparisonProducts[0]
                                : null;
                        final secondProduct =
                            comparisonController.comparisonProducts.length > 1
                                ? comparisonController.comparisonProducts[1]
                                : null;
                        return OpsiButton(
                          iconSvg: AppSvg.compare,
                          text: 'Comparisons',
                          fullWidth: true,
                          ontap: () => Get.toNamed(
                            RouteName.moreCompare,
                            arguments: {
                              'firstProduct': firstProduct,
                              'secondProduct': secondProduct,
                              'isCompare': true,
                            },
                          ),
                        );
                      }),
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
                                        const SizedBox(
                                            height: defaultSpace / 2),
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
                                            borderRadius:
                                                BorderRadius.circular(2),
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
                            switch (
                                comparisonController.selectedTabIndex.value) {
                              case 0:
                                return Column(
                                  children: [
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
                                      productName2: 'Iphone Pro Max 13',
                                      productSpec2: 'Amoled',
                                      productScore2: 92,
                                      totalLikes: 17,
                                      shareUrl: 'https://google.com/',
                                      isComparison: true,
                                      reasonController: reasonController,
                                      reactController: reactController,
                                    ),
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 15),
                                      height: 1,
                                      color: blackColor.withOpacity(0.2),
                                    ),
                                    ComparisonWidget(
                                      idComparison: 1,
                                      title: 'Display Quality',
                                      question:
                                          'Which device has better display quality?',
                                      votes: 45,
                                      productImage1:
                                          'https://m-cdn.phonearena.com/images/phones/84862-350/Samsung-Galaxy-S25.webp',
                                      productName1: 'Samsung Galaxy S25',
                                      productSpec1: 'QLED',
                                      productScore1: 88,
                                      productImage2:
                                          'https://m-cdn.phonearena.com/images/phones/82890-350/Apple-iPhone-13-Pro-Max.webp',
                                      productName2: 'Iphone Pro Max 13',
                                      productSpec2: 'Amoled',
                                      productScore2: 95,
                                      totalLikes: 17,
                                      shareUrl: 'https://google.com/',
                                      isComparison: true,
                                      reasonController: reasonController,
                                      reactController: reactController,
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
              ] else ...[
                const Icon(
                  CupertinoIcons.exclamationmark_circle,
                  size: 64,
                  color: Colors.grey,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Go back and add products by dragging them to the comparison area',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
                const Text(
                  'No products to compare',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
