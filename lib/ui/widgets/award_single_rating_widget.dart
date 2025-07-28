import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../shared/app_svg.dart';
import '../../shared/theme.dart';

class AwardSpecWidget extends StatelessWidget {
  final String title;
  final int type; // 1 or 2
  final String? score;
  final String? value;
  final String? unit;
  final double? percent;

  const AwardSpecWidget({
    super.key,
    required this.title,
    required this.type,
    this.score,
    this.value,
    this.unit,
    this.percent,
  });

  @override
  Widget build(BuildContext context) {
    if (type == 2) {
      return Column(
        children: [
          Text(
            title,
            style: whiteTextStyle.copyWith(
              fontSize: 16,
              fontWeight: bold,
              color: whiteColor.withOpacity(0.8),
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            '${score ?? ''} Score',
            style: whiteTextStyle.copyWith(
              fontSize: 18,
              fontWeight: extrabold,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            value ?? '',
            style: whiteTextStyle.copyWith(
              fontSize: 16,
              fontWeight: bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: defaultSpace * 2),
        ],
      );
    } else {
      // Type 1: Percent bar + Value + Unit
      return Column(
        children: [
          Text(
            title,
            style: whiteTextStyle.copyWith(
              fontSize: 16,
              fontWeight: bold,
              color: whiteColor.withOpacity(0.8),
            ),
            textAlign: TextAlign.center,
          ),
          LinearPercentIndicator(
            animation: true,
            lineHeight: 10,
            animationDuration: 1000,
            percent: percent ?? 0.8,
            progressColor: compareColor,
            backgroundColor: blackColor.withOpacity(0.2),
            barRadius: const Radius.circular(100),
          ),
          Text(
            value ?? '?',
            style: whiteTextStyle.copyWith(
              fontSize: 18,
              fontWeight: extrabold,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            unit ?? '',
            style: whiteTextStyle.copyWith(
              fontSize: 16,
              fontWeight: bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: defaultSpace * 2),
        ],
      );
    }
  }
}

class AwardSingleRatingWidget extends StatelessWidget {
  final num totalRating;
  final int totalReview;
  final String subtitle;
  final List<Map<String, dynamic>> specs;
  const AwardSingleRatingWidget({
    super.key,
    required this.totalRating,
    required this.totalReview,
    required this.subtitle,
    required this.specs,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: defaultSpace),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: compareColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  CupertinoIcons.smiley_fill,
                  color: whiteColor,
                  size: 30,
                ),
              ),
              const SizedBox(width: defaultSpace / 2),
              Text(
                totalRating.toDouble().toString(), // Always display as double
                style: whiteTextStyle.copyWith(
                  fontSize: 26,
                  fontWeight: bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: defaultSpace / 2),
          Text(
            '$totalReview REVIEWS',
            style: whiteTextStyle.copyWith(
                fontSize: 16,
                fontWeight: bold,
                color: whiteColor.withOpacity(0.8)),
          ),
          const SizedBox(height: defaultSpace * 2),
          SizedBox(
            height: 155,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.string(
                  AppSvg.petikAtas,
                  width: 25,
                  color: whiteColor.withOpacity(0.3),
                ),
                const SizedBox(height: defaultSpace / 2),
                Text(
                  subtitle,
                  style: whiteTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: extrabold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: defaultSpace / 2),
                SvgPicture.string(
                  AppSvg.petikBawah,
                  width: 25,
                  color: whiteColor.withOpacity(0.3),
                ),
              ],
            ),
          ),
          const SizedBox(height: defaultSpace),
          ...specs.expand((item) {
            var post = item['post'] ?? {};
            List specList = post['specs'] ?? [];
            return specList.map<Widget>((spec) {
              var detail = spec['detail'];
              // Clamp percent value between 0.0 and 1.0
              double percentValue = 0.8;
              if (detail != null && detail['score'] != null) {
                percentValue = (detail['score'] as num) / 100;
                if (percentValue < 0.0) percentValue = 0.0;
                if (percentValue > 1.0) percentValue = 1.0;
              }
              return AwardSpecWidget(
                title: spec['name'] ?? '',
                type: spec['type'] ?? 1,
                score: detail != null ? detail['score'].toString() : '?',
                value: detail != null ? detail['value'].toString() : 'N/A',
                unit: spec['unit'] ?? '',
                percent: percentValue,
              );
            });
          }),
          const SizedBox(height: defaultSpace / 2),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: defaultSpace,
              vertical: defaultSpace / 2,
            ),
            decoration: BoxDecoration(
              color: compareColor,
              borderRadius: BorderRadius.circular(60),
            ),
            child: Center(
              child: Text(
                'See More Specs',
                style: whiteTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
