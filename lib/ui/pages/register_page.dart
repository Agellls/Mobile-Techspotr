import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../shared/app_svg.dart';
import '../../shared/theme.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_field.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryColor,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: primaryColor,
          body: Container(
            padding: const EdgeInsets.all(defaultSpace),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.string(
                  AppSvg.logoTechspotr,
                  width: 80,
                  height: 80,
                  color: thirdtyColor,
                ),
                const SizedBox(height: defaultSpace * 2),
                CustomField(
                  hintText: 'Your Full Name',
                  controller: fullnameController,
                  fillColor: secondaryColor,
                  maxLines: 1,
                ),
                const SizedBox(height: defaultSpace * 1.5),
                CustomField(
                  hintText: 'Your Username',
                  controller: usernameController,
                  fillColor: secondaryColor,
                  maxLines: 1,
                ),
                const SizedBox(height: defaultSpace * 1.5),
                CustomField(
                  hintText: 'Your Email Address',
                  controller: emailController,
                  fillColor: secondaryColor,
                  maxLines: 1,
                ),
                const SizedBox(height: defaultSpace * 1.5),
                CustomField(
                  hintText: 'Your Password',
                  controller: passwordController,
                  fillColor: secondaryColor,
                  maxLines: 1,
                  obscureText: true,
                ),
                const SizedBox(height: defaultSpace * 1.5),
                CustomField(
                  hintText: 'Your Confirm Password',
                  controller: confirmPasswordController,
                  fillColor: secondaryColor,
                  maxLines: 1,
                  obscureText: true,
                ),
                const SizedBox(height: defaultSpace * 1.5),
                CustomButton(
                  hintText: 'Sign Up',
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
                    text: 'Nevermind i do this later, ',
                    style: blackTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: regular,
                    ),
                    children: [
                      TextSpan(
                        text: 'Back to login',
                        style: blackTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: bold,
                          color: thirdtyColor,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Get.back();
                          },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: defaultSpace / 2),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
