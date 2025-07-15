import 'package:flutter/material.dart';
import 'package:flutter_application_1/shared/theme.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../shared/app_svg.dart';

class TotalRating extends StatelessWidget {
  final Color mainColor;
  final List<Map<String, String>> compareItems;
  const TotalRating({
    super.key,
    required this.mainColor,
    required this.compareItems,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: defaultSpace),
      decoration: BoxDecoration(
        color: whiteColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Icons.star,
                color: blackColor,
                size: 30,
              ),
              const SizedBox(width: defaultSpace / 2),
              Text(
                compareItems[0]['rating'] ?? '0',
                style: blackTextStyle.copyWith(
                  fontSize: 35,
                  fontWeight: bold,
                ),
              ),
              const Spacer(),
              Text(
                '${compareItems[0]['reviewCount'] ?? '0'} Reviews',
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: bold,
                ),
              ),
            ],
          ),
          Row(
            children: [
              SvgPicture.string(
                AppSvg.dimensions,
                width: 20,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const SizedBox(width: 10),
                        Text(
                          compareItems[0]['compareName1'] ?? 'Unknown Name',
                          style: blackTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: regular,
                          ),
                        ),
                      ],
                    ),
                    LinearPercentIndicator(
                      animation: true,
                      lineHeight: 5.0,
                      animationDuration: 1000,
                      percent: double.parse(
                              compareItems[0]['compareValue1'] ?? '0') /
                          5,
                      progressColor: mainColor,
                      backgroundColor: blackColor.withOpacity(0.2),
                      barRadius: const Radius.circular(100),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: defaultSpace),
          Row(
            children: [
              SvgPicture.string(
                AppSvg.capacity,
                width: 20,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const SizedBox(width: 10),
                        Text(
                          compareItems[0]['compareName2'] ?? 'Unknown Name',
                          style: blackTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: regular,
                          ),
                        ),
                      ],
                    ),
                    LinearPercentIndicator(
                      animation: true,
                      lineHeight: 5.0,
                      animationDuration: 1000,
                      percent: double.parse(
                              compareItems[0]['compareValue2'] ?? '0') /
                          5,
                      progressColor: mainColor,
                      backgroundColor: blackColor.withOpacity(0.2),
                      barRadius: const Radius.circular(100),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: defaultSpace),
          Row(
            children: [
              SvgPicture.string(
                AppSvg.refrigerator,
                width: 20,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const SizedBox(width: 10),
                        Text(
                          compareItems[0]['compareName3'] ?? 'Unknown Name',
                          style: blackTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: regular,
                          ),
                        ),
                      ],
                    ),
                    LinearPercentIndicator(
                      animation: true,
                      lineHeight: 5.0,
                      animationDuration: 1000,
                      percent: double.parse(
                              compareItems[0]['compareValue3'] ?? '0') /
                          5,
                      progressColor: mainColor,
                      backgroundColor: blackColor.withOpacity(0.2),
                      barRadius: const Radius.circular(100),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: defaultSpace),
          Row(
            children: [
              SvgPicture.string(
                AppSvg.features,
                width: 20,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const SizedBox(width: 10),
                        Text(
                          compareItems[0]['compareName4'] ?? 'Unknown Name',
                          style: blackTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: regular,
                          ),
                        ),
                      ],
                    ),
                    LinearPercentIndicator(
                      animation: true,
                      lineHeight: 5.0,
                      animationDuration: 1000,
                      percent: double.parse(
                              compareItems[0]['compareValue4'] ?? '0') /
                          5,
                      progressColor: mainColor,
                      backgroundColor: blackColor.withOpacity(0.2),
                      barRadius: const Radius.circular(100),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: defaultSpace),
          Row(
            children: [
              SvgPicture.string(
                AppSvg.freezer,
                width: 20,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const SizedBox(width: 10),
                        Text(
                          compareItems[0]['compareName5'] ?? 'Unknown Name',
                          style: blackTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: regular,
                          ),
                        ),
                      ],
                    ),
                    LinearPercentIndicator(
                      animation: true,
                      lineHeight: 5.0,
                      animationDuration: 1000,
                      percent: double.parse(
                              compareItems[0]['compareValue5'] ?? '0') /
                          5,
                      progressColor: mainColor,
                      backgroundColor: blackColor.withOpacity(0.2),
                      barRadius: const Radius.circular(100),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: defaultSpace / 2),
        ],
      ),
    );
  }
}
