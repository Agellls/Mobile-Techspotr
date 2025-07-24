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
  const AwardSingleDetailWidget({super.key});

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
              '1',
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
          'Samsung S8273828973',
          style: blackTextStyle.copyWith(
            fontSize: 18,
            fontWeight: bold,
            color: blackColor.withOpacity(0.6),
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          'Best Overall',
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
              isActive: true,
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
              imageUrl:
                  'https://www.rankcdn.com/cdn-cgi/image/quality=90,onerror=redirect,format=webp,fit=cover,width=700/techspotr.com/untitled-3.png',
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
                    'Samsung S43534',
                    style: blackTextStyle.copyWith(
                      fontWeight: bold,
                      fontSize: 18,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '9.2 Scores',
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
                    imageUrl:
                        'https://www.rankcdn.com/cdn-cgi/image/quality=90,onerror=redirect,format=webp,fit=cover,width=64,height=64/techspotr.com/samsung-logo.png',
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
                  'Samsung',
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: extrabold,
                  ),
                ),
              ),
              if (1 == 1) ...[
                StoreButton(
                  logoUrl:
                      'https://t2.gstatic.com/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&url=http://www.amazon.com&size=128',
                  price: 342.00,
                  currency: '\$',
                  onTap: () async {
                    // if (singleController.productPriceLinks.isNotEmpty) {
                    //   final url = singleController.productPriceLinks[0];
                    //   if (url.isNotEmpty &&
                    //       await canLaunchUrl(Uri.parse(url))) {
                    //     await launchUrl(Uri.parse(url),
                    //         mode: LaunchMode.externalApplication);
                    //   }
                    // }
                  },
                ),
                const SizedBox(width: 10),
                if (2 == 2)
                  StoreButton(
                    logoUrl:
                        'https://t2.gstatic.com/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&url=http://www.amazon.com&size=128',
                    price: 523.00,
                    currency: '\$',
                    onTap: () async {
                      // if (singleController.productPriceLinks.length > 1) {
                      //   final url = singleController.productPriceLinks[1];
                      //   if (url.isNotEmpty &&
                      //       await canLaunchUrl(Uri.parse(url))) {
                      //     await launchUrl(Uri.parse(url),
                      //         mode: LaunchMode.externalApplication);
                      //   }
                      // }
                    },
                  ),
              ],
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
        AwardTextWidget(),
        const SizedBox(height: defaultSpace),
      ],
    );
  }
}
