import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/shared/theme.dart';
import 'package:flutter_html/flutter_html.dart';

class AwardTextWidget extends StatelessWidget {
  final String content;
  final List<String> pros;
  final List<String> cons;
  const AwardTextWidget({
    super.key,
    required this.content,
    required this.pros,
    required this.cons,
  });

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
          Html(
            data: content,
            style: {
              "p.gabarito": Style(
                textAlign: TextAlign.center,
                fontWeight: FontWeight.w300,
                fontSize: FontSize(18),
              ),
            },
          ),
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
                    ...buildBulletedList(pros, isPositive: true),
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
                    ...buildBulletedList(cons, isPositive: false),
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
