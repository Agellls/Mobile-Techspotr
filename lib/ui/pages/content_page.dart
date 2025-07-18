import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/widgets/discuss_widget.dart';
import 'package:get/get.dart';

import '../../controllers/comparison_controller.dart';
import '../../shared/theme.dart';
import '../widgets/review_widget.dart';

class ContentPage extends StatelessWidget {
  ContentPage({super.key});

  final ComparisonController comparisonController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Content',
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Menu Tabs
            Obx(() {
              final tabs = [
                'My Reviews',
                'My Discussions',
                'My Collections',
                'My Reactions',
                'My Responds'
              ];
              final RxInt selectedTab = comparisonController.selectedTabIndex;
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: defaultSpace / 2,
                      ),
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
                                  duration: const Duration(milliseconds: 200),
                                  height: 3,
                                  width:
                                      isActive ? (tabs[index].length * 8) : 0,
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
            // Tab Content
            Expanded(
              child: SingleChildScrollView(
                child: Obx(
                  () {
                    switch (comparisonController.selectedTabIndex.value) {
                      case 0:
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(height: defaultSpace),
                            ReviewsWidget(
                              mainColor: thirdtyColor,
                            ),
                            ReviewsWidget(
                              mainColor: thirdtyColor,
                            ),
                            ReviewsWidget(
                              mainColor: thirdtyColor,
                            ),
                            const SizedBox(height: defaultSpace),
                          ],
                        );
                      case 1:
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: defaultSpace),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(height: defaultSpace),
                              DiscussWidget(
                                mainColor: thirdtyColor,
                                discussion: {
                                  'title': 'Comparison Discussion',
                                  'content': 'Content for comparison',
                                  'author': 'Author',
                                  'date': DateTime.now().toString(),
                                },
                              ),
                              DiscussWidget(
                                mainColor: thirdtyColor,
                                discussion: {
                                  'title': 'Comparison Discussion',
                                  'content': 'Content for comparison',
                                  'author': 'Author',
                                  'date': DateTime.now().toString(),
                                },
                              ),
                              DiscussWidget(
                                mainColor: thirdtyColor,
                                discussion: {
                                  'title': 'Comparison Discussion',
                                  'content': 'Content for comparison',
                                  'author': 'Author',
                                  'date': DateTime.now().toString(),
                                },
                              ),
                              const SizedBox(height: defaultSpace),
                            ],
                          ),
                        );
                      case 2:
                        return Center(
                          child: Text(
                            'Collections',
                            style: blackTextStyle,
                          ),
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
            ),
          ],
        ),
      ),
    );
  }
}
