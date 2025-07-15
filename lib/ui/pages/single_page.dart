import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_radar_chart/flutter_radar_chart.dart';
import 'package:shimmer/shimmer.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../controllers/comparison_controller.dart';
import '../../controllers/single_product_controller.dart';
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
    final SingleProductController singleController =
        Get.put(SingleProductController());

    final args = Get.arguments ?? {};
    final String productId = args['id'] ?? '';

    // Fetch product details when page loads
    if (productId.isNotEmpty) {
      singleController.fetchProductDetails(productId);
    }

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
      body: Obx(() {
        if (singleController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (singleController.hasError.value) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Error loading product',
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () =>
                      singleController.fetchProductDetails(productId),
                  child: const Text('Retry'),
                ),
              ],
            ),
          );
        }

        return SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  const SizedBox(width: defaultSpace / 2),
                  CachedNetworkImage(
                    imageUrl: singleController.productImage,
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
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          singleController.productName + ' - ' + productId,
                          style: blackTextStyle.copyWith(
                            fontWeight: bold,
                            fontSize: 18,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          '${singleController.productRating.toStringAsFixed(1)} Scores',
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
                          imageUrl: singleController.brandImage,
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
                    Expanded(
                      child: Text(
                        singleController.brandName,
                        style: blackTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: extrabold,
                        ),
                      ),
                    ),
                    if (singleController.productPrices.isNotEmpty) ...[
                      StoreButton(
                        logoUrl: singleController.productPriceImages[0],
                        price: singleController.productPrices[0],
                        currency: '\$',
                        onTap: () async {
                          if (singleController.productPriceLinks.isNotEmpty) {
                            final url = singleController.productPriceLinks[0];
                            if (url.isNotEmpty &&
                                await canLaunchUrl(Uri.parse(url))) {
                              await launchUrl(Uri.parse(url),
                                  mode: LaunchMode.externalApplication);
                            }
                          }
                        },
                      ),
                      const SizedBox(width: 10),
                      if (singleController.productPrices.length > 1)
                        StoreButton(
                          logoUrl:
                              singleController.productPriceImages.length > 1
                                  ? singleController.productPriceImages[1]
                                  : singleController.productPriceImages[0],
                          price: singleController.productPrices[1],
                          currency: '\$',
                          onTap: () async {
                            if (singleController.productPriceLinks.length > 1) {
                              final url = singleController.productPriceLinks[1];
                              if (url.isNotEmpty &&
                                  await canLaunchUrl(Uri.parse(url))) {
                                await launchUrl(Uri.parse(url),
                                    mode: LaunchMode.externalApplication);
                              }
                            }
                          },
                        ),
                    ],
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
              const SizedBox(height: defaultSpace),
              // Dynamic Radar Chart from API
              Obx(() {
                if (singleController.chartData.isNotEmpty) {
                  return Container(
                    height: 350,
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: defaultSpace * 2,
                      vertical: defaultSpace,
                    ),
                    decoration: BoxDecoration(
                      color: primaryColor,
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: RadarChart.light(
                            ticks: const [25, 50, 75, 100],
                            features: singleController.simplifiedFeatures,
                            data: singleController.radarData,
                            reverseAxis: false,
                            useSides: true,
                          ),
                        ),
                        // Legend
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 16,
                                  height: 16,
                                  decoration: BoxDecoration(
                                    color: activeColor,
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                ),
                                const SizedBox(width: defaultSpace / 2),
                                ConstrainedBox(
                                  constraints:
                                      const BoxConstraints(maxWidth: 120),
                                  child: Text(
                                    singleController.productName,
                                    style: blackTextStyle.copyWith(
                                      fontSize: 14,
                                      fontWeight: bold,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    softWrap: true,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: defaultSpace * 2),
                            Row(
                              children: [
                                Container(
                                  width: 16,
                                  height: 16,
                                  decoration: BoxDecoration(
                                    color: compareColor,
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                ),
                                const SizedBox(width: defaultSpace / 2),
                                ConstrainedBox(
                                  constraints:
                                      const BoxConstraints(maxWidth: 120),
                                  child: Text(
                                    'Average Products',
                                    style: blackTextStyle.copyWith(
                                      fontSize: 14,
                                      fontWeight: bold,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    softWrap: true,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                } else {
                  // Fallback when no chart data available
                  return Container(
                    height: 200,
                    margin:
                        const EdgeInsets.symmetric(horizontal: defaultSpace),
                    decoration: BoxDecoration(
                      color: secondaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.analytics_outlined,
                            size: 60,
                            color: thirdtyColor,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Chart data is being updated',
                            style: blackTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: medium,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }
              }),

              const SizedBox(height: defaultSpace),
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
                    // Dynamic Menu Tabs from API
                    Obx(() {
                      if (singleController.specParents.isEmpty) {
                        return const SizedBox.shrink();
                      }

                      return Stack(
                        children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: List.generate(
                                  singleController.specParents.length, (index) {
                                final specParent =
                                    singleController.specParents[index];
                                final isActive =
                                    singleController.selectedTabIndex.value ==
                                        index;
                                return GestureDetector(
                                  onTap: () => singleController
                                      .selectedTabIndex.value = index,
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
                                          specParent['name'] ?? '',
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
                                            ? (specParent['name'].length * 8)
                                                .toDouble()
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
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 15),
                                    height: 1,
                                    color: blackColor.withOpacity(0.2),
                                  ),

                                  // example content 2
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 15),
                                    height: 1,
                                    color: blackColor.withOpacity(0.2),
                                  ),

                                  // example content 3
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
        );
      }),
    );
  }
}
