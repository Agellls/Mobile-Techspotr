import 'package:flexible_wrap/flexible_wrap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/guides_menu_controller.dart';
import 'package:flutter_application_1/ui/widgets/articles_widget.dart';
import 'package:flutter_application_1/ui/widgets/files_widget.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../controllers/get_guide_controller.dart';
import '../../shared/theme.dart';
import '../widgets/videos_widget.dart';

class GuidesPage extends StatefulWidget {
  final bool isCompare;
  const GuidesPage({super.key, required this.isCompare});

  @override
  State<GuidesPage> createState() => _GuidesPageState();
}

class _GuidesPageState extends State<GuidesPage> {
  final GuidesMenuController guidesMenuController =
      Get.put(GuidesMenuController());
  final GetGuideController guideController = Get.put(GetGuideController());
  final args = Get.arguments ?? {};
  final String postId = Get.arguments?['postId'];

  @override
  void initState() {
    super.initState();
    guideController.fetchAllGuides(postId: int.tryParse(postId) ?? 0);
  }

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
      body: widget.isCompare
          ? Obx(() {
              if (guideController.isFilesLoading.value ||
                  guideController.isVideosLoading.value ||
                  guideController.isArticlesLoading.value) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Column(
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
                  Expanded(
                    child: Obx(
                      () {
                        // Use the separate lists from the controller
                        final videos = guideController.videos;
                        final articles = guideController.articles;
                        final files = guideController.files;

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
                                    child: videos.isNotEmpty
                                        ? Text(
                                            'Videos (${videos.length})',
                                            style: blackTextStyle.copyWith(
                                              fontSize: 18,
                                              fontWeight: bold,
                                            ),
                                          )
                                        : const SizedBox.shrink(),
                                  ),
                                  if (videos.isNotEmpty)
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: defaultSpace / 2),
                                        child: Row(
                                          children: [
                                            const SizedBox(width: defaultSpace),
                                            ...videos
                                                .map((video) => VideosWidget(
                                                      mainColor: thirdtyColor,
                                                      imageUrl:
                                                          video['image'] ?? '',
                                                    )),
                                            const SizedBox(width: defaultSpace),
                                          ],
                                        ),
                                      ),
                                    ),
                                  // Articles Section
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: defaultSpace),
                                    child: articles.isNotEmpty
                                        ? Text(
                                            'Articles (${articles.length})',
                                            style: blackTextStyle.copyWith(
                                              fontSize: 18,
                                              fontWeight: bold,
                                            ),
                                          )
                                        : const SizedBox.shrink(),
                                  ),
                                  const SizedBox(height: defaultSpace / 2),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: defaultSpace),
                                    child: articles.isNotEmpty
                                        ? Column(
                                            children: [
                                              ...articles.map(
                                                (article) => ArticlesWidget(
                                                  mainColor: thirdtyColor,
                                                  title: article['title'] ?? '',
                                                  timeLine: article[
                                                          'create_elapsed'] ??
                                                      '',
                                                  imageUrl:
                                                      'https://www.google.com/s2/favicons?domain=' +
                                                          article['url'],
                                                  urlSourceName:
                                                      (article['url'] ?? '')
                                                          .replaceAll(
                                                              RegExp(r'^www\.'),
                                                              '')
                                                          .split('.')
                                                          .first,
                                                ),
                                              ),
                                            ],
                                          )
                                        : const SizedBox.shrink(),
                                  ),
                                  // Files Section
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: defaultSpace),
                                    child: files.isNotEmpty
                                        ? Text(
                                            'Files (${files.length})',
                                            style: blackTextStyle.copyWith(
                                              fontSize: 18,
                                              fontWeight: bold,
                                            ),
                                          )
                                        : const SizedBox.shrink(),
                                  ),
                                  const SizedBox(height: defaultSpace / 2),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: defaultSpace / 2),
                                    child: files.isNotEmpty
                                        ? FlexibleWrap(
                                            spacing: defaultSpace,
                                            runSpacing: defaultSpace,
                                            children: [
                                              ...files.map(
                                                (file) => FilesWidget(
                                                  mainColor: thirdtyColor,
                                                  title: file['title'] ?? '',
                                                  timeLine:
                                                      file['create_elapsed'] ??
                                                          '',
                                                  ontap: () {
                                                    launch(file['url']);
                                                  },
                                                ),
                                              ),
                                            ],
                                          )
                                        : const SizedBox.shrink(),
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
                                            imageUrl:
                                                'https://www.google.com/s2/favicons?domain=example.com',
                                          ),
                                          const SizedBox(width: defaultSpace),
                                          VideosWidget(
                                            mainColor: compareColor,
                                            imageUrl:
                                                'https://www.google.com/s2/favicons?domain=example.com',
                                          ),
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
                                          title: 'LG LRSOS2706S Owners Manual',
                                          timeLine: '1 Month Ago',
                                          imageUrl:
                                              'https://www.google.com/s2/favicons?domain=example.com',
                                          urlSourceName: 'example.com',
                                        ),
                                        ArticlesWidget(
                                          mainColor: compareColor,
                                          title: 'LG LRSOS2706S Owners Manual',
                                          timeLine: '1 Month Ago',
                                          imageUrl:
                                              'https://www.google.com/s2/favicons?domain=example.com',
                                          urlSourceName: 'example.com',
                                        ),
                                        ArticlesWidget(
                                          mainColor: compareColor,
                                          title: 'LG LRSOS2706S Owners Manual',
                                          timeLine: '1 Month Ago',
                                          imageUrl:
                                              'https://www.google.com/s2/favicons?domain=example.com',
                                          urlSourceName: 'example.com',
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
                                        FilesWidget(
                                          mainColor: compareColor,
                                          title: 'File 1',
                                          timeLine: '1 Month Ago',
                                        ),
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
              );
            })
          : Obx(
              () {
                if (guideController.isFilesLoading.value ||
                    guideController.isVideosLoading.value ||
                    guideController.isArticlesLoading.value) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: blackColor,
                    ),
                  );
                }
                final videos = guideController.videos;
                final articles = guideController.articles;
                final files = guideController.files;
                return Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Videos Section
                        if (videos.isNotEmpty) ...[
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: defaultSpace),
                            child: Text(
                              'Videos (${videos.length})',
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
                                  ...videos.map(
                                    (video) => VideosWidget(
                                      mainColor: thirdtyColor,
                                      imageUrl: video['image'] ?? '',
                                    ),
                                  ),
                                  const SizedBox(width: defaultSpace),
                                ],
                              ),
                            ),
                          ),
                        ],
                        // Articles Section
                        if (articles.isNotEmpty) ...[
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: defaultSpace),
                            child: Text(
                              'Articles (${articles.length})',
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
                                ...articles.map(
                                  (article) => ArticlesWidget(
                                    mainColor: thirdtyColor,
                                    title: article['title'] ?? '',
                                    timeLine: article['create_elapsed'] ?? '',
                                    imageUrl:
                                        'https://www.google.com/s2/favicons?domain=' +
                                            article['url'],
                                    urlSourceName: (article['url'] ?? '')
                                        .replaceAll(RegExp(r'^www\.'), '')
                                        .split('.')
                                        .first,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                        // Files Section
                        if (files.isNotEmpty) ...[
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: defaultSpace),
                            child: Text(
                              'Files (${files.length})',
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
                                ...files.map(
                                  (file) => FilesWidget(
                                    mainColor: thirdtyColor,
                                    title: file['title'] ?? '',
                                    timeLine: file['create_elapsed'] ?? '',
                                    ontap: () {
                                      launch(file['url']);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                        const SizedBox(height: defaultSpace),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
