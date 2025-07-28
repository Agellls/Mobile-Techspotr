import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:shimmer/shimmer.dart';

import '../../shared/theme.dart';
import '../../utilities/loading.dart';

class AwardItemWidget extends StatelessWidget {
  final int index;
  final String imageUrl;
  final int totalScore;
  final String brandName;
  final String brandLogoUrl;
  final String productName;
  const AwardItemWidget({
    super.key,
    required this.index,
    required this.imageUrl,
    required this.totalScore,
    required this.brandName,
    required this.brandLogoUrl,
    required this.productName,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: defaultSpace * 2),
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: compareColor,
              shape: BoxShape.circle,
              border: Border.all(
                  color: blackColor.withOpacity(0.3),
                  width: 5,
                  strokeAlign: BorderSide.strokeAlignInside),
            ),
            child: Center(
              child: Text(
                index.toString(),
                style: whiteTextStyle.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          const SizedBox(height: defaultSpace / 2),
          CachedNetworkImage(
            imageUrl: imageUrl,
            width: 120,
            height: 120,
            fit: BoxFit.cover,
            placeholder: (context, url) => Shimmer.fromColors(
              baseColor: secondaryColor,
              highlightColor: thirdtyColor,
              child: const ShimmerPerProfile(),
            ),
            errorWidget: (context, url, error) => Image.network(
              'https://icons.veryicon.com/png/o/business/new-vision-2/picture-loading-failed-1.png',
              width: 120,
              height: 120,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: defaultSpace / 2),
          Text(
            '$totalScore Scores',
            style: whiteTextStyle.copyWith(
              fontSize: 16,
              fontWeight: bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: defaultSpace / 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipOval(
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
              const SizedBox(width: defaultSpace / 2),
              Flexible(
                child: Text(
                  brandName,
                  style: whiteTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: extrabold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: defaultSpace / 2),
          SizedBox(
            width: 120, // set width to constrain text wrapping
            child: Text(
              productName,
              style: whiteTextStyle.copyWith(
                fontSize: 16,
                fontWeight: bold,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
