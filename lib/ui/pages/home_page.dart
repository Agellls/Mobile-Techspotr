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

import '../../controllers/get_posts_controller.dart';
import '../../controllers/get_category_controller.dart';
import '../../routes/routes_name.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final TextEditingController searchController = TextEditingController();
  final FocusNode searchFocusNode = FocusNode();
  final ComparisonController comparisonController =
      Get.put(ComparisonController());
  final ThemeController themeController = Get.find<ThemeController>();
  final GetPostsController getPostsController = Get.put(GetPostsController());
  final GetCategoryController getCategoryController =
      Get.put(GetCategoryController());
  final box = GetStorage();

  // Add ScrollController for pagination
  final ScrollController scrollController = ScrollController();

  // GetX reactive drag state
  final RxInt dragOverSlot = (-1).obs;
  final RxBool isDragInProgress = false.obs;

  // Filtered products list
  final RxList<Map<String, dynamic>> filteredProducts =
      <Map<String, dynamic>>[].obs;

  // Add this variable to track search state
  final RxBool isSearching = false.obs;

  // Filter products based on search query
  void filterProducts(String query) {
    isSearching.value = query.isNotEmpty;
    getPostsController.filterPosts(query);
  }

  // Add clear search method
  void clearSearch() {
    // Force clear the text controller
    searchController.text = '';
    searchController.clear();
    // Clear the search in posts controller
    getPostsController.clearSearch();
    // Update local search state
    isSearching.value = false;
  }

  @override
  Widget build(BuildContext context) {
    // Setup scroll listener for pagination
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent - 200) {
        // Load more when user is 200px from bottom
        getPostsController.loadMorePosts();
      }
    });

    // Listen to search query changes to update text field
    ever(getPostsController.searchQuery, (String query) {
      if (query.isEmpty && searchController.text.isNotEmpty) {
        searchController.clear();
        isSearching.value = false;
      }
    });

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
                        child: RefreshIndicator(
                          onRefresh: () => getPostsController.refreshPosts(),
                          child: SingleChildScrollView(
                            controller: scrollController,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(defaultSpace),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                          color: themeController
                                              .currentThirdtyColor,
                                        ),
                                      ),
                                      const SizedBox(height: defaultSpace),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                                            clearSearch();
                                            FocusScope.of(context).unfocus();
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
                                      // Replace static categories with dynamic ones
                                      Obx(() {
                                        if (getCategoryController
                                            .isLoading.value) {
                                          return const SizedBox(
                                            height: 40,
                                            child: Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            ),
                                          );
                                        }

                                        if (getCategoryController
                                            .hasError.value) {
                                          return const SizedBox.shrink();
                                        }

                                        return SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            children: [
                                              // "All" category button
                                              Obx(() => ButtonTextMenu(
                                                    isActive: getCategoryController
                                                            .selectedCategoryId
                                                            .value ==
                                                        0,
                                                    text: 'All',
                                                    onTap: () {
                                                      getCategoryController
                                                          .selectCategory(0);
                                                      // Clear search with delay to ensure it happens after category switch
                                                      Future.delayed(
                                                          const Duration(
                                                              milliseconds:
                                                                  100), () {
                                                        clearSearch();
                                                      });
                                                    },
                                                  )),

                                              // Dynamic category buttons
                                              ...getCategoryController
                                                  .categories
                                                  .map((category) {
                                                return Obx(() => ButtonTextMenu(
                                                      isActive:
                                                          getCategoryController
                                                                  .selectedCategoryId
                                                                  .value ==
                                                              category['id'],
                                                      text: category['name'] ??
                                                          'Unknown',
                                                      onTap: () {
                                                        getCategoryController
                                                            .selectCategory(
                                                                category['id']);
                                                        // Clear search with delay to ensure it happens after category switch
                                                        Future.delayed(
                                                            const Duration(
                                                                milliseconds:
                                                                    100), () {
                                                          clearSearch();
                                                        });
                                                      },
                                                    ));
                                              }).toList(),
                                            ],
                                          ),
                                        );
                                      }),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: defaultSpace / 2),
                                  child: Obx(
                                    () {
                                      if (getPostsController.isLoading.value &&
                                          getPostsController.allPosts.isEmpty) {
                                        return const Center(
                                          child: Padding(
                                            padding: EdgeInsets.all(20.0),
                                            child: CircularProgressIndicator(),
                                          ),
                                        );
                                      }

                                      if (getPostsController.hasError.value) {
                                        return Center(
                                          child: Padding(
                                            padding: const EdgeInsets.all(20.0),
                                            child: Column(
                                              children: [
                                                Text(
                                                  'Error loading posts',
                                                  style:
                                                      blackTextStyle.copyWith(
                                                    fontSize: 16,
                                                    fontWeight: medium,
                                                  ),
                                                ),
                                                const SizedBox(height: 10),
                                                ElevatedButton(
                                                  onPressed: () =>
                                                      getPostsController
                                                          .refreshPosts(),
                                                  child: const Text('Retry'),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      }

                                      if (getPostsController
                                          .filteredPosts.isEmpty) {
                                        return Center(
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
                                        );
                                      }

                                      return Column(
                                        children: [
                                          FlexibleWrap(
                                            spacing: defaultSpace,
                                            runSpacing: defaultSpace,
                                            isOneRowExpanded: true,
                                            children: getPostsController
                                                .filteredPosts
                                                .map((product) {
                                              return SingleProducts(
                                                id: product['id']?.toString() ??
                                                    '',
                                                productName:
                                                    product['productName'] ??
                                                        'Unknown Product',
                                                productImage:
                                                    product['productImage'] ??
                                                        '',
                                                productRating:
                                                    (product['productRating'] ??
                                                            0.0)
                                                        .toDouble(),
                                                productPrice: List<double>.from(
                                                    product['productPrice'] ??
                                                        [0.0]),
                                                productPriceImages: List<
                                                    String>.from(product[
                                                        'productPriceImages'] ??
                                                    []),
                                                brandImage:
                                                    product['brandImage'] ?? '',
                                                brandName:
                                                    product['brandName'] ??
                                                        'Unknown Brand',
                                              );
                                            }).toList(),
                                          ),

                                          // Loading more indicator
                                          if (getPostsController
                                              .isLoadingMore.value)
                                            const Padding(
                                              padding: EdgeInsets.all(20.0),
                                              child:
                                                  CircularProgressIndicator(),
                                            ),

                                          // End of data indicator
                                          if (!getPostsController
                                                  .hasMoreData.value &&
                                              getPostsController
                                                  .allPosts.isNotEmpty)
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(20.0),
                                              child: Text(
                                                'No more products to load',
                                                style: blackTextStyle.copyWith(
                                                  fontSize: 14,
                                                  fontWeight: medium,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                                const SizedBox(height: defaultSpace),
                              ],
                            ),
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
