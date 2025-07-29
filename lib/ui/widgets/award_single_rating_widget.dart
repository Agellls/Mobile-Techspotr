import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../shared/app_svg.dart';
import '../../shared/theme.dart';

class AwardSpecWidget extends StatelessWidget {
  final String title;
  final int type;
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
        crossAxisAlignment: CrossAxisAlignment.center, // <-- align left
        children: [
          Text(
            title,
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: bold,
              color: blackColor.withOpacity(0.8),
            ),
            textAlign: TextAlign.left, // <-- align left
          ),
          Text(
            '${score ?? ''} Score',
            style: blackTextStyle.copyWith(
              fontSize: 18,
              fontWeight: extrabold,
            ),
            textAlign: TextAlign.left, // <-- align left
          ),
          Text(
            value ?? '',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: bold,
            ),
            textAlign: TextAlign.left, // <-- align left
          ),
          const SizedBox(height: defaultSpace * 2),
        ],
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center, // <-- align left
        children: [
          Text(
            title,
            style: whiteTextStyle.copyWith(
              fontSize: 16,
              fontWeight: bold,
              color: blackColor.withOpacity(0.8),
            ),
            textAlign: TextAlign.left, // <-- align left
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
            style: blackTextStyle.copyWith(
              fontSize: 18,
              fontWeight: extrabold,
            ),
            textAlign: TextAlign.left, // <-- align left
          ),
          Text(
            unit ?? '',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: bold,
            ),
            textAlign: TextAlign.left, // <-- align left
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
      width: double.infinity, // <-- use full width for better spacing
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
                style: blackTextStyle.copyWith(
                  fontSize: 26,
                  fontWeight: bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: defaultSpace / 2),
          Text(
            '$totalReview REVIEWS',
            style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: bold,
                color: blackColor.withOpacity(0.8)),
          ),
          const SizedBox(height: defaultSpace),
          // Show specs in rows, 2 per row
          Builder(
            builder: (context) {
              List<Widget> specWidgets = [];
              List specsList = [];
              // Flatten all specs from all items
              for (var item in specs) {
                var post = item['post'] ?? {};
                specsList.addAll(post['specs'] ?? []);
              }
              for (int i = 0; i < specsList.length; i += 2) {
                specWidgets.add(
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: AwardSpecWidget(
                            title: specsList[i]['name'] ?? '',
                            type: specsList[i]['type'] ?? 1,
                            score: specsList[i]['detail'] != null
                                ? specsList[i]['detail']['score'].toString()
                                : '?',
                            value: specsList[i]['detail'] != null
                                ? specsList[i]['detail']['value'].toString()
                                : 'N/A',
                            unit: specsList[i]['unit'] ?? '',
                            percent: specsList[i]['detail'] != null &&
                                    specsList[i]['detail']['score'] != null
                                ? ((specsList[i]['detail']['score'] as num) /
                                        100)
                                    .clamp(0.0, 1.0)
                                : 0.8,
                          ),
                        ),
                      ),
                      if (i + 1 < specsList.length)
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: AwardSpecWidget(
                              title: specsList[i + 1]['name'] ?? '',
                              type: specsList[i + 1]['type'] ?? 1,
                              score: specsList[i + 1]['detail'] != null
                                  ? specsList[i + 1]['detail']['score']
                                      .toString()
                                  : '?',
                              value: specsList[i + 1]['detail'] != null
                                  ? specsList[i + 1]['detail']['value']
                                      .toString()
                                  : 'N/A',
                              unit: specsList[i + 1]['unit'] ?? '',
                              percent: specsList[i + 1]['detail'] != null &&
                                      specsList[i + 1]['detail']['score'] !=
                                          null
                                  ? ((specsList[i + 1]['detail']['score']
                                              as num) /
                                          100)
                                      .clamp(0.0, 1.0)
                                  : 0.8,
                            ),
                          ),
                        ),
                    ],
                  ),
                );
              }
              return Column(
                children: specWidgets,
              );
            },
          ),

          Container(
            margin: const EdgeInsets.symmetric(horizontal: defaultSpace * 3),
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
