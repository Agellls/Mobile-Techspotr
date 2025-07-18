import 'package:flutter/material.dart';
import 'package:flutter_application_1/shared/theme.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../shared/app_svg.dart';

class TotalRating extends StatelessWidget {
  final Color mainColor;
  final List<Map<String, dynamic>> compareItems; // <-- change here
  const TotalRating({
    super.key,
    required this.mainColor,
    required this.compareItems,
  });

  @override
  Widget build(BuildContext context) {
    // Use the first item for summary info
    final summary = compareItems.isNotEmpty ? compareItems[0] : {};
    // If dynamic, pass attributes as a list in compareItems[0]['attributes']
    final attributes =
        compareItems.isNotEmpty && compareItems[0]['attributes'] != null
            ? compareItems[0]['attributes'] as List<dynamic>
            : [];

    // Fallback: If not using new dynamic structure, build attributes from compareName/compareValue keys
    List<Map<String, dynamic>> attrList = [];
    if (attributes.isNotEmpty) {
      attrList = attributes.cast<Map<String, dynamic>>();
    } else if (compareItems.isNotEmpty) {
      // Legacy fallback for static 5
      for (int i = 1; i <= 5; i++) {
        final name = summary['compareName$i'];
        final value = summary['compareValue$i'];
        if (name != null && value != null) {
          attrList.add({
            'name': name,
            'rating': double.tryParse(value) ?? 0.0,
            'icon': null, // fallback icon
          });
        }
      }
    }

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
                summary['rating'] ?? '0',
                style: blackTextStyle.copyWith(
                  fontSize: 35,
                  fontWeight: bold,
                ),
              ),
              const Spacer(),
              Text(
                '${summary['reviewCount'] ?? '0'} Reviews',
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: defaultSpace / 2),
          // Dynamic attribute rows
          ...attrList.map((attr) {
            // Use icon from API if available, else fallback to AppSvg by name
            Widget iconWidget;
            if (attr['icon'] != null &&
                attr['icon'].toString().contains('<svg')) {
              iconWidget = SvgPicture.string(
                attr['icon'],
                width: 20,
              );
            } else {
              // fallback: try to match name to AppSvg
              String name = (attr['name'] ?? '').toString().toLowerCase();
              String? svgString;
              if (name.contains('dimension')) {
                svgString = AppSvg.dimensions;
              } else if (name.contains('capacity')) {
                svgString = AppSvg.capacity;
              } else if (name.contains('refrigerator')) {
                svgString = AppSvg.refrigerator;
              } else if (name.contains('feature')) {
                svgString = AppSvg.features;
              } else if (name.contains('freezer')) {
                svgString = AppSvg.freezer;
              }
              if (svgString != null) {
                iconWidget = SvgPicture.string(svgString, width: 20);
              } else {
                iconWidget = Icon(Icons.star, size: 20, color: mainColor);
              }
            }
            return Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: Row(
                children: [
                  iconWidget,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const SizedBox(width: 10),
                            Text(
                              attr['name'] ?? 'Unknown Name',
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
                          percent: (attr['rating'] is num
                                  ? (attr['rating'] as num)
                                  : double.tryParse(
                                          attr['rating']?.toString() ?? '0') ??
                                      0.0) /
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
            );
          }).toList(),
          const SizedBox(height: defaultSpace / 2),
        ],
      ),
    );
  }
}
