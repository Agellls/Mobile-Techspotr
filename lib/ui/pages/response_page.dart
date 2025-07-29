import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/shared/theme.dart';
import 'package:flutter_application_1/ui/widgets/award_response_widget.dart';
import 'package:flutter_svg/svg.dart';

import '../../shared/app_svg.dart';

class ResponsePage extends StatelessWidget {
  const ResponsePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Response Page',
          style: blackTextStyle.copyWith(
            fontSize: 22,
            fontWeight: extrabold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.close,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        foregroundColor: blackColor,
        surfaceTintColor: Colors.transparent,
      ),
      body: Column(
        children: [
          AwardResponseWidget(
            mainColor: thirdtyColor,
          ),
          AwardResponseWidget(
            mainColor: thirdtyColor,
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 50,
        margin: const EdgeInsets.only(
            left: defaultSpace, right: defaultSpace, bottom: defaultSpace),
        decoration: BoxDecoration(
          color: compareColor,
          borderRadius: BorderRadius.circular(60),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Write your response',
              style: whiteTextStyle.copyWith(
                fontSize: 16,
                fontWeight: bold,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            SvgPicture.string(
              AppSvg.response,
              width: 20,
              height: 20,
              color: whiteColor,
            ),
          ],
        ),
      ),
    );
  }
}
