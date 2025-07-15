import 'package:flutter/material.dart';
import 'package:flutter_application_1/shared/theme.dart';
import 'package:flutter_application_1/ui/widgets/form_with_lottie.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../shared/app_svg.dart';
import 'custom_button.dart';

class PopupForgot extends StatelessWidget {
  PopupForgot({super.key});

  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultSpace),
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              SvgPicture.string(
                AppSvg.logoTechspotr,
                width: 40,
                height: 40,
                color: thirdtyColor,
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Icon(
                  Icons.close,
                  color: blackColor,
                  size: 25,
                ),
              ),
            ],
          ),
          const SizedBox(height: defaultSpace * 2),
          const Text(
            'Forgot Password',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: defaultSpace),
          CustomFieldWithLogo(
            hintText: 'email',
            controller: emailController,
            maxLines: 1,
            fillColor: secondaryColor,
            lottieAsset: 'assets/user.json', // Custom Lottie for email field
          ),
          const SizedBox(height: defaultSpace),
          CustomButton(
            hintText: 'Send Reset Link',
            ontap: () {},
            height: 50,
            borderRadius: 10,
          ),
        ],
      ),
    );
  }
}
