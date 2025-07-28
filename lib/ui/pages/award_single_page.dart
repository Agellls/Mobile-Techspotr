import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/widgets/award_single_item_widget.dart';
import 'package:flutter_application_1/ui/widgets/award_single_detail_widget.dart';
import 'package:flutter_application_1/ui/widgets/award_single_prices_widget.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../controllers/award_single_controller.dart';
import '../../shared/app_svg.dart';
import '../../shared/theme.dart';
import '../../utilities/loading.dart';
import '../widgets/award_single_rating_widget.dart';

class AwardSinglePage extends StatelessWidget {
  const AwardSinglePage({super.key, this.awardId = 5});
  final int awardId;

  @override
  Widget build(BuildContext context) {
    final horizontalScrollController = ScrollController();
    final controller = Get.put(AwardSingleController());

    // Fetch award data
    controller.fetchAward(awardId);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Detail Award',
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
      body: Obx(
        () {
          if (controller.isLoading.value) {
            return const Center(child: CupertinoActivityIndicator());
          }
          final award = controller.award.value;
          if (award == null) {
            return const Center(child: Text('Failed to load award'));
          }
          return SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Icon(CupertinoIcons.bag_fill,
                              color: compareColor, size: 20),
                          const SizedBox(width: 5),
                          Text(
                            '${award['total_all_post'] ?? ''}',
                            style: whiteTextStyle.copyWith(
                                fontSize: 16,
                                fontWeight: bold,
                                color: compareColor),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            'Products',
                            style: whiteTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: bold,
                              color: compareColor,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(CupertinoIcons.chat_bubble_fill,
                              color: compareColor, size: 20),
                          const SizedBox(width: 5),
                          Text(
                            '${award['total_response'] ?? ''}',
                            style: whiteTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: bold,
                              color: compareColor,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            'Response',
                            style: whiteTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: bold,
                              color: compareColor,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(CupertinoIcons.heart_fill,
                              color: compareColor, size: 20),
                          const SizedBox(width: 5),
                          Text(
                            '${award['total_useful'] ?? ''}',
                            style: whiteTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: bold,
                              color: compareColor,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            'Likes',
                            style: whiteTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: bold,
                              color: compareColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: defaultSpace / 2),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: defaultSpace),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '${award['title'] ?? ''} ',
                            style: blackTextStyle.copyWith(
                              fontSize: 20,
                              fontWeight: bold,
                            ),
                          ),
                          TextSpan(
                            text:
                                '${award['total_item'] ?? ''} Champs & ${award['total_post_candidate'] ?? ''} Wannabes — ${award['teaser_text'] ?? ''}',
                            style: blackTextStyle.copyWith(
                              fontSize: 20,
                              fontWeight: regular,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: defaultSpace / 2),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: defaultSpace),
                    child: Text(
                      '${award['subtitle'] ?? ''}',
                      style: blackTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: regular,
                        color: blackColor.withOpacity(0.6),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: defaultSpace / 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Stack(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(15),
                            width: 55,
                            height: 55,
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                image: NetworkImage(
                                    'https://www.rankcdn.com/cdn-cgi/image/quality=90,onerror=redirect,format=webp,fit=cover,width=100/techspotr.com/andhi-about-image.jpg'),
                                fit: BoxFit.cover,
                              ),
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: thirdtyColor,
                                width: 5,
                                strokeAlign: BorderSide.strokeAlignOutside,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            child: Container(
                              width: 85,
                              height: 20,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: compareColor,
                              ),
                              child: Center(
                                child: Text(
                                  'Supermod',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 14,
                                    fontWeight: bold,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      Stack(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(15),
                            width: 55,
                            height: 55,
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                image: NetworkImage(
                                    'https://www.rankcdn.com/cdn-cgi/image/quality 85,onerror=redirect,format=webp,fit=cover,width=100/techspotr.com/maya-about-img-2.PNG'),
                                fit: BoxFit.cover,
                              ),
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: thirdtyColor,
                                width: 5,
                                strokeAlign: BorderSide.strokeAlignOutside,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            child: Container(
                              width: 85,
                              height: 20,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: compareColor,
                              ),
                              child: Center(
                                child: Text(
                                  'Editor',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 14,
                                    fontWeight: bold,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      Stack(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(15),
                            width: 55,
                            height: 55,
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                image: NetworkImage(
                                    'https://www.rankcdn.com/cdn-cgi/image/quality 85,onerror=redirect,format=webp,fit=cover,width=100/techspotr.com/iqbal-about-img.PNG'),
                                fit: BoxFit.cover,
                              ),
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: thirdtyColor,
                                width: 5,
                                strokeAlign: BorderSide.strokeAlignOutside,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            child: Container(
                              width: 85,
                              height: 20,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: compareColor,
                              ),
                              child: Center(
                                child: Text(
                                  'Moderator',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 14,
                                    fontWeight: bold,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: defaultSpace),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: defaultSpace),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                              top: 5, bottom: 5, right: 10, left: 5),
                          decoration: BoxDecoration(
                            color: thirdtyColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.arrow_drop_down_circle_sharp,
                                color: whiteColor,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                'What\'s the deal ?',
                                style: whiteTextStyle.copyWith(
                                  fontSize: 14,
                                  fontWeight: bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                              top: 5, bottom: 5, right: 10, left: 5),
                          decoration: BoxDecoration(
                            color: thirdtyColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.arrow_drop_down_circle_sharp,
                                color: whiteColor,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                'What\'s the deal ?',
                                style: whiteTextStyle.copyWith(
                                  fontSize: 14,
                                  fontWeight: bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: defaultSpace),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: defaultSpace),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: CachedNetworkImage(
                        imageUrl: '${award['image'] ?? ''}',
                        width: double.infinity,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => Shimmer.fromColors(
                          baseColor: secondaryColor,
                          highlightColor: thirdtyColor,
                          child: const ShimmerPerProfile(),
                        ),
                        errorWidget: (context, url, error) => Image.network(
                          'https://icons.veryicon.com/png/o/business/new-vision-2/picture-loading-failed-1.png',
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: defaultSpace * 2),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: defaultSpace),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'What\'s the Deal?',
                          style: blackTextStyle.copyWith(
                            fontSize: 20,
                            fontWeight: bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          'Quick lowdown, no fluff.',
                          style: blackTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: regular,
                            color: blackColor.withOpacity(0.6),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Html(
                          data: '${award['intro'] ?? ''}',
                          style: {
                            "p.gabarito": Style(
                              textAlign: TextAlign.center,
                              fontWeight: FontWeight.w300,
                              fontSize: FontSize(18),
                            ),
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: defaultSpace),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: defaultSpace),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'How’d We Pick ‘Em?',
                          style: blackTextStyle.copyWith(
                            fontSize: 20,
                            fontWeight: bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          'Our not-so-secret sauce, spilled.',
                          style: blackTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: regular,
                            color: blackColor.withOpacity(0.6),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: defaultSpace / 2),
                        HowWePickSteps(
                          steps: List<Map<String, dynamic>>.from(
                            award['reason'] ?? [],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: defaultSpace * 2),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: defaultSpace),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Too Lazy to Scroll?',
                          style: blackTextStyle.copyWith(
                            fontSize: 20,
                            fontWeight: bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          'Here’s the Cheat Sheet!',
                          style: blackTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: regular,
                            color: blackColor.withOpacity(0.6),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: defaultSpace),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    controller: horizontalScrollController,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: defaultSpace / 2,
                      ),
                      decoration: BoxDecoration(
                        color: thirdtyColor,
                        border: Border(
                          bottom: BorderSide(
                            color: whiteColor,
                            width: 0.1,
                          ),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Column(
                                children: [
                                  RotatedBox(
                                    quarterTurns: 3,
                                    child: Text(
                                      'NO',
                                      style: whiteTextStyle.copyWith(
                                        fontWeight: extrabold,
                                        fontSize: 20,
                                        letterSpacing: 2,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 120),
                                  RotatedBox(
                                    quarterTurns: 3,
                                    child: Text(
                                      'NAME',
                                      style: whiteTextStyle.copyWith(
                                        fontWeight: extrabold,
                                        fontSize: 20,
                                        letterSpacing: 2,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(width: defaultSpace / 2),
                              Container(
                                width: 0.1,
                                height: 350,
                                color: whiteColor,
                              ),
                              const SizedBox(width: defaultSpace / 2),
                              ...List.generate(
                                (award['award_items'] ?? []).length,
                                (i) {
                                  final item = award['award_items'][i];
                                  final post = item['post'] ?? {};
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AwardItemWidget(
                                        index: i + 1,
                                        totalScore: post['score'] ?? 0,
                                        imageUrl: post['image'] ?? '',
                                        brandLogoUrl:
                                            post['brand']?['image'] ?? '',
                                        brandName: post['brand']?['name'] ?? '',
                                        productName: post['title'] ?? '',
                                      ),
                                      if (i <
                                          (award['award_items'] ?? []).length -
                                              1) ...[
                                        const SizedBox(width: defaultSpace / 2),
                                        Container(
                                          width: 0.1,
                                          height: 350,
                                          color: whiteColor,
                                        ),
                                      ],
                                    ],
                                  );
                                },
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  RotatedBox(
                                    quarterTurns: 3,
                                    child: Text(
                                      'RATINGS',
                                      style: whiteTextStyle.copyWith(
                                        fontWeight: extrabold,
                                        fontSize: 20,
                                        letterSpacing: 2,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: defaultSpace * 2),
                                  RotatedBox(
                                    quarterTurns: 3,
                                    child: Text(
                                      'HIGHLIGHTS',
                                      style: whiteTextStyle.copyWith(
                                        fontWeight: extrabold,
                                        fontSize: 20,
                                        letterSpacing: 2,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: defaultSpace * 2),
                                  RotatedBox(
                                    quarterTurns: 3,
                                    child: Text(
                                      'SPECS',
                                      style: whiteTextStyle.copyWith(
                                        fontWeight: extrabold,
                                        fontSize: 20,
                                        letterSpacing: 2,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: defaultSpace),
                                ],
                              ),
                              const SizedBox(width: defaultSpace / 2),
                              Container(
                                width: 0.1,
                                height: 1380,
                                color: whiteColor,
                              ),
                              const SizedBox(width: defaultSpace / 2),
                              ...List.generate(
                                (award['award_items'] ?? []).length,
                                (i) {
                                  final item = award['award_items'][i];
                                  final post = item['post'] ?? {};
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AwardSingleRatingWidget(
                                        totalRating: post['avg_rating'] ?? 0.0,
                                        totalReview:
                                            post['total_spec_useful'] ?? 0,
                                        subtitle: item['subtitle'] ?? '',
                                        specs: [item],
                                      ),
                                      if (i <
                                          (award['award_items'] ?? []).length -
                                              1) ...[
                                        const SizedBox(width: defaultSpace / 2),
                                        Container(
                                          width: 0.1,
                                          height: 1380,
                                          color: whiteColor,
                                        ),
                                      ],
                                    ],
                                  );
                                },
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  RotatedBox(
                                    quarterTurns: 3,
                                    child: Text(
                                      'PRICES',
                                      style: whiteTextStyle.copyWith(
                                        fontWeight: extrabold,
                                        fontSize: 20,
                                        letterSpacing: 2,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: defaultSpace),
                                ],
                              ),
                              const SizedBox(width: defaultSpace / 2),
                              Container(
                                width: 0.1,
                                height: 160,
                                color: whiteColor,
                              ),
                              const SizedBox(width: defaultSpace / 2),
                              ...List.generate(
                                (award['award_items'] ?? []).length,
                                (i) {
                                  final item = award['award_items'][i];
                                  final post = item['post'] ?? {};
                                  final prices = post['prices'] ?? [];
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      AwardSinglePricesWidget(prices: prices),
                                      if (i <
                                          (award['award_items'] ?? []).length -
                                              1) ...[
                                        const SizedBox(width: defaultSpace / 2),
                                        Container(
                                          width: 0.1,
                                          height: 160,
                                          color: whiteColor,
                                        ),
                                      ],
                                    ],
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: defaultSpace),
                  Text(
                    'Hall of Fame Finds',
                    style: blackTextStyle.copyWith(
                      fontSize: 20,
                      fontWeight: bold,
                    ),
                  ),
                  Text(
                    'Legendary champs that deserve a spotlight.',
                    style: blackTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: bold,
                      color: blackColor.withOpacity(0.6),
                    ),
                  ),
                  const SizedBox(height: defaultSpace),
                  // Dynamic height based on content
                  Column(
                    children: List.generate(
                      (award['award_items'] ?? []).length,
                      (i) {
                        final item = award['award_items'][i];
                        final post = item['post'] ?? {};
                        return AwardSingleDetailWidget(
                          index: i + 1,
                          imageUrl: post['image'] ?? '',
                          productName: post['title'] ?? '',
                          subtitle: item['subtitle'] ?? '',
                          content: item['content'] ?? '',
                          totalScore: post['score'] ?? 0,
                          brandName: post['brand']?['name'] ?? '',
                          brandLogoUrl: post['brand']?['image'] ?? '',
                          prices: post['prices'] ?? [],
                          pros: List<String>.from(item['pros'] ?? []),
                          cons: List<String>.from(item['cons'] ?? []),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: defaultSpace / 2,
                  ),
                  Text(
                    'Stuff You Were Too Shy to Ask',
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.end,
                  ),
                  Text(
                    'But we answered it anyway.',
                    style: blackTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: light,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.end,
                  ),
                  const SizedBox(height: defaultSpace / 2),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: defaultSpace / 2),
                    child: HowWePickSteps(
                      steps: List<Map<String, dynamic>>.from(
                        award['faq'] ?? [],
                      ),
                      useNumber: false,
                    ),
                  ),
                  const SizedBox(height: defaultSpace),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: defaultSpace),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: CachedNetworkImage(
                        imageUrl: '${award['image'] ?? ''}',
                        width: double.infinity,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => Shimmer.fromColors(
                          baseColor: secondaryColor,
                          highlightColor: thirdtyColor,
                          child: const ShimmerPerProfile(),
                        ),
                        errorWidget: (context, url, error) => Image.network(
                          'https://icons.veryicon.com/png/o/business/new-vision-2/picture-loading-failed-1.png',
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),

                  // conclusion
                  const SizedBox(height: defaultSpace * 2),
                  Text(
                    'Because who reads everything, right?',
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.end,
                  ),
                  Text(
                    'Big Brain Stuff, Summed Up',
                    style: blackTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: light,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.end,
                  ),
                  const SizedBox(height: defaultSpace / 2),
                  Html(
                    data: '${award['conclusion'] ?? ''}',
                    style: {
                      "p.gabarito": Style(
                        textAlign: TextAlign.center,
                        fontWeight: FontWeight.w300,
                        fontSize: FontSize(18),
                      ),
                    },
                  ),
                  Container(
                    width: 35,
                    height: 35,
                    padding: const EdgeInsets.all(defaultSpace / 2),
                    decoration: BoxDecoration(
                      color: thirdtyColor,
                      shape: BoxShape.circle,
                      border: Border.all(color: thirdtyColor, width: 2),
                    ),
                    child: Center(
                      child: SvgPicture.string(
                        AppSvg.liked,
                        width: 20,
                        color: whiteColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: defaultSpace / 2,
                  ),
                  Text(
                    '0 Likes',
                    style: blackTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: medium,
                    ),
                  ),
                  const SizedBox(height: defaultSpace),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _menuTile(String title, String subtitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 18, vertical: 0),
          title: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
              fontSize: 16,
            ),
          ),
          subtitle: Text(
            subtitle,
            style: TextStyle(
              color: Colors.white.withOpacity(0.85),
              fontSize: 13,
            ),
          ),
          onTap: () {
            // Add your navigation or logic here
          },
        ),
        Divider(color: Colors.white24, height: 1, thickness: 1),
      ],
    );
  }
}

class HowWePickStepsController extends GetxController {
  var expandedIndex = RxnInt();
}

class HowWePickSteps extends StatelessWidget {
  final List<Map<String, dynamic>> steps;
  final bool useNumber;
  const HowWePickSteps({
    super.key,
    required this.steps,
    this.useNumber = true,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HowWePickStepsController());
    return Obx(
      () => Column(
        children: List.generate(
          steps.length,
          (i) {
            final isExpanded = controller.expandedIndex.value == i;
            return Column(
              children: [
                InkWell(
                  onTap: () {
                    controller.expandedIndex.value = isExpanded ? null : i;
                  },
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (useNumber) ...[
                        Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            color: thirdtyColor,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: thirdtyColor.withOpacity(0.4),
                              width: 2,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "${i + 1}",
                              style: whiteTextStyle.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                      ],
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    steps[i]["q"] ?? '',
                                    style: blackTextStyle.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                Icon(
                                  isExpanded
                                      ? Icons.keyboard_arrow_down
                                      : Icons.keyboard_arrow_right,
                                  color: thirdtyColor,
                                  size: 28,
                                ),
                              ],
                            ),
                            if (isExpanded)
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Html(
                                  data: steps[i]["a"] ?? '',
                                  style: {
                                    "p": Style(
                                      fontSize: FontSize(15),
                                      color: blackColor,
                                    ),
                                  },
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                if (i < steps.length - 1)
                  Divider(
                    color: thirdtyColor,
                    thickness: 0.5,
                    height: 16,
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
