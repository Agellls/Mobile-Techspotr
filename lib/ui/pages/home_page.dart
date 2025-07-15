import 'package:flexible_wrap/flexible_wrap.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/shared/theme.dart';
import 'package:flutter_application_1/ui/widgets/button_text_menu.dart';
import 'package:flutter_application_1/ui/widgets/search_forms.dart';
import 'package:flutter_application_1/ui/widgets/single_products.dart';
import 'package:flutter_application_1/controllers/comparison_controller.dart';
import 'package:flutter_application_1/controllers/theme_controller.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

import '../../routes/routes_name.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final searchController = TextEditingController();
  final FocusNode searchFocusNode = FocusNode();
  final ComparisonController comparisonController =
      Get.put(ComparisonController());
  final ThemeController themeController = Get.find<ThemeController>();
  final box = GetStorage();

  // GetX reactive drag state
  final RxInt dragOverSlot = (-1).obs;
  final RxBool isDragInProgress = false.obs;

  // Sample product data - in a real app, you'd fetch this from an API
  final RxList<Map<String, dynamic>> allProducts = [
    {
      'id': '1',
      'productName': 'Samsung Galaxy S25',
      'productImage':
          'https://m-cdn.phonearena.com/images/phones/84862-350/Samsung-Galaxy-S25.webp',
      'productRating': 8.3,
      'productPrice': [999.99, 100.88],
      'productPriceImages': [
        'https://t0.gstatic.com/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&url=http://buywiseappliances.co.uk&size=128',
        'https://t0.gstatic.com/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&url=http://buywiseappliances.co.uk&size=128'
      ],
      'brandImage':
          'https://brandlogos.net/wp-content/uploads/2014/08/samsung-logo-preview-400x400.png',
      'brandName': 'Samsung',
    },
    {
      'id': '2',
      'productName': 'Apple iPhone 13 Pro Max',
      'productImage':
          'https://m-cdn.phonearena.com/images/phones/82890-350/Apple-iPhone-13-Pro-Max.webp',
      'productPrice': [999.99, 2100.44],
      'productPriceImages': [
        'https://t0.gstatic.com/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&url=http://buywiseappliances.co.uk&size=128',
        'https://t0.gstatic.com/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&url=http://buywiseappliances.co.uk&size=128'
      ],
      'productRating': 9.0,
      'brandImage':
          'https://brandlogos.net/wp-content/uploads/2014/08/apple-logo-preview-400x400.png',
      'brandName': 'Apple',
    },
    {
      'id': '3',
      'productName': 'Google Pixel 7 Pro',
      'productImage':
          'https://m-cdn.phonearena.com/images/phones/80394-350/Google-Pixel-7-Pro.webp',
      'productPrice': [899.99, 950.00],
      'productPriceImages': [
        'https://t0.gstatic.com/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&url=http://store.google.com&size=128',
        'https://t0.gstatic.com/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&url=http://amazon.com&size=128'
      ],
      'productRating': 8.5,
      'brandImage':
          'https://brandlogos.net/wp-content/uploads/2020/11/google-logo-400x400.png',
      'brandName': 'Google',
    },
    {
      'id': '4',
      'productName': 'Xiaomi Mi 12 Ultra',
      'productImage':
          'https://m-cdn.phonearena.com/images/phones/82704-350/Xiaomi-Mi-12-Ultra.webp',
      'productPrice': [799.99, 850.88],
      'productPriceImages': [
        'https://t0.gstatic.com/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&url=http://mi.com&size=128',
        'https://t0.gstatic.com/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&url=http://ebay.com&size=128'
      ],
      'productRating': 8.2,
      'brandImage':
          'https://brandlogos.net/wp-content/uploads/2022/01/xiaomi_logo-400x400.png',
      'brandName': 'Xiaomi',
    },
    {
      'id': '5',
      'productName': 'OnePlus 10 Pro',
      'productImage':
          'https://m-cdn.phonearena.com/images/phones/83261-350/OnePlus-10-Pro.webp',
      'productPrice': [749.99, 799.99],
      'productPriceImages': [
        'https://t0.gstatic.com/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&url=http://oneplus.com&size=128',
        'https://t0.gstatic.com/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&url=http://bestbuy.com&size=128'
      ],
      'productRating': 8.7,
      'brandImage':
          'https://brandlogos.net/wp-content/uploads/2023/01/oneplus_logo-400x400.png',
      'brandName': 'OnePlus',
    },
    {
      'id': '6',
      'productName': 'Sony Xperia 1 IV',
      'productImage':
          'https://m-cdn.phonearena.com/images/phones/83953-350/Sony-Xperia-1-IV.webp',
      'productPrice': [1099.99, 1199.99],
      'productPriceImages': [
        'https://t0.gstatic.com/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&url=http://sony.com&size=128',
        'https://t0.gstatic.com/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&url=http://walmart.com&size=128'
      ],
      'productRating': 8.1,
      'brandImage':
          'https://brandlogos.net/wp-content/uploads/2020/11/sony-logo-400x400.png',
      'brandName': 'Sony',
    },
  ].obs;

  // Filtered products list
  final RxList<Map<String, dynamic>> filteredProducts =
      <Map<String, dynamic>>[].obs;

  // Add this variable to track search state
  final RxBool isSearching = false.obs;

  // Filter products based on search query
  void filterProducts(String query) {
    isSearching.value = query.isNotEmpty;

    if (query.isEmpty) {
      filteredProducts.assignAll(allProducts);
    } else {
      final lowercaseQuery = query.toLowerCase();
      filteredProducts.assignAll(allProducts.where((product) {
        final productName = product['productName'].toString().toLowerCase();
        final brandName = product['brandName'].toString().toLowerCase();
        return productName.contains(lowercaseQuery) ||
            brandName.contains(lowercaseQuery);
      }).toList());
    }
  }

  @override
  Widget build(BuildContext context) {
    // Initialize filtered products with all products on first build
    if (filteredProducts.isEmpty) {
      filteredProducts.assignAll(allProducts);
    }

    return Obx(() => Container(
          color: themeController.currentPrimaryColor,
          child: SafeArea(
            child: Scaffold(
              backgroundColor: themeController.currentPrimaryColor,
              // Use a LayoutBuilder to ensure fixed positioning works correctly
              body: LayoutBuilder(
                builder: (context, constraints) {
                  return Stack(
                    // Explicitly set stack size to fill the available space
                    fit: StackFit.expand,
                    children: [
                      // Make the scrollable content respect the fixed panel
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(defaultSpace),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        SvgPicture.string(
                                          box.read('LogoImage'),
                                          width: 30,
                                        ),
                                        const Spacer(),
                                        Icon(
                                          CupertinoIcons.bell,
                                          color: blackColor,
                                          size: 30,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: defaultSpace / 2),
                                    Text(
                                      'Welcome to ${box.read('NameBrand')}',
                                      style: blackTextStyle.copyWith(
                                        fontSize: 16,
                                        fontWeight: regular,
                                        color:
                                            themeController.currentThirdtyColor,
                                      ),
                                    ),
                                    const SizedBox(height: defaultSpace),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: SearchForms(
                                        hintText: 'Search Products',
                                        fillColor: themeController
                                            .currentSecondaryColor,
                                        controller: searchController,
                                        focusNode: searchFocusNode,
                                        isSearch: true,
                                        onChanged: (value) {
                                          filterProducts(value);
                                        },
                                        onClearPressed: () {
                                          // This should completely clear the search
                                          searchController.clear();
                                          filterProducts('');
                                          FocusScope.of(context).unfocus();
                                          isSearching.value =
                                              false; // Explicitly set search state to false
                                        },
                                      ),
                                    ),
                                    // const SizedBox(height: defaultSpace),
                                    // Row(
                                    //   crossAxisAlignment: CrossAxisAlignment.start,
                                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    //   children: [
                                    //     Text(
                                    //       'All Products',
                                    //       style: blackTextStyle.copyWith(
                                    //         fontSize: 18,
                                    //         fontWeight: bold,
                                    //       ),
                                    //     ),
                                    //     Text(
                                    //       'See all',
                                    //       style: blackTextStyle.copyWith(
                                    //         fontSize: 14,
                                    //         fontWeight: bold,
                                    //       ),
                                    //     ),
                                    //   ],
                                    // ),
                                    const SizedBox(height: defaultSpace),
                                    const SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        children: [
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
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: defaultSpace / 2),
                                child: Obx(
                                  () => filteredProducts.isEmpty
                                      ? Center(
                                          child: Padding(
                                            padding: const EdgeInsets.all(20.0),
                                            child: Text(
                                              'No products found',
                                              style: blackTextStyle.copyWith(
                                                fontSize: 16,
                                                fontWeight: medium,
                                              ),
                                            ),
                                          ),
                                        )
                                      : FlexibleWrap(
                                          spacing: defaultSpace,
                                          runSpacing: defaultSpace,
                                          isOneRowExpanded: true,
                                          children:
                                              filteredProducts.map((product) {
                                            return SingleProducts(
                                              id: product['id'],
                                              productName:
                                                  product['productName'],
                                              productImage:
                                                  product['productImage'],
                                              productRating:
                                                  product['productRating'],
                                              productPrice: List<double>.from(
                                                  product['productPrice']),
                                              productPriceImages:
                                                  List<String>.from(product[
                                                      'productPriceImages']),
                                              brandImage: product['brandImage'],
                                              brandName: product['brandName'],
                                            );
                                          }).toList(),
                                        ),
                                ),
                              ),
                              const SizedBox(height: defaultSpace),
                            ],
                          ),
                        ),
                      ),

                      // Fixed comparison panel - position will stay constant
                      Positioned(
                        left: 0,
                        top: MediaQuery.of(context).size.height * 0.35,
                        child: Container(
                          padding: const EdgeInsets.all(defaultSpace / 2),
                          width: 70,
                          height: 190,
                          decoration: BoxDecoration(
                            color: themeController.currentThirdtyColor,
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                          ),
                          child: Column(
                            children: [
                              DragTarget<Map<String, dynamic>>(
                                onWillAccept: (data) {
                                  return !comparisonController
                                      .comparisonProducts
                                      .any((p) => p['id'] == data?['id']);
                                },
                                onAccept: (data) {
                                  comparisonController.addProduct(data,
                                      slotIndex: 0);
                                },
                                builder:
                                    (context, candidateData, rejectedData) {
                                  final isHovering = candidateData.isNotEmpty;
                                  final product =
                                      isHovering ? candidateData.first : null;
                                  return Obx(() {
                                    final hasProduct =
                                        comparisonController.hasFirstProduct;
                                    return AnimatedScale(
                                      scale: isHovering ? 1.08 : 1.0,
                                      duration:
                                          const Duration(milliseconds: 200),
                                      curve: Curves.easeOut,
                                      child: AnimatedContainer(
                                        duration:
                                            const Duration(milliseconds: 200),
                                        curve: Curves.easeOut,
                                        height: 60,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: _getSlotColor(0),
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                          border: isHovering ||
                                                  dragOverSlot.value == 0
                                              ? Border.all(
                                                  color: activeColor, width: 2)
                                              : null,
                                          boxShadow: isHovering
                                              ? [
                                                  BoxShadow(
                                                    color: blackColor
                                                        .withOpacity(0.3),
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
                                                      style: blackTextStyle
                                                          .copyWith(
                                                        fontSize: 10,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                    )
                                                  ],
                                                ),
                                              )
                                            : Stack(
                                                alignment: Alignment.center,
                                                children: [
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () {
                                                          if (hasProduct) {
                                                            comparisonController
                                                                .removeProductAt(
                                                                    0);
                                                          } else {
                                                            // Handle adding product
                                                          }
                                                        },
                                                        child: Icon(
                                                          hasProduct
                                                              ? CupertinoIcons
                                                                  .xmark_circle_fill
                                                              : CupertinoIcons
                                                                  .plus,
                                                          color:
                                                              _getSlotIconColor(
                                                                  0),
                                                          size: 20,
                                                        ),
                                                      ),
                                                      Text(
                                                        'Product compare',
                                                        style: blackTextStyle
                                                            .copyWith(
                                                          fontSize: 10,
                                                          fontWeight: bold,
                                                          color:
                                                              _getSlotTextColor(
                                                                  0),
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
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
                                  return !comparisonController
                                      .comparisonProducts
                                      .any((p) => p['id'] == data?['id']);
                                },
                                onAccept: (data) {
                                  comparisonController.addProduct(data,
                                      slotIndex: 1);
                                },
                                builder:
                                    (context, candidateData, rejectedData) {
                                  final isHovering = candidateData.isNotEmpty;
                                  final product =
                                      isHovering ? candidateData.first : null;
                                  return Obx(() {
                                    final hasProduct =
                                        comparisonController.hasSecondProduct;
                                    return AnimatedScale(
                                      scale: isHovering ? 1.08 : 1.0,
                                      duration:
                                          const Duration(milliseconds: 200),
                                      curve: Curves.easeOut,
                                      child: AnimatedContainer(
                                        duration:
                                            const Duration(milliseconds: 200),
                                        curve: Curves.easeOut,
                                        height: 60,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: _getSlotColor(1),
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                          border: isHovering ||
                                                  dragOverSlot.value == 1
                                              ? Border.all(
                                                  color: activeColor, width: 2)
                                              : null,
                                          boxShadow: isHovering
                                              ? [
                                                  BoxShadow(
                                                    color: blackColor
                                                        .withOpacity(0.3),
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
                                                      style: blackTextStyle
                                                          .copyWith(
                                                        fontSize: 10,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  ],
                                                ),
                                              )
                                            : Stack(
                                                alignment: Alignment.center,
                                                children: [
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () {
                                                          if (hasProduct) {
                                                            comparisonController
                                                                .removeProductAt(
                                                                    1);
                                                          } else {
                                                            // Handle adding product
                                                          }
                                                        },
                                                        child: Icon(
                                                          hasProduct
                                                              ? CupertinoIcons
                                                                  .xmark_circle_fill
                                                              : CupertinoIcons
                                                                  .plus,
                                                          color:
                                                              _getSlotIconColor(
                                                                  1),
                                                          size: 20,
                                                        ),
                                                      ),
                                                      Text(
                                                        'Product compare',
                                                        style: blackTextStyle
                                                            .copyWith(
                                                          fontSize: 10,
                                                          fontWeight: bold,
                                                          color:
                                                              _getSlotTextColor(
                                                                  1),
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
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
                                        message:
                                            'Please add two products to compare',
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
                                        CupertinoIcons
                                            .arrow_up_left_arrow_down_right,
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
                    ],
                  );
                },
              ),
            ),
          ),
        ));
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
