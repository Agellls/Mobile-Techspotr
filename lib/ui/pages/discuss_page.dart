import 'package:flutter_application_1/controllers/get_discussion_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/discussion_menu_controller.dart';
import 'package:flutter_application_1/ui/widgets/discuss_widget.dart';
import 'package:get/get.dart';

import '../../routes/routes_name.dart';
import '../../shared/theme.dart';
import '../widgets/search_forms.dart';

class DiscussPage extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();
  final GetDiscussionController discussionController =
      Get.put(GetDiscussionController());
  final bool isCompare;
  DiscussPage({super.key, required this.isCompare});

  final TextEditingController searchController = TextEditingController();
  final FocusNode searchFocusNode = FocusNode();
  final DiscussionMenuController discussionMenuController =
      Get.put(DiscussionMenuController());

  @override
  Widget build(BuildContext context) {
    // Example: get postId from arguments or use a default
    final args = Get.arguments ?? {};
    final int postId = args['postId'];

    // Track the current search keyword
    final RxString searchKeyword = ''.obs;

    // Fetch discussions when the widget is built (only once)
    if (discussionController.discussions.isEmpty &&
        !discussionController.isLoading.value) {
      discussionController.fetchDiscussions(postId: postId);
    }

    // Infinite scroll listener
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent - 200 &&
          !discussionController.isLoadingMore.value &&
          discussionController.hasMore.value) {
        discussionController.loadMoreDiscussions(
            postId: postId, keyword: searchKeyword.value);
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
                    onChanged: (value) async {
                      searchKeyword.value = value;
                      await discussionController.fetchDiscussions(
                        postId: postId,
                        keyword: value,
                      );
                    },
                    onClearPressed: () async {
                      searchController.clear();
                      searchKeyword.value = '';
                      await discussionController.fetchDiscussions(
                          postId: postId);
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
                                        discussion: {
                                          'title':
                                              'Comparison Discussion $index',
                                          'content':
                                              'Content for comparison $index',
                                          'author': 'Author $index',
                                          'date': DateTime.now().toString(),
                                        }, // Example discussion data
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
                                  discussion: {
                                    'title': 'Comparison Discussion $index',
                                    'content': 'Content for comparison $index',
                                    'author': 'Author $index',
                                    'date': DateTime.now().toString(),
                                  }, // Example discussion data
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
                                        discussion: {
                                          'title':
                                              'Comparison Discussion $index',
                                          'content':
                                              'Content for comparison $index',
                                          'author': 'Author $index',
                                          'date': DateTime.now().toString(),
                                        }, // Example discussion data
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
                                  discussion: {
                                    'title': 'Comparison Discussion $index',
                                    'content': 'Content for comparison $index',
                                    'author': 'Author $index',
                                    'date': DateTime.now().toString(),
                                  }, // Example discussion data
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
                // If not compare, show real discussions from API
                Expanded(
                  child: Obx(() {
                    if (discussionController.isLoading.value) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (discussionController.errorMessage.isNotEmpty) {
                      return Center(
                          child: Text(discussionController.errorMessage.value));
                    } else if (discussionController.discussions.isEmpty) {
                      return const Center(child: Text('No discussions found.'));
                    }
                    return NotificationListener<ScrollNotification>(
                      onNotification: (scrollNotification) {
                        if (scrollNotification is ScrollEndNotification &&
                            _scrollController.position.pixels >=
                                _scrollController.position.maxScrollExtent -
                                    200 &&
                            !discussionController.isLoadingMore.value &&
                            discussionController.hasMore.value) {
                          discussionController.loadMoreDiscussions(
                              postId: postId);
                        }
                        return false;
                      },
                      child: ListView.separated(
                        controller: _scrollController,
                        itemCount: discussionController.discussions.length +
                            (discussionController.isLoadingMore.value ? 1 : 0),
                        separatorBuilder: (context, index) => const SizedBox(),
                        itemBuilder: (context, index) {
                          if (index < discussionController.discussions.length) {
                            final discussion =
                                discussionController.discussions[index];
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: defaultSpace),
                              child: DiscussWidget(
                                mainColor: thirdtyColor,
                                discussion: discussion,
                              ),
                            );
                          } else {
                            // Loading indicator at the bottom
                            return const Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Center(child: CircularProgressIndicator()),
                            );
                          }
                        },
                      ),
                    );
                  }),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
