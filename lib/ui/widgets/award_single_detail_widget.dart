import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/routes/routes_name.dart';
import 'package:flutter_application_1/ui/widgets/award_text_widget.dart';
import 'package:flutter_application_1/ui/widgets/button_widget.dart';
import 'package:flutter_application_1/ui/widgets/store_button.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../shared/app_svg.dart';
import '../../shared/theme.dart';
import '../../utilities/loading.dart';
import 'award_single_rating_widget.dart';

class AwardSingleDetailWidget extends StatelessWidget {
  final int index;
  final String imageUrl;
  final String productName;
  final String subtitle;
  final String content;
  final int totalScore;
  final String brandName;
  final String brandLogoUrl;
  final List<dynamic> prices;
  final List<String> pros;
  final List<String> cons;
  final List<Map<String, dynamic>> awardItems; // <-- Add this property

  const AwardSingleDetailWidget({
    super.key,
    required this.index,
    required this.imageUrl,
    required this.productName,
    required this.subtitle,
    required this.content,
    required this.totalScore,
    required this.brandName,
    required this.brandLogoUrl,
    required this.prices,
    required this.pros,
    required this.cons,
    this.awardItems = const [], // <-- Default empty
  });

  final bool isEmpty = false;

  @override
  Widget build(BuildContext context) {
    final RxBool showFull = false.obs; // Local observable for each widget

    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: compareColor,
            shape: BoxShape.circle,
            border: Border.all(
              color: blackColor.withOpacity(0.3),
              width: 5,
              strokeAlign: BorderSide.strokeAlignInside,
            ),
          ),
          child: Center(
            child: Text(
              index.toString(),
              style: whiteTextStyle.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),
        ),
        const SizedBox(height: defaultSpace),
        SvgPicture.string(
          AppSvg.petikAtas,
          width: 25,
          color: blackColor.withOpacity(0.3),
        ),
        const SizedBox(height: defaultSpace / 2),
        Text(
          productName,
          style: blackTextStyle.copyWith(
            fontSize: 18,
            fontWeight: bold,
            color: blackColor.withOpacity(0.6),
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          subtitle,
          style: blackTextStyle.copyWith(
            fontSize: 24,
            fontWeight: extrabold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: defaultSpace / 2),
        SvgPicture.string(
          AppSvg.petikBawah,
          width: 25,
          color: blackColor.withOpacity(0.3),
        ),
        const SizedBox(height: defaultSpace),
        ButtonWidget(
          bgColor: compareColor,
          bgActiveColor: activeColor,
          text: 'HYPE IT!',
          icon: AppSvg.hypeit,
          isActive: false,
          totalReaction: 3,
          width: 185,
          height: 55,
        ),
        const SizedBox(height: defaultSpace),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ButtonWidget(
              bgColor: thirdtyColor,
              bgActiveColor: activeColor,
              text: 'I WANT',
              icon: AppSvg.iwant,
              isActive: false,
              totalReaction: 4,
            ),
            ButtonWidget(
              bgColor: thirdtyColor,
              bgActiveColor: activeColor,
              text: 'I HAVE',
              icon: AppSvg.ihave,
              isActive: true,
              totalReaction: 2,
            ),
            ButtonWidget(
              bgColor: thirdtyColor,
              bgActiveColor: activeColor,
              text: 'I HAD',
              icon: AppSvg.ihad,
              isActive: false,
              totalReaction: 1,
            ),
          ],
        ),
        const SizedBox(height: defaultSpace),
        Row(
          children: [
            const SizedBox(width: defaultSpace / 2),
            CachedNetworkImage(
              imageUrl: imageUrl,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
              placeholder: (context, url) => Shimmer.fromColors(
                baseColor: secondaryColor,
                highlightColor: thirdtyColor,
                child: const ShimmerPerProfile(),
              ),
              errorWidget: (context, url, error) => Image.network(
                'https://icons.veryicon.com/png/o/business/new-vision-2/picture-loading-failed-1.png',
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: defaultSpace / 2),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    productName,
                    style: blackTextStyle.copyWith(
                      fontWeight: bold,
                      fontSize: 20,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '$totalScore Scores',
                    style: blackTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: regular,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: defaultSpace),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: defaultSpace / 1.3,
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(defaultSpace / 2),
                decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ClipOval(
                  child: CachedNetworkImage(
                    imageUrl: brandLogoUrl,
                    width: 30,
                    height: 30,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Shimmer.fromColors(
                      baseColor: secondaryColor,
                      highlightColor: thirdtyColor,
                      child: const ShimmerPerProfile(),
                    ),
                    errorWidget: (context, url, error) => Image.network(
                      'https://icons.veryicon.com/png/o/business/new-vision-2/picture-loading-failed-1.png',
                      width: 30,
                      height: 30,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: defaultSpace / 2),
              Expanded(
                child: Text(
                  brandName,
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: extrabold,
                  ),
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () => Get.toNamed(RouteName.response),
                child: Container(
                  decoration: BoxDecoration(
                    color: primaryColor,
                  ),
                  child: Row(
                    children: [
                      Text(
                        'Response',
                        style: blackTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: regular,
                          color: blackColor.withOpacity(0.6),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SvgPicture.string(
                        AppSvg.response,
                        width: 20,
                        height: 20,
                        color: blackColor.withOpacity(0.6),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: defaultSpace),
        Row(
          children: [
            const SizedBox(width: defaultSpace / 2),
            ...prices.map((price) {
              final priceValue = (price['price'] is num)
                  ? (price['price'] as num).toDouble()
                  : 0.0;
              final link = price['link'] ?? '';
              String domain = '';
              try {
                domain = Uri.parse(link).host;
              } catch (_) {
                domain = '';
              }
              final logoUrl =
                  'https://t2.gstatic.com/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&url=https://$domain&size=128';
              return Padding(
                padding: const EdgeInsets.only(right: 10),
                child: StoreButton(
                  logoUrl: logoUrl,
                  price: priceValue,
                  currency: '\$',
                  onTap: () async {
                    // Add your logic for launching the price link if needed
                  },
                ),
              );
            }),
          ],
        ),
        if (awardItems.isNotEmpty && index - 1 < awardItems.length)
          Obx(() => showFull.value
              ? Builder(
                  builder: (context) {
                    final item = awardItems[index - 1];
                    final post = item['post'] ?? {};
                    return AwardSingleRatingWidget(
                      totalRating: post['avg_rating'] ?? 0.0,
                      totalReview: post['total_spec_useful'] ?? 0,
                      subtitle: item['subtitle'] ?? '',
                      specs: [item], // Pass only the current item
                    );
                  },
                )
              : const SizedBox.shrink()),
        Column(
          children: [
            const SizedBox(height: defaultSpace),
            Obx(() => showFull.value
                ? AwardTextWidget(
                    content: content,
                    pros: pros,
                    cons: cons,
                  )
                : const SizedBox.shrink()),
            const SizedBox(height: defaultSpace / 2),
            GestureDetector(
              onTap: () {
                showFull.value = !showFull.value;
              },
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: defaultSpace / 2),
                padding: const EdgeInsets.symmetric(
                    horizontal: defaultSpace, vertical: defaultSpace / 2),
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                  color: primaryColor,
                ),
                child: Obx(() => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          showFull.value ? 'SHOW LESS' : 'SHOW MORE',
                          style: blackTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: bold,
                          ),
                        ),
                        const SizedBox(width: defaultSpace / 2),
                        Icon(
                          showFull.value
                              ? Icons.expand_less
                              : Icons.expand_more,
                          color: blackColor,
                          size: 20,
                        ),
                      ],
                    )),
              ),
            ),
          ],
        ),
        Divider(
          color: blackColor,
          height: defaultSpace * 1.5,
          thickness: 0.5,
        ),
      ],
    );
  }
}
