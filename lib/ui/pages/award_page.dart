import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/award_menu_controller.dart';
import 'package:flutter_application_1/routes/routes_name.dart';
import 'package:flutter_application_1/ui/widgets/award_widget.dart';
import 'package:get/get.dart';
import '../../controllers/get_award_controller.dart';
import '../../shared/theme.dart';

class AwardPage extends StatelessWidget {
  final bool isCompare;
  AwardPage({super.key, required this.isCompare});

  final TextEditingController searchController = TextEditingController();
  final FocusNode searchFocusNode = FocusNode();
  late final AwardMenuController awardMenuController =
      Get.put(AwardMenuController());
  final GetAwardController getAwardController = Get.put(GetAwardController());

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments ?? {};
    final int postId = args['postId'] ?? 0;
    final int userId = args['userId'] ?? 0;

    getAwardController.fetchAwards(postId: postId);

    return Container(
      color: primaryColor,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: primaryColor,
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'Awards',
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
                          awardMenuController.selectedTabIndex;
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
                    Obx(
                      () {
                        switch (awardMenuController.selectedTabIndex.value) {
                          case 0:
                            return Expanded(
                              child: ListView.separated(
                                itemCount: 10,
                                separatorBuilder: (context, index) =>
                                    const SizedBox(),
                                itemBuilder: (context, index) {
                                  if (index == 0) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: defaultSpace),
                                      child: Column(
                                        children: [
                                          const SizedBox(height: defaultSpace),
                                          AwardWidget(
                                            mainColor: thirdtyColor,
                                          ),
                                        ],
                                      ),
                                    );
                                  }
                                  return Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: defaultSpace),
                                    child: AwardWidget(
                                      mainColor: thirdtyColor,
                                    ),
                                  );
                                },
                              ),
                            );
                          case 1:
                            return Expanded(
                              child: ListView.separated(
                                itemCount: 2,
                                separatorBuilder: (context, index) =>
                                    const SizedBox(),
                                itemBuilder: (context, index) {
                                  if (index == 0) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: defaultSpace),
                                      child: Column(
                                        children: [
                                          const SizedBox(height: defaultSpace),
                                          AwardWidget(
                                            mainColor: compareColor,
                                          ),
                                        ],
                                      ),
                                    );
                                  }
                                  return Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: defaultSpace),
                                    child: AwardWidget(
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
                  ],
                )
              : Obx(() {
                  if (getAwardController.isLoading.value) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (getAwardController.error.isNotEmpty) {
                    return Center(child: Text(getAwardController.error.value));
                  }
                  final awards = getAwardController.awards;
                  if (awards.isEmpty) {
                    return const Center(child: Text('No awards found.'));
                  }
                  return ListView.separated(
                    itemCount: awards.length,
                    separatorBuilder: (context, index) => const SizedBox(),
                    itemBuilder: (context, index) {
                      final award = awards[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: defaultSpace),
                        child: AwardWidget(
                          mainColor: thirdtyColor,
                          award: award,
                          ontap: null,
                          ontapRoute: () => Get.toNamed(RouteName.singleAward),
                        ),
                      );
                    },
                  );
                }),
        ),
      ),
    );
  }
}
