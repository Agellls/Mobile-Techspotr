import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../shared/theme.dart';
import '../widgets/discuss_widget.dart';

class MyProfileController extends GetxController {
  var selectedTabIndex = 0.obs;
}

class MyProfile extends StatelessWidget {
  MyProfile({super.key});

  final MyProfileController tabController = Get.put(MyProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'My Profile',
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Menu Tabs
          Obx(() {
            final tabs = [
              'My Reviews',
              'My Discussions',
              'The Collections',
            ];
            final RxInt selectedTab = tabController.selectedTabIndex;
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
          // Tab Content
          Expanded(
            child: Obx(() {
              switch (tabController.selectedTabIndex.value) {
                case 0:
                  final RxInt reviewTabIndex = 0.obs;
                  return SingleChildScrollView(
                    child: Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: defaultSpace),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: defaultSpace),
                          Text(
                            'THE GOOD, THE BAD, AND THE BRUTALLY HONEST.',
                            style: blackTextStyle.copyWith(
                              fontSize: 14,
                              color: thirdtyColor,
                            ),
                          ),
                          const SizedBox(height: defaultSpace),
                          // Menu bar for reviews (styled like discussions)
                          Obx(() => Row(
                                children: [
                                  GestureDetector(
                                    onTap: () => reviewTabIndex.value = 0,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 16,
                                        vertical: 8,
                                      ),
                                      decoration: BoxDecoration(
                                        color: reviewTabIndex.value == 0
                                            ? activeColor
                                            : secondaryColor,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Text(
                                        'My Reviews',
                                        style: blackTextStyle.copyWith(
                                          color: reviewTabIndex.value == 0
                                              ? Colors.white
                                              : blackColor.withOpacity(0.7),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  GestureDetector(
                                    onTap: () => reviewTabIndex.value = 1,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 16,
                                        vertical: 8,
                                      ),
                                      decoration: BoxDecoration(
                                        color: reviewTabIndex.value == 1
                                            ? activeColor
                                            : secondaryColor,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Text(
                                        'My Favorite Reviews',
                                        style: blackTextStyle.copyWith(
                                          color: reviewTabIndex.value == 1
                                              ? Colors.white
                                              : blackColor.withOpacity(0.7),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                          const SizedBox(height: defaultSpace),
                        ],
                      ),
                    ),
                  );
                case 1:
                  // Add local RxInt for sub-tab selection
                  final RxInt discussionTabIndex = 0.obs;
                  return SingleChildScrollView(
                    child: Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: defaultSpace),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: defaultSpace),
                          Text(
                            'THOUGHTS, TAKES, AND HOT DEBATES.',
                            style: blackTextStyle.copyWith(
                              fontSize: 14,
                              color: thirdtyColor,
                            ),
                          ),
                          const SizedBox(height: defaultSpace),
                          // Menu bar for discussions (styled like screenshot)
                          Obx(() => Row(
                                children: [
                                  GestureDetector(
                                    onTap: () => discussionTabIndex.value = 0,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 16,
                                        vertical: 8,
                                      ),
                                      decoration: BoxDecoration(
                                        color: discussionTabIndex.value == 0
                                            ? activeColor
                                            : secondaryColor,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Text(
                                        'My Discussions',
                                        style: blackTextStyle.copyWith(
                                          color: discussionTabIndex.value == 0
                                              ? Colors.white
                                              : blackColor.withOpacity(0.7),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  GestureDetector(
                                    onTap: () => discussionTabIndex.value = 1,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 16,
                                        vertical: 8,
                                      ),
                                      decoration: BoxDecoration(
                                        color: discussionTabIndex.value == 1
                                            ? activeColor
                                            : secondaryColor,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Text(
                                        'My Favorite Discussions',
                                        style: blackTextStyle.copyWith(
                                          color: discussionTabIndex.value == 1
                                              ? Colors.white
                                              : blackColor.withOpacity(0.7),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                          const SizedBox(height: defaultSpace),
                          // Tab content for discussions
                          Obx(() {
                            if (discussionTabIndex.value == 0) {
                              return Column(
                                children: [
                                  DiscussWidget(
                                    mainColor: thirdtyColor,
                                    discussion: {
                                      'title': 'Comparison Discussion',
                                      'content': 'Content for comparison',
                                      'author': 'Author',
                                      'date': DateTime.now().toString(),
                                    },
                                  ),
                                  // ...existing code...
                                ],
                              );
                            } else {
                              return Column(
                                children: [
                                  DiscussWidget(
                                    mainColor: thirdtyColor,
                                    discussion: {
                                      'title': 'Favorite Discussion',
                                      'content': 'Favorite content',
                                      'author': 'Author',
                                      'date': DateTime.now().toString(),
                                    },
                                  ),
                                  // ...existing code...
                                ],
                              );
                            }
                          }),
                          const SizedBox(height: defaultSpace),
                        ],
                      ),
                    ),
                  );
                case 2:
                  final RxInt collectionTabIndex = 0.obs;
                  return SingleChildScrollView(
                    child: Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: defaultSpace),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: defaultSpace),
                          Text(
                            "TREASURES I'VE PICKED. NO FLUFF, ALL FUN.",
                            style: blackTextStyle.copyWith(
                              fontSize: 14,
                              color: thirdtyColor,
                            ),
                          ),
                          const SizedBox(height: defaultSpace),
                          // Menu bar for collections (styled like discussions)
                          Obx(() => Row(
                                children: [
                                  GestureDetector(
                                    onTap: () => collectionTabIndex.value = 0,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 16,
                                        vertical: 8,
                                      ),
                                      decoration: BoxDecoration(
                                        color: collectionTabIndex.value == 0
                                            ? activeColor
                                            : secondaryColor,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Text(
                                        'I Created',
                                        style: blackTextStyle.copyWith(
                                          color: collectionTabIndex.value == 0
                                              ? Colors.white
                                              : blackColor.withOpacity(0.7),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  GestureDetector(
                                    onTap: () => collectionTabIndex.value = 1,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 16,
                                        vertical: 8,
                                      ),
                                      decoration: BoxDecoration(
                                        color: collectionTabIndex.value == 1
                                            ? activeColor
                                            : secondaryColor,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Text(
                                        'I Faved',
                                        style: blackTextStyle.copyWith(
                                          color: collectionTabIndex.value == 1
                                              ? Colors.white
                                              : blackColor.withOpacity(0.7),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                          const SizedBox(height: defaultSpace),
                        ],
                      ),
                    ),
                  );
                default:
                  return const SizedBox.shrink();
              }
            }),
          ),
        ],
      ),
    );
  }
}
