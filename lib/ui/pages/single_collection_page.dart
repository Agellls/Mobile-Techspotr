import 'package:cached_network_image/cached_network_image.dart';
import 'package:flexible_wrap/flexible_wrap.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../controllers/comparison_controller.dart';
import '../../routes/routes_name.dart';
import '../../shared/theme.dart';
import '../../utilities/loading.dart';
import '../widgets/button_text_menu.dart';
import '../widgets/search_forms.dart';
import '../widgets/single_products.dart';

class SingleCollectionPage extends StatelessWidget {
  SingleCollectionPage({super.key});

  final searchController = TextEditingController();
  final FocusNode searchFocusNode = FocusNode();
  final ComparisonController comparisonController =
      Get.put(ComparisonController());

  // GetX reactive drag state
  final RxInt dragOverSlot = (-1).obs;
  final RxBool isDragInProgress = false.obs;
  final String profileImageUrl = Get.arguments['profileImageUrl'] ?? '';
  final String profileName = Get.arguments['profileName'] ?? '';
  final int totalCollection = Get.arguments['totalProduct'] ?? 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Single Collection',
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
      body: Stack(
        children: [
          SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipOval(
                    child: CachedNetworkImage(
                      imageUrl: profileImageUrl,
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Shimmer.fromColors(
                        baseColor: whiteColor,
                        highlightColor: thirdtyColor,
                        child: const ShimmerPerProfile(),
                      ),
                      errorWidget: (context, url, error) => Image.network(
                        'https://icons.veryicon.com/png/o/business/new-vision-2/picture-loading-failed-1.png',
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: defaultSpace),
                  Text(
                    profileName,
                    style: blackTextStyle.copyWith(
                      fontSize: 20,
                      fontWeight: bold,
                    ),
                  ),
                  Text(
                    'Most Popular Television for Living Room by $profileName',
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: regular,
                    ),
                  ),
                  const SizedBox(height: defaultSpace),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: defaultSpace,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: SearchForms(
                      hintText: 'Search Products',
                      fillColor: secondaryColor,
                      controller: searchController,
                      focusNode: searchFocusNode,
                      isSearch: true,
                      onChanged: (value) {},
                      onClearPressed: () {
                        searchController.clear();
                        FocusScope.of(context).unfocus();
                      },
                    ),
                  ),
                  const SizedBox(height: defaultSpace),
                  const SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        SizedBox(
                          width: defaultSpace,
                        ),
                        ButtonTextMenu(
                          isActive: true,
                          text: 'Phone',
                        ),
                        ButtonTextMenu(
                          text: 'Refrigerator',
                        ),
                        ButtonTextMenu(
                          text: 'AC',
                        ),
                        ButtonTextMenu(
                          text: 'Washing Machine',
                        ),
                        SizedBox(
                          width: defaultSpace / 2,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: defaultSpace),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: defaultSpace / 2),
                    child: FlexibleWrap(
                      spacing: defaultSpace,
                      runSpacing: defaultSpace,
                      isOneRowExpanded: true,
                      children: [
                        SingleProducts(
                          id: '1',
                          productName: 'Samsung Galaxy S25',
                          productImage:
                              'https://m-cdn.phonearena.com/images/phones/84862-350/Samsung-Galaxy-S25.webp',
                          productRating: 8.3,
                          productPrice: [
                            999.99,
                            100.88,
                          ],
                          productPriceImages: [
                            'https://t0.gstatic.com/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&url=http://buywiseappliances.co.uk&size=128',
                            'https://t0.gstatic.com/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&url=http://buywiseappliances.co.uk&size=128',
                          ],
                          brandImage:
                              'https://brandlogos.net/wp-content/uploads/2014/08/samsung-logo-preview-400x400.png',
                          brandName: 'Samsung',
                        ),
                        SingleProducts(
                          id: '2',
                          productName: 'Apple iPhone 13 Pro Max',
                          productImage:
                              'https://m-cdn.phonearena.com/images/phones/82890-350/Apple-iPhone-13-Pro-Max.webp',
                          productPrice: [
                            999.99,
                            2100.44,
                          ],
                          productPriceImages: [
                            'https://t0.gstatic.com/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&url=http://buywiseappliances.co.uk&size=128',
                            'https://t0.gstatic.com/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&url=http://buywiseappliances.co.uk&size=128',
                          ],
                          productRating: 9.0,
                          brandImage:
                              'https://brandlogos.net/wp-content/uploads/2014/08/apple-logo-preview-400x400.png',
                          brandName: 'Apple',
                        ),
                        SingleProducts(
                          id: '3',
                          productName: 'Google Pixel 7 Pro',
                          productImage:
                              'https://m-cdn.phonearena.com/images/phones/80394-350/Google-Pixel-7-Pro.webp',
                          productPrice: [
                            899.99,
                            950.00,
                          ],
                          productPriceImages: [
                            'https://t0.gstatic.com/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&url=http://store.google.com&size=128',
                            'https://t0.gstatic.com/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&url=http://amazon.com&size=128',
                          ],
                          productRating: 8.5,
                          brandImage:
                              'https://brandlogos.net/wp-content/uploads/2020/11/google-logo-400x400.png',
                          brandName: 'Google',
                        ),
                        SingleProducts(
                          id: '4',
                          productName: 'Xiaomi Mi 12 Ultra',
                          productImage:
                              'https://m-cdn.phonearena.com/images/phones/82704-350/Xiaomi-Mi-12-Ultra.webp',
                          productPrice: [
                            799.99,
                            850.88,
                          ],
                          productPriceImages: [
                            'https://t0.gstatic.com/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&url=http://mi.com&size=128',
                            'https://t0.gstatic.com/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&url=http://ebay.com&size=128',
                          ],
                          productRating: 8.2,
                          brandImage:
                              'https://brandlogos.net/wp-content/uploads/2022/01/xiaomi_logo-400x400.png',
                          brandName: 'Xiaomi',
                        ),
                        SingleProducts(
                          id: '5',
                          productName: 'OnePlus 10 Pro',
                          productImage:
                              'https://m-cdn.phonearena.com/images/phones/83261-350/OnePlus-10-Pro.webp',
                          productPrice: [
                            749.99,
                            799.99,
                          ],
                          productPriceImages: [
                            'https://t0.gstatic.com/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&url=http://oneplus.com&size=128',
                            'https://t0.gstatic.com/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&url=http://bestbuy.com&size=128',
                          ],
                          productRating: 8.7,
                          brandImage:
                              'https://brandlogos.net/wp-content/uploads/2023/01/oneplus_logo-400x400.png',
                          brandName: 'OnePlus',
                        ),
                        SingleProducts(
                          id: '6',
                          productName: 'Sony Xperia 1 IV',
                          productImage:
                              'https://m-cdn.phonearena.com/images/phones/83953-350/Sony-Xperia-1-IV.webp',
                          productPrice: [
                            1099.99,
                            1199.99,
                          ],
                          productPriceImages: [
                            'https://t0.gstatic.com/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&url=http://sony.com&size=128',
                            'https://t0.gstatic.com/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&url=http://walmart.com&size=128',
                          ],
                          productRating: 8.1,
                          brandImage:
                              'https://brandlogos.net/wp-content/uploads/2020/11/sony-logo-400x400.png',
                          brandName: 'Sony',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: defaultSpace),
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 200,
            bottom: 0,
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(defaultSpace / 2),
                width: 70,
                height: 190,
                decoration: BoxDecoration(
                  color: thirdtyColor,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                child: Column(
                  children: [
                    DragTarget<Map<String, dynamic>>(
                      onWillAccept: (data) {
                        return !comparisonController.comparisonProducts
                            .any((p) => p['id'] == data?['id']);
                      },
                      onAccept: (data) {
                        comparisonController.addProduct(data, slotIndex: 0);
                      },
                      builder: (context, candidateData, rejectedData) {
                        final isHovering = candidateData.isNotEmpty;
                        final product = isHovering ? candidateData.first : null;
                        return Obx(() {
                          final hasProduct =
                              comparisonController.hasFirstProduct;
                          return AnimatedScale(
                            scale: isHovering ? 1.08 : 1.0,
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.easeOut,
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.easeOut,
                              height: 60,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: _getSlotColor(0),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                border: isHovering || dragOverSlot.value == 0
                                    ? Border.all(color: activeColor, width: 2)
                                    : null,
                                boxShadow: isHovering
                                    ? [
                                        BoxShadow(
                                          color: blackColor.withOpacity(0.3),
                                          blurRadius: 2,
                                          offset: const Offset(0, 1),
                                        ),
                                      ]
                                    : [],
                              ),
                              child: isHovering && product != null
                                  ? Center(
                                      child: Column(
                                        children: [
                                          const SizedBox(height: 5),
                                          Icon(
                                            Icons.add_circle,
                                            color: activeColor,
                                            size: 20,
                                          ),
                                          Text(
                                            'Product compare',
                                            style: blackTextStyle.copyWith(
                                              fontSize: 10,
                                            ),
                                            textAlign: TextAlign.center,
                                          )
                                        ],
                                      ),
                                    )
                                  : Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                if (hasProduct) {
                                                  comparisonController
                                                      .removeProductAt(0);
                                                } else {
                                                  // Handle adding product
                                                }
                                              },
                                              child: Icon(
                                                hasProduct
                                                    ? CupertinoIcons
                                                        .xmark_circle_fill
                                                    : CupertinoIcons.plus,
                                                color: _getSlotIconColor(0),
                                                size: 20,
                                              ),
                                            ),
                                            Text(
                                              'Product compare',
                                              style: blackTextStyle.copyWith(
                                                fontSize: 10,
                                                fontWeight: bold,
                                                color: _getSlotTextColor(0),
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                            ),
                          );
                        });
                      },
                    ),
                    const SizedBox(height: defaultSpace / 2),
                    DragTarget<Map<String, dynamic>>(
                      onWillAccept: (data) {
                        return !comparisonController.comparisonProducts
                            .any((p) => p['id'] == data?['id']);
                      },
                      onAccept: (data) {
                        comparisonController.addProduct(data, slotIndex: 1);
                      },
                      builder: (context, candidateData, rejectedData) {
                        final isHovering = candidateData.isNotEmpty;
                        final product = isHovering ? candidateData.first : null;
                        return Obx(() {
                          final hasProduct =
                              comparisonController.hasSecondProduct;
                          return AnimatedScale(
                            scale: isHovering ? 1.08 : 1.0,
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.easeOut,
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.easeOut,
                              height: 60,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: _getSlotColor(1),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                border: isHovering || dragOverSlot.value == 1
                                    ? Border.all(color: activeColor, width: 2)
                                    : null,
                                boxShadow: isHovering
                                    ? [
                                        BoxShadow(
                                          color: blackColor.withOpacity(0.3),
                                          blurRadius: 2,
                                          offset: const Offset(0, 1),
                                        ),
                                      ]
                                    : [],
                              ),
                              child: isHovering && product != null
                                  ? Center(
                                      child: Column(
                                        children: [
                                          const SizedBox(height: 5),
                                          Icon(
                                            Icons.add_circle,
                                            color: activeColor,
                                            size: 20,
                                          ),
                                          Text(
                                            'Product compare',
                                            style: blackTextStyle.copyWith(
                                              fontSize: 10,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    )
                                  : Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                if (hasProduct) {
                                                  comparisonController
                                                      .removeProductAt(1);
                                                } else {
                                                  // Handle adding product
                                                }
                                              },
                                              child: Icon(
                                                hasProduct
                                                    ? CupertinoIcons
                                                        .xmark_circle_fill
                                                    : CupertinoIcons.plus,
                                                color: _getSlotIconColor(1),
                                                size: 20,
                                              ),
                                            ),
                                            Text(
                                              'Product compare',
                                              style: blackTextStyle.copyWith(
                                                fontSize: 10,
                                                fontWeight: bold,
                                                color: _getSlotTextColor(1),
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                            ),
                          );
                        });
                      },
                    ),
                    const SizedBox(height: defaultSpace / 2),
                    Obx(
                      () => GestureDetector(
                        onTap: () {
                          if (comparisonController.canCompare) {
                            Get.toNamed(RouteName.compare);
                          } else {
                            Get.rawSnackbar(
                              duration: const Duration(seconds: 2),
                              message: 'Please add two products to compare',
                              borderRadius: 10,
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: inactiveColor,
                              margin: const EdgeInsets.only(
                                bottom: 20,
                                left: 20,
                                right: 20,
                              ),
                            );
                          }
                        },
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color: comparisonController.canCompare
                                ? compareColor
                                : Colors.grey.withOpacity(0.9),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                          child: Center(
                            child: Icon(
                              CupertinoIcons.arrow_up_left_arrow_down_right,
                              color: whiteColor,
                              size: 30,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color _getSlotColor(int slotIndex) {
    if (dragOverSlot.value == slotIndex) {
      return activeColor.withOpacity(0.7);
    }

    bool hasProduct = slotIndex == 0
        ? comparisonController.hasFirstProduct
        : comparisonController.hasSecondProduct;

    return hasProduct ? activeColor : whiteColor;
  }

  Color _getSlotIconColor(int slotIndex) {
    if (dragOverSlot.value == slotIndex) {
      return whiteColor;
    }

    bool hasProduct = slotIndex == 0
        ? comparisonController.hasFirstProduct
        : comparisonController.hasSecondProduct;

    return hasProduct ? whiteColor : activeColor;
  }

  Color _getSlotTextColor(int slotIndex) {
    if (dragOverSlot.value == slotIndex) {
      return whiteColor;
    }

    bool hasProduct = slotIndex == 0
        ? comparisonController.hasFirstProduct
        : comparisonController.hasSecondProduct;

    return hasProduct ? whiteColor : blackColor;
  }
}
