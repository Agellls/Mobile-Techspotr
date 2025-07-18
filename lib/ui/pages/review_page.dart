import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/reviews_menu_controller.dart';
import 'package:flutter_application_1/controllers/get_review_controller.dart';
import 'package:flutter_application_1/controllers/get_attribute_controller.dart';
import 'package:flutter_application_1/shared/theme.dart';
import 'package:flutter_application_1/ui/widgets/review_widget.dart';
import 'package:flutter_application_1/ui/widgets/total_rating.dart';
import 'package:get/get.dart';

import '../../routes/routes_name.dart';

class ReviewPage extends StatelessWidget {
  final bool isCompare;
  ReviewPage({super.key, required this.isCompare});

  final ReviewsMenuController reviewsMenuController =
      Get.put(ReviewsMenuController());
  final GetReviewController getReviewController =
      Get.put(GetReviewController());
  final GetAttributeController getAttributeController =
      Get.put(GetAttributeController());

  @override
  Widget build(BuildContext context) {
    final ScrollController reviewScrollController = ScrollController();

    // Infinite scroll listener
    reviewScrollController.addListener(() {
      final args = Get.arguments ?? {};
      final int? postId = args['postId'] is int
          ? args['postId']
          : int.tryParse('${args['postId'] ?? ''}');
      if (reviewScrollController.position.pixels >=
          reviewScrollController.position.maxScrollExtent - 100) {
        getReviewController.loadMoreReviews(postId);
      }
    });

    return Container(
      color: primaryColor,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: primaryColor,
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'Reviews',
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
            actions: [
              IconButton(
                icon: Icon(
                  Icons.assignment_add,
                  color: activeColor,
                ),
                splashColor: Colors.transparent, // Disable splash
                highlightColor: Colors.transparent, // Disable highlight
                hoverColor:
                    Colors.transparent, // Disable hover (for web/desktop)
                onPressed: () {
                  Get.toNamed(RouteName.writeReview);
                  // Get.bottomSheet(
                  //   isScrollControlled: true,
                  //   shape: const RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.only(
                  //       topLeft: Radius.circular(20),
                  //       topRight: Radius.circular(20),
                  //     ),
                  //   ),
                  //   backgroundColor: primaryColor,
                  //   PopupLogin(),
                  // );
                },
              ),
            ],
            backgroundColor: Colors.transparent,
            foregroundColor: blackColor,
            surfaceTintColor: Colors.transparent,
          ),
          body: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: isCompare
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Menu Tabs
                      Obx(() {
                        // Get arguments from navigation
                        final args = Get.arguments ?? {};
                        final firstProduct = args['firstProduct'];
                        final secondProduct = args['secondProduct'];

                        final tabs = [
                          firstProduct != null &&
                                  firstProduct['productName'] != null
                              ? firstProduct['productName']
                              : 'Product 1',
                          secondProduct != null &&
                                  secondProduct['productName'] != null
                              ? secondProduct['productName']
                              : 'Product 2',
                        ];
                        final RxInt selectedTab =
                            reviewsMenuController.selectedTabIndex;
                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: defaultSpace / 2,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                                fontWeight:
                                                    isActive ? bold : regular,
                                                color: isActive
                                                    ? blackColor
                                                    : blackColor
                                                        .withOpacity(0.7),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: defaultSpace / 2,
                                          ),
                                          AnimatedContainer(
                                            duration: const Duration(
                                                milliseconds: 200),
                                            height: 3,
                                            width: isActive
                                                ? (tabs[index].length * 8)
                                                    .toDouble()
                                                : 0.0,
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
                                width: MediaQuery.of(context).size.width,
                                color: blackColor.withOpacity(0.2),
                              ),
                            ],
                          ),
                        );
                      }),
                      // Tab Content
                      Obx(
                        () {
                          switch (
                              reviewsMenuController.selectedTabIndex.value) {
                            case 0:
                              return Expanded(
                                child: ListView.separated(
                                  itemCount: 5,
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(),
                                  itemBuilder: (context, index) {
                                    if (index == 0) {
                                      return Column(
                                        children: [
                                          // total rating
                                          TotalRating(
                                            mainColor: thirdtyColor,
                                            compareItems: const [
                                              {
                                                'compareName1':
                                                    'Dimensions & Weight',
                                                'compareName2': 'Capacity',
                                                'compareName3': 'Refrigerator',
                                                'compareName4': 'Features',
                                                'compareName5': 'Freezer',
                                                'compareValue1': '4.5',
                                                'compareValue2': '4.0',
                                                'compareValue3': '5',
                                                'compareValue4': '3.5',
                                                'compareValue5': '4.0',
                                                'rating': '4.4',
                                                'reviewCount': '150',
                                              },
                                            ],
                                          ),
                                          const SizedBox(
                                              height: defaultSpace / 2),
                                          ReviewsWidget(
                                            mainColor: thirdtyColor,
                                          ),
                                        ],
                                      );
                                    }
                                    return ReviewsWidget(
                                      mainColor: thirdtyColor,
                                    );
                                  },
                                ),
                              );
                            case 1:
                              return Expanded(
                                child: ListView.separated(
                                  itemCount: 5,
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(),
                                  itemBuilder: (context, index) {
                                    if (index == 0) {
                                      return Column(
                                        children: [
                                          // total rating
                                          TotalRating(
                                            mainColor: compareColor,
                                            compareItems: const [
                                              {
                                                'compareName1':
                                                    'Dimensions & Weight',
                                                'compareName2': 'Capacity',
                                                'compareName3': 'Refrigerator',
                                                'compareName4': 'Features',
                                                'compareName5': 'Freezer',
                                                'compareValue1': '4.0',
                                                'compareValue2': '4.5',
                                                'compareValue3': '4',
                                                'compareValue4': '4.5',
                                                'compareValue5': '3.0',
                                                'rating': '4.5',
                                                'reviewCount': '56',
                                              },
                                            ],
                                          ),
                                          const SizedBox(
                                              height: defaultSpace / 2),
                                          ReviewsWidget(
                                            mainColor: compareColor,
                                          ),
                                        ],
                                      );
                                    }
                                    return ReviewsWidget(
                                      mainColor: compareColor,
                                    );
                                  },
                                ),
                              );
                            default:
                              return const SizedBox.shrink();
                          }
                        },
                      ),
                    ],
                  )
                : Obx(() {
                    final args = Get.arguments ?? {};
                    final int? postId = args['postId'] is int
                        ? args['postId']
                        : int.tryParse('${args['postId'] ?? ''}');
                    // Fetch attributes if not loaded
                    if (getAttributeController.attributes.isEmpty &&
                        !getAttributeController.isLoading.value &&
                        !getAttributeController.hasError.value &&
                        postId != null) {
                      getAttributeController.fetchAttributes(postId);
                    }
                    // Fetch reviews if not loaded
                    if (getReviewController.reviews.isEmpty &&
                        !getReviewController.isLoading.value &&
                        !getReviewController.hasError.value) {
                      getReviewController.fetchReviews(postId);
                    }
                    if (getReviewController.isLoading.value ||
                        getAttributeController.isLoading.value) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (getReviewController.hasError.value ||
                        getAttributeController.hasError.value) {
                      return const Center(
                          child: Text('Failed to load reviews or attributes'));
                    }
                    // Prepare compareItems for TotalRating from attributes
                    final attr = getAttributeController.attributes;
                    List<Map<String, dynamic>> compareItems = [];
                    if (attr.isNotEmpty) {
                      final attributesList =
                          attr['attributes'] as List<dynamic>? ?? [];
                      compareItems.add({
                        'rating': attr['avg_rating'].toString(),
                        'reviewCount': attributesList.isNotEmpty
                            ? (attributesList[0]['total_review'].toString())
                            : '0',
                        'attributes': attributesList, // pass the full list
                      });
                    } else {
                      compareItems = const [
                        {
                          'rating': '0',
                          'reviewCount': '0',
                          'attributes': [],
                        },
                      ];
                    }
                    // +1 for header (TotalRating)
                    final itemCount = getReviewController.reviews.length + 1;
                    final showExtraItem =
                        getReviewController.isLoadingMore.value ||
                            getReviewController.hasMore.value;
                    return ListView.separated(
                      controller: reviewScrollController,
                      itemCount: itemCount + (showExtraItem ? 1 : 0),
                      separatorBuilder: (context, index) => const SizedBox(),
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          // Header: TotalRating
                          return Column(
                            children: [
                              TotalRating(
                                mainColor: thirdtyColor,
                                compareItems: compareItems,
                              ),
                              const SizedBox(height: defaultSpace / 2),
                            ],
                          );
                        }
                        // Loading or "No more reviews" indicator at the end
                        if (showExtraItem && index == itemCount) {
                          if (getReviewController.isLoadingMore.value) {
                            return const Padding(
                              padding: EdgeInsets.symmetric(vertical: 16),
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            );
                          } else if (!getReviewController.hasMore.value &&
                              getReviewController.reviews.isNotEmpty) {
                            return const Padding(
                              padding: EdgeInsets.symmetric(vertical: 16),
                              child: Center(
                                child: Text('No more reviews'),
                              ),
                            );
                          } else {
                            return const SizedBox.shrink();
                          }
                        }
                        // Review item
                        final review = getReviewController.reviews[index - 1];
                        return ReviewsWidget(
                          mainColor: thirdtyColor,
                          review: review,
                        );
                      },
                    );
                  }),
          ),
        ),
      ),
    );
  }
}
