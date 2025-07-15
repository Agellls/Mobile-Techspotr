import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/morecompare_menu_controller.dart';
import 'package:flutter_application_1/ui/widgets/morecompare_widget.dart';
import 'package:get/get.dart';

import '../../shared/theme.dart';

class MorecomparePage extends StatelessWidget {
  final bool isCompare;
  MorecomparePage({super.key, required this.isCompare});

  final MorecompareMenuController morecompareMenuController =
      Get.put(MorecompareMenuController());

  @override
  Widget build(BuildContext context) {
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
                                      MorecompareWidget(
                                        mainColor: thirdtyColor,
                                      ),
                                    ],
                                  );
                                }
                                return MorecompareWidget(
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
                                      const SizedBox(height: defaultSpace),
                                      MorecompareWidget(
                                        mainColor: compareColor,
                                      ),
                                    ],
                                  );
                                }
                                return MorecompareWidget(
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
            : Expanded(
                child: ListView.separated(
                  itemCount: 5,
                  separatorBuilder: (context, index) => const SizedBox(),
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return Column(
                        children: [
                          const SizedBox(height: defaultSpace / 2),
                          MorecompareWidget(
                            mainColor: thirdtyColor,
                          ),
                        ],
                      );
                    }
                    return MorecompareWidget(
                      mainColor: thirdtyColor,
                    );
                  },
                ),
              ),
      ),
    );
  }
}
