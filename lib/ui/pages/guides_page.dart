import 'package:flexible_wrap/flexible_wrap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/guides_menu_controller.dart';
import 'package:flutter_application_1/ui/widgets/articles_widget.dart';
import 'package:flutter_application_1/ui/widgets/files_widget.dart';
import 'package:get/get.dart';
import '../../shared/theme.dart';
import '../widgets/videos_widget.dart';

class GuidesPage extends StatelessWidget {
  final bool isCompare;
  GuidesPage({super.key, required this.isCompare});

  final GuidesMenuController guidesMenuController =
      Get.put(GuidesMenuController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Guides',
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
      body: isCompare
          ? Column(
              children: [
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
                      guidesMenuController.selectedTabIndex;
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
                Expanded(
                  child: Obx(
                    () {
                      switch (guidesMenuController.selectedTabIndex.value) {
                        case 0:
                          return SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: defaultSpace / 2),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: defaultSpace),
                                  child: Text(
                                    'Videos (0)',
                                    style: blackTextStyle.copyWith(
                                      fontSize: 18,
                                      fontWeight: bold,
                                    ),
                                  ),
                                ),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: defaultSpace / 2),
                                    child: Row(
                                      children: [
                                        const SizedBox(width: defaultSpace),
                                        VideosWidget(
                                          mainColor: thirdtyColor,
                                        ),
                                        const SizedBox(width: defaultSpace),
                                        VideosWidget(
                                          mainColor: thirdtyColor,
                                        ),
                                        const SizedBox(width: defaultSpace),
                                        VideosWidget(
                                          mainColor: thirdtyColor,
                                        ),
                                        const SizedBox(width: defaultSpace),
                                        VideosWidget(
                                          mainColor: thirdtyColor,
                                        ),
                                        const SizedBox(width: defaultSpace),
                                        VideosWidget(
                                          mainColor: thirdtyColor,
                                        ),
                                        const SizedBox(width: defaultSpace),
                                      ],
                                    ),
                                  ),
                                ),

                                // Articles Section
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: defaultSpace),
                                  child: Text(
                                    'Articles (0)',
                                    style: blackTextStyle.copyWith(
                                      fontSize: 18,
                                      fontWeight: bold,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: defaultSpace / 2),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: defaultSpace),
                                  child: Column(
                                    children: [
                                      ArticlesWidget(
                                        mainColor: thirdtyColor,
                                      ),
                                      ArticlesWidget(
                                        mainColor: thirdtyColor,
                                      ),
                                      ArticlesWidget(
                                        mainColor: thirdtyColor,
                                      ),
                                    ],
                                  ),
                                ),

                                // Files Section
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: defaultSpace),
                                  child: Text(
                                    'Files (0)',
                                    style: blackTextStyle.copyWith(
                                      fontSize: 18,
                                      fontWeight: bold,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: defaultSpace / 2),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: defaultSpace / 2),
                                  child: FlexibleWrap(
                                    spacing: defaultSpace,
                                    runSpacing: defaultSpace,
                                    children: [
                                      FilesWidget(mainColor: thirdtyColor),
                                      FilesWidget(mainColor: thirdtyColor),
                                      FilesWidget(mainColor: thirdtyColor),
                                      FilesWidget(mainColor: thirdtyColor),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: defaultSpace),
                              ],
                            ),
                          );
                        case 1:
                          return SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: defaultSpace / 2),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: defaultSpace),
                                  child: Text(
                                    'Videos (0)',
                                    style: blackTextStyle.copyWith(
                                      fontSize: 18,
                                      fontWeight: bold,
                                    ),
                                  ),
                                ),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: defaultSpace / 2),
                                    child: Row(
                                      children: [
                                        const SizedBox(width: defaultSpace),
                                        VideosWidget(
                                          mainColor: compareColor,
                                        ),
                                        const SizedBox(width: defaultSpace),
                                        VideosWidget(
                                          mainColor: compareColor,
                                        ),
                                        const SizedBox(width: defaultSpace),
                                        VideosWidget(
                                          mainColor: compareColor,
                                        ),
                                        const SizedBox(width: defaultSpace),
                                        VideosWidget(
                                          mainColor: compareColor,
                                        ),
                                        const SizedBox(width: defaultSpace),
                                        VideosWidget(
                                          mainColor: compareColor,
                                        ),
                                        const SizedBox(width: defaultSpace),
                                      ],
                                    ),
                                  ),
                                ),

                                // Articles Section
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: defaultSpace),
                                  child: Text(
                                    'Articles (0)',
                                    style: blackTextStyle.copyWith(
                                      fontSize: 18,
                                      fontWeight: bold,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: defaultSpace / 2),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: defaultSpace),
                                  child: Column(
                                    children: [
                                      ArticlesWidget(
                                        mainColor: compareColor,
                                      ),
                                      ArticlesWidget(
                                        mainColor: compareColor,
                                      ),
                                      ArticlesWidget(
                                        mainColor: compareColor,
                                      ),
                                    ],
                                  ),
                                ),

                                // Files Section
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: defaultSpace),
                                  child: Text(
                                    'Files (0)',
                                    style: blackTextStyle.copyWith(
                                      fontSize: 18,
                                      fontWeight: bold,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: defaultSpace / 2),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: defaultSpace / 2),
                                  child: FlexibleWrap(
                                    spacing: defaultSpace,
                                    runSpacing: defaultSpace,
                                    children: [
                                      FilesWidget(mainColor: compareColor),
                                      FilesWidget(mainColor: compareColor),
                                      FilesWidget(mainColor: compareColor),
                                      FilesWidget(mainColor: compareColor),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: defaultSpace),
                              ],
                            ),
                          );
                        default:
                          return const SizedBox.shrink();
                      }
                    },
                  ),
                ),
              ],
            )
          : Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: defaultSpace),
                      child: Text(
                        'Videos (0)',
                        style: blackTextStyle.copyWith(
                          fontSize: 18,
                          fontWeight: bold,
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: defaultSpace / 2),
                        child: Row(
                          children: [
                            const SizedBox(width: defaultSpace),
                            VideosWidget(
                              mainColor: thirdtyColor,
                            ),
                            const SizedBox(width: defaultSpace),
                            VideosWidget(
                              mainColor: thirdtyColor,
                            ),
                            const SizedBox(width: defaultSpace),
                            VideosWidget(
                              mainColor: thirdtyColor,
                            ),
                            const SizedBox(width: defaultSpace),
                            VideosWidget(
                              mainColor: thirdtyColor,
                            ),
                            const SizedBox(width: defaultSpace),
                            VideosWidget(
                              mainColor: thirdtyColor,
                            ),
                            const SizedBox(width: defaultSpace),
                          ],
                        ),
                      ),
                    ),

                    // Articles Section
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: defaultSpace),
                      child: Text(
                        'Articles (0)',
                        style: blackTextStyle.copyWith(
                          fontSize: 18,
                          fontWeight: bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: defaultSpace / 2),
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: defaultSpace),
                      child: Column(
                        children: [
                          ArticlesWidget(
                            mainColor: thirdtyColor,
                          ),
                          ArticlesWidget(
                            mainColor: thirdtyColor,
                          ),
                          ArticlesWidget(
                            mainColor: thirdtyColor,
                          ),
                        ],
                      ),
                    ),

                    // Files Section
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: defaultSpace),
                      child: Text(
                        'Files (0)',
                        style: blackTextStyle.copyWith(
                          fontSize: 18,
                          fontWeight: bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: defaultSpace / 2),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: defaultSpace / 2),
                      child: FlexibleWrap(
                        spacing: defaultSpace,
                        runSpacing: defaultSpace,
                        children: [
                          FilesWidget(mainColor: thirdtyColor),
                          FilesWidget(mainColor: thirdtyColor),
                          FilesWidget(mainColor: thirdtyColor),
                          FilesWidget(mainColor: thirdtyColor),
                        ],
                      ),
                    ),
                    const SizedBox(height: defaultSpace),
                  ],
                ),
              ),
            ),
    );
  }
}
