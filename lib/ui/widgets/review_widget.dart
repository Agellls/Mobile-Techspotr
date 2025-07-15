import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/shared/theme.dart';
import 'package:flutter_application_1/ui/widgets/report_widget.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shimmer/shimmer.dart';

import '../../utilities/loading.dart';

class ReviewsWidgetController extends GetxController {
  var isFullReview = false.obs;

  void toggleFullReview() {
    isFullReview.value = !isFullReview.value;
  }
}

class ReviewsWidget extends StatelessWidget {
  final Color mainColor;
  ReviewsWidget({super.key, required this.mainColor});

  final List<String> tags = [
    'LG',
    'Smart TV',
    'OLED',
    '4K',
    'Gaming',
    'Home Theater',
  ];
  final TextEditingController reasonController = TextEditingController();
  final ReviewsWidgetController reviewsWidgetController =
      Get.put(ReviewsWidgetController());

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
          bottom: defaultSpace, right: defaultSpace, left: defaultSpace),
      padding: const EdgeInsets.all(defaultSpace),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(defaultSpace),
        ),
        boxShadow: [
          BoxShadow(
            color: blackColor.withOpacity(0.3),
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // header row
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipOval(
                child: CachedNetworkImage(
                  imageUrl:
                      'https://wallpapers.com/images/featured-full/cool-profile-picture-87h46gcobjl5e4xu.jpg',
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Shimmer.fromColors(
                    baseColor: secondaryColor,
                    highlightColor: thirdtyColor,
                    child: const ShimmerPerProfile(),
                  ),
                  errorWidget: (context, url, error) => Image.network(
                    'https://icons.veryicon.com/png/o/business/new-vision-2/picture-loading-failed-1.png',
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: defaultSpace),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'John Doe',
                    style: blackTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: bold,
                    ),
                  ),
                  Text(
                    '1 Reviews',
                    style: blackTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: regular,
                      color: mainColor,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '2 days ago',
                    style: blackTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: regular,
                      color: blackColor,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star_rate_rounded,
                        color: blackColor,
                        size: 23,
                      ),
                      Text(
                        '5',
                        style: blackTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: bold,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),

          // review content
          const SizedBox(height: defaultSpace),
          Text(
            'LG is the brand you can trust',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: bold,
            ),
          ),
          const SizedBox(height: defaultSpace / 2),
          Text(
            'Sunt occaecat duis eiusmod mollit elit ex fugiat veniam commodo non. Fugiat do sint veniam officia deserunt exercitation aliqua. Laborum enim enim do do ullamco. Fugiat consectetur magna in ut amet cupidatat aliqua.',
            style: blackTextStyle.copyWith(
              fontSize: 14,
              fontWeight: regular,
            ),
          ),

          // Wrap the conditional content with Obx for reactivity
          Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (reviewsWidgetController.isFullReview.value) ...[
                  // pros and cons
                  const SizedBox(height: defaultSpace),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Pros',
                              style: blackTextStyle.copyWith(
                                fontSize: 16,
                                fontWeight: bold,
                              ),
                            ),
                            ...buildBulletedList(['test', 'keren'],
                                isPositive: true),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Cons',
                              style: blackTextStyle.copyWith(
                                fontSize: 16,
                                fontWeight: bold,
                              ),
                            ),
                            ...buildBulletedList(['not good la', 'technologia'],
                                isPositive: false),
                          ],
                        ),
                      ),
                    ],
                  ),

                  // features
                  const SizedBox(height: defaultSpace),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: mainColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: IntrinsicWidth(
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Text(
                                '4',
                                style: blackTextStyle.copyWith(
                                  fontSize: 20,
                                  fontWeight: bold,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                'WEIGHT',
                                style: textActiveColor.copyWith(
                                  fontSize: 12,
                                  fontWeight: light,
                                  color: blackColor,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: defaultSpace / 2),
                          Column(
                            children: [
                              Text(
                                '5',
                                style: blackTextStyle.copyWith(
                                  fontSize: 20,
                                  fontWeight: bold,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                'PRICING',
                                style: textActiveColor.copyWith(
                                  fontSize: 12,
                                  fontWeight: light,
                                  color: blackColor,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: defaultSpace / 2),
                          Column(
                            children: [
                              Text(
                                '4',
                                style: blackTextStyle.copyWith(
                                  fontSize: 20,
                                  fontWeight: bold,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                'SERVICE',
                                style: textActiveColor.copyWith(
                                  fontSize: 12,
                                  fontWeight: light,
                                  color: blackColor,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: defaultSpace / 2),
                          Column(
                            children: [
                              Text(
                                '4',
                                style: blackTextStyle.copyWith(
                                  fontSize: 20,
                                  fontWeight: bold,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                'DELIVERY',
                                style: textActiveColor.copyWith(
                                  fontSize: 12,
                                  fontWeight: light,
                                  color: blackColor,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: defaultSpace / 2),
                          Column(
                            children: [
                              Text(
                                '5',
                                style: blackTextStyle.copyWith(
                                  fontSize: 20,
                                  fontWeight: bold,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                'PRODUCT',
                                style: textActiveColor.copyWith(
                                  fontSize: 12,
                                  fontWeight: light,
                                  color: blackColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  // tags
                  const SizedBox(height: defaultSpace),
                  Column(
                    children: [
                      if (tags.isNotEmpty) ...[
                        const SizedBox(height: defaultSpace / 2),
                        Wrap(
                          spacing: 5, // horizontal spacing between tags
                          runSpacing:
                              5, // vertical spacing between lines of tags
                          children: [
                            for (var tag in tags)
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                decoration: BoxDecoration(
                                  color: mainColor,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Text(
                                  tag,
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 14,
                                    fontWeight: regular,
                                  ),
                                  maxLines: 1,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                          ],
                        ),
                      ],
                    ],
                  ),
                ],
              ],
            ),
          ),

          // function
          const SizedBox(height: defaultSpace),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(color: primaryColor),
                      child: Row(
                        children: [
                          Row(
                            children: [
                              Icon(
                                CupertinoIcons.heart,
                                color: blackColor,
                                size: 18,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                'Useful',
                                style: blackTextStyle.copyWith(
                                  fontSize: 14,
                                  fontWeight: regular,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 5),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: defaultSpace / 2),
                  // Update the Full Review button to show different text based on state
                  Obx(
                    () => GestureDetector(
                      onTap: () {
                        reviewsWidgetController.toggleFullReview();
                      },
                      child: Container(
                        decoration: BoxDecoration(color: primaryColor),
                        child: Row(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  reviewsWidgetController.isFullReview.value
                                      ? CupertinoIcons.arrow_down_right_circle
                                      : CupertinoIcons.arrow_up_right_circle,
                                  color: blackColor,
                                  size: 18,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  reviewsWidgetController.isFullReview.value
                                      ? 'Hide Details'
                                      : 'Full Review',
                                  style: blackTextStyle.copyWith(
                                    fontSize: 14,
                                    fontWeight: regular,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Share.share(
                        'Check this out, agellls has write reviews in troupon. you can view more here https://troupon.com/review'),
                    child: Container(
                      color: primaryColor,
                      child: Icon(
                        CupertinoIcons.share,
                        color: blackColor,
                        size: 18,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () => Get.bottomSheet(
                      ReportWidget(reasonController: reasonController, id: 1),
                      isScrollControlled: true,
                    ),
                    child: Container(
                      color: primaryColor,
                      child: Icon(
                        CupertinoIcons.flag,
                        color: blackColor,
                        size: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

List<Widget> buildBulletedList(List items, {bool isPositive = true}) {
  return items
      .map(
        (item) => Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Icon(
                isPositive
                    ? CupertinoIcons.check_mark_circled
                    : CupertinoIcons.xmark_circle,
                color: isPositive ? Colors.green : Colors.red,
                size: 16,
              ),
            ),
            const SizedBox(width: 5),
            Expanded(
              child: Text(
                item,
                style: blackTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: regular,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      )
      .toList();
}
