import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/shared/theme.dart';

class AwardTextWidget extends StatelessWidget {
  const AwardTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: defaultSpace / 2),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Why We’re Into It',
            style: blackTextStyle.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            'Because… Obviously.',
            style: blackTextStyle.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w300,
            ),
          ),
          const SizedBox(height: defaultSpace / 2),
          Text(
            'No more last-minute ice runs! LG Smart InstaView Counter-Depth MAX French Door Refrigerator features dual ice makers located in the door and freezer. Can you imagine? This fridge pumps out 6 lbs of ice daily. That’s nonstop chill for every event.\n\nThe counter-depth feature allows for a seamless fit, standing flush with your countertop. Plus, the fingerprint-resistant finish keeps it looking sharp.  It stays elegant no matter how busy your kitchen gets.',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w300,
            ),
          ),
          const SizedBox(height: defaultSpace),
          Text(
            'The Yay & The Nay',
            style: blackTextStyle.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            'The Good, the Bad, the Meh!',
            style: blackTextStyle.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w300,
            ),
          ),
          const SizedBox(height: defaultSpace / 2),
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
                    ...buildBulletedList(
                      [
                        'Dual ice makers for extra convenience.',
                        'Produces up to 6 lbs of ice daily.',
                        'Counter-depth for a seamless fit.',
                        'Fingerprint-resistant finish.',
                        'Modern, elegant design.',
                      ],
                      isPositive: true,
                    ),
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
                    ...buildBulletedList(
                      [
                        'Counter-depth means slightly less storage than standard fridges.',
                        'No water dispenser on the outside.',
                        'Premium price point.',
                      ],
                      isPositive: false,
                    ),
                  ],
                ),
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
