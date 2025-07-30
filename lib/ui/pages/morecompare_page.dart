import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/morecompare_menu_controller.dart';
import 'package:flutter_application_1/controllers/morecompare_controller.dart';
import 'package:flutter_application_1/ui/widgets/morecompare_widget.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/services/api_services.dart';

import '../../shared/theme.dart';

class MorecomparePage extends StatelessWidget {
  final bool isCompare;
  MorecomparePage({super.key, required this.isCompare});

  final MorecompareMenuController morecompareMenuController =
      Get.put(MorecompareMenuController());
  final MoreCompareController moreCompareController =
      Get.put(MoreCompareController());
  final args = Get.arguments ?? {};
  final int postId = Get.arguments?['postId'];

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!moreCompareController.isLoading.value &&
          moreCompareController.moreComparisons.isEmpty) {
        moreCompareController.fetchMoreComparisons(postId);
      }
    });

    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'More Comparisons',
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
                        morecompareMenuController.selectedTabIndex;
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: defaultSpace / 2,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                                : blackColor.withOpacity(0.7),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: defaultSpace / 2,
                                      ),
                                      AnimatedContainer(
                                        duration:
                                            const Duration(milliseconds: 200),
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
                          morecompareMenuController.selectedTabIndex.value) {
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
                                      const SizedBox(height: defaultSpace),
                                      // MorecompareWidget(
                                      //   mainColor: thirdtyColor,
                                      // ),
                                    ],
                                  );
                                }
                                // return MorecompareWidget(
                                //   mainColor: thirdtyColor,
                                // );
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
                                      const SizedBox(height: defaultSpace),
                                      // MorecompareWidget(
                                      //   mainColor: compareColor,
                                      // ),
                                    ],
                                  );
                                }
                                // return MorecompareWidget(
                                //   mainColor: compareColor,
                                // );
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
                if (moreCompareController.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (moreCompareController.error.isNotEmpty) {
                  return Center(
                      child: Text('Error: ${moreCompareController.error}'));
                }
                final data = moreCompareController.moreComparisons;
                if (data.isEmpty) {
                  return const Center(child: Text('No comparisons found.'));
                }
                return ListView.separated(
                  itemCount: data.length,
                  separatorBuilder: (context, index) => const SizedBox(),
                  itemBuilder: (context, index) {
                    final item = data[index];
                    final user = item['user'] ?? {};
                    final post1 = item['post1'] ?? {};
                    final post2 = item['post2'] ?? {};
                    return MorecompareWidget(
                      mainColor: thirdtyColor,
                      name: user['name'] ?? 'Unknown',
                      timedate: item['create_time_elapsed'] ?? '',
                      profileImageUrl: user['image'] ?? '',
                      imagePost1: post1['image'] ?? '',
                      imagePost2: post2['image'] ?? '',
                      totalCompare: user['total_compare'] ?? 0,
                      totalLikes: item['total_reaction'] ?? 0,
                    );
                  },
                );
              }),
      ),
    );
  }
}
