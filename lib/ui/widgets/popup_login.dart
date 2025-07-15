import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/routes/routes_name.dart';
import 'package:flutter_application_1/shared/theme.dart';
import 'package:flutter_application_1/ui/widgets/form_with_lottie.dart';
import 'package:flutter_application_1/ui/widgets/popup_forgot.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../shared/app_svg.dart';
import 'custom_button.dart';

class PopupLogin extends StatelessWidget {
  PopupLogin({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
            'Login Required',
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
          CustomFieldWithLogo(
            hintText: 'password',
            controller: passwordController,
            obscureText: true,
            maxLines: 1,
            fillColor: secondaryColor,
            lottieAsset: 'assets/hint.json', // Custom Lottie for email field
          ),
          const SizedBox(height: defaultSpace),
          Row(
            children: [
              const Spacer(),
              RichText(
                text: TextSpan(
                  text: 'Forgot Password? ',
                  style: blackTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: regular,
                  ),
                  children: [
                    TextSpan(
                      text: 'Reset now',
                      style: blackTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: bold,
                        color: thirdtyColor,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.back();
                          Get.bottomSheet(
                            PopupForgot(),
                            isScrollControlled: true,
                            backgroundColor: whiteColor,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                          );
                        },
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: defaultSpace),
          CustomButton(
            hintText: 'Sign In',
            ontap: () {},
            height: 50,
            borderRadius: 10,
          ),
          const SizedBox(height: defaultSpace * 2),
          Row(
            children: [
              Expanded(
                child: Divider(
                  color: activeColor,
                  height: 20,
                  thickness: 1,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: activeColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  'Or Continue With',
                  style: whiteTextStyle.copyWith(
                    fontSize: 14,
                  ),
                ),
              ),
              Expanded(
                child: Divider(
                  color: activeColor,
                  height: 20,
                  thickness: 1,
                ),
              ),
            ],
          ),
          const SizedBox(height: defaultSpace * 2),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: secondaryColor,
                borderRadius: BorderRadius.circular(60),
                border: Border.all(
                  color: blackColor.withOpacity(0.2),
                  width: 0.5,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Google_%22G%22_logo.svg/1024px-Google_%22G%22_logo.svg.png',
                    width: 40,
                    height: 40,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'Sign in with Google',
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: defaultSpace * 2),
          RichText(
            text: TextSpan(
              text: 'Don\'t have an account? ',
              style: blackTextStyle.copyWith(
                fontSize: 14,
                fontWeight: regular,
              ),
              children: [
                TextSpan(
                  text: 'Sign Up here',
                  style: blackTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: bold,
                    color: thirdtyColor,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Get.toNamed(RouteName.register);
                    },
                ),
              ],
            ),
          ),
          const SizedBox(height: defaultSpace / 2),
        ],
      ),
    );
  }
}
