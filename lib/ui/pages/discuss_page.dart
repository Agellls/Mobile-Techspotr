import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/discussion_menu_controller.dart';
import 'package:flutter_application_1/ui/widgets/discuss_widget.dart';
import 'package:get/get.dart';

import '../../routes/routes_name.dart';
import '../../shared/theme.dart';
import '../widgets/search_forms.dart';

class DiscussPage extends StatelessWidget {
  final bool isCompare;
  DiscussPage({super.key, required this.isCompare});

  final TextEditingController searchController = TextEditingController();
  final FocusNode searchFocusNode = FocusNode();
  final DiscussionMenuController discussionMenuController =
      Get.put(DiscussionMenuController());

  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryColor,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: primaryColor,
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'Discussions',
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
                  Icons.chat,
                  color: activeColor,
                ),
                splashColor: Colors.transparent, // Disable splash
                highlightColor: Colors.transparent, // Disable highlight
                hoverColor:
                    Colors.transparent, // Disable hover (for web/desktop)
                onPressed: () {
                  Get.toNamed(RouteName.writeDiscuss);
                },
              ),
            ],
            backgroundColor: Colors.transparent,
            foregroundColor: blackColor,
            surfaceTintColor: Colors.transparent,
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultSpace),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SearchForms(
                    hintText: 'Search Discussion',
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
              ),
              const SizedBox(height: defaultSpace),
              if (isCompare) ...[
                // Menu Tabs
                Obx(() {
                  // Get arguments from navigation
                  final args = Get.arguments ?? {};
                  final firstProduct = args['firstProduct'];
                  final secondProduct = args['secondProduct'];

                  final tabs = [
                    firstProduct != null && firstProduct['productName'] != null
                        ? firstProduct['productName']
                        : 'Product 1',
                    secondProduct != null &&
                            secondProduct['productName'] != null
                        ? secondProduct['productName']
                        : 'Product 2',
                  ];
                  final RxInt selectedTab =
                      discussionMenuController.selectedTabIndex;
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
                                          fontWeight: isActive ? bold : regular,
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
                                          ? (tabs[index].length * 8).toDouble()
                                          : 0.0,
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
                          width: MediaQuery.of(context).size.width,
                          color: blackColor.withOpacity(0.2),
                        ),
                      ],
                    ),
                  );
                }),
                Obx(
                  () {
                    switch (discussionMenuController.selectedTabIndex.value) {
                      case 0:
                        return Expanded(
                          child: ListView.separated(
                            itemCount: 5,
                            separatorBuilder: (context, index) =>
                                const SizedBox(),
                            itemBuilder: (context, index) {
                              if (index == 0) {
                                // First item, add space above
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: defaultSpace),
                                  child: Column(
                                    children: [
                                      const SizedBox(
                                        height: defaultSpace,
                                      ),
                                      DiscussWidget(
                                        mainColor: thirdtyColor,
                                      ),
                                    ],
                                  ),
                                );
                              }
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: defaultSpace),
                                child: DiscussWidget(
                                  mainColor: thirdtyColor,
                                ),
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
                                // First item, add space above
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: defaultSpace),
                                  child: Column(
                                    children: [
                                      const SizedBox(
                                        height: defaultSpace,
                                      ),
                                      DiscussWidget(
                                        mainColor: compareColor,
                                      ),
                                    ],
                                  ),
                                );
                              }
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: defaultSpace),
                                child: DiscussWidget(
                                  mainColor: compareColor,
                                ),
                              );
                            },
                          ),
                        );
                      default:
                        return const SizedBox.shrink();
                    }
                  },
                ),
              ] else ...[
                // If not compare, show only DiscussWidget
                Expanded(
                  child: ListView.separated(
                    itemCount: 5,
                    separatorBuilder: (context, index) => const SizedBox(),
                    itemBuilder: (context, index) {
                      if (index == 4) {
                        // Last item, add space below
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: defaultSpace),
                          child: Column(
                            children: [
                              DiscussWidget(
                                mainColor: thirdtyColor,
                              ),
                            ],
                          ),
                        );
                      }
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: defaultSpace),
                        child: DiscussWidget(
                          mainColor: thirdtyColor,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
