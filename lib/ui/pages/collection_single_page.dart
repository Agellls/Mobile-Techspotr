import 'package:cached_network_image/cached_network_image.dart';
import 'package:flexible_wrap/flexible_wrap.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../controllers/collection_single_controller.dart';
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
  final CollectionSingleController collectionController =
      Get.put(CollectionSingleController());
  final RxInt dragOverSlot = (-1).obs;
  final RxBool isDragInProgress = false.obs;

  // Use a static Set to track fetched collections (prevents multiple fetches)
  static final Set<int> _fetchedIds = {};

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments ?? {};
    final int collectionId = args['collectionId'] ?? 5;
    final String profileImageUrl = args['profileImageUrl'] ?? '';
    final String profileName = args['profileName'] ?? '';

    // Only fetch once per collectionId
    if (!_fetchedIds.contains(collectionId)) {
      collectionController.fetchSingleCollection(collectionId);
      _fetchedIds.add(collectionId);
    }

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
                      onChanged: (value) {
                        collectionController.filterItems(value);
                      },
                      onClearPressed: () {
                        searchController.clear();
                        FocusScope.of(context).unfocus();
                        collectionController.clearSearch();
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
                  // Replace hardcoded SingleProducts with dynamic list
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: defaultSpace / 2),
                    child: Obx(() {
                      if (collectionController.isLoading.value) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (collectionController.error.value != null) {
                        return Center(
                            child: Text(
                                'Error: ${collectionController.error.value}'));
                      }
                      // Use filteredItems for displaying products
                      final items = collectionController.filteredItems;
                      if (items.isEmpty) {
                        return const Center(child: Text('No products found.'));
                      }
                      return FlexibleWrap(
                        spacing: defaultSpace,
                        runSpacing: defaultSpace,
                        isOneRowExpanded: true,
                        children: items.map<Widget>((product) {
                          final brand = product['brand'] ?? {};
                          return SingleProducts(
                            id: product['id'].toString(),
                            productName: product['productName'] ?? '',
                            productImage:
                                product['productImage'] ?? brand['image'] ?? '',
                            productRating: product['productRating'] ?? 0.0,
                            productPrice: product['productPrice'] ?? [],
                            productPriceImages:
                                product['productPriceImages'] ?? [],
                            brandImage: product['brandImage'] ?? '',
                            brandName: product['brandName'] ?? '',
                            isCanSingle: false,
                          );
                        }).toList(),
                      );
                    }),
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
