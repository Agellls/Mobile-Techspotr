import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/ui/widgets/award_response_widget.dart';
import 'package:flutter_application_1/ui/widgets/award_text_widget.dart';
import 'package:flutter_application_1/ui/widgets/button_widget.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';

import '../../shared/app_svg.dart';
import '../../shared/theme.dart';
import '../../utilities/loading.dart';
import 'store_button.dart';

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
  });

  final bool isEmpty = false;

  @override
  Widget build(BuildContext context) {
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
        const SizedBox(height: defaultSpace * 2),
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
              isActive: false,
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
        const SizedBox(height: defaultSpace / 2),
        Row(
          children: [
            const SizedBox(width: defaultSpace / 2),
            CachedNetworkImage(
              imageUrl: imageUrl,
              width: 70,
              height: 70,
              fit: BoxFit.cover,
              placeholder: (context, url) => Shimmer.fromColors(
                baseColor: secondaryColor,
                highlightColor: thirdtyColor,
                child: const ShimmerPerProfile(),
              ),
              errorWidget: (context, url, error) => Image.network(
                'https://icons.veryicon.com/png/o/business/new-vision-2/picture-loading-failed-1.png',
                width: 70,
                height: 70,
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
                      fontSize: 18,
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
        const SizedBox(height: defaultSpace / 2),
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
              if (prices.length <= 2)
                Expanded(
                  child: Text(
                    brandName,
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: extrabold,
                    ),
                  ),
                )
              else
                const Spacer(),
              // Loop StoreButton for each price
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
                return Row(
                  children: [
                    StoreButton(
                      logoUrl: logoUrl,
                      price: priceValue,
                      currency: '\$',
                      onTap: () async {
                        // Add your logic for launching the price link if needed
                      },
                    ),
                    if (price != prices.last) const SizedBox(width: 10),
                  ],
                );
              }),
            ],
          ),
        ),
        const SizedBox(height: defaultSpace / 2),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: defaultSpace / 2),
          padding: const EdgeInsets.all(defaultSpace),
          decoration: BoxDecoration(
            color: thirdtyColor,
            borderRadius: isEmpty
                ? BorderRadius.circular(10)
                : const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'What the Crowd Said',
                    style: whiteTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    'THEY SAW, THEY JUDGED, THEY CLICKED.',
                    style: whiteTextStyle.copyWith(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: whiteColor.withOpacity(0.6),
                    ),
                  ),
                ],
              ),
              ButtonWidget(
                bgColor: compareColor,
                bgActiveColor: activeColor,
                text: 'RESPOND',
                icon: AppSvg.response,
                totalReaction: 0,
                width: 135,
              ),
            ],
          ),
        ),
        AwardResponseWidget(mainColor: thirdtyColor),
        AwardResponseWidget(mainColor: thirdtyColor),
        Container(
          height: 50,
          margin: const EdgeInsets.symmetric(horizontal: defaultSpace / 2),
          decoration: BoxDecoration(
            color: thirdtyColor,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
          child: Center(
            child: Text(
              'Load More',
              style: whiteTextStyle.copyWith(
                fontSize: 16,
                fontWeight: bold,
              ),
            ),
          ),
        ),
        const SizedBox(height: defaultSpace),
        AwardTextWidget(
          content: content,
          pros: pros,
          cons: cons,
        ),
        const SizedBox(height: defaultSpace),
      ],
    );
  }
}
