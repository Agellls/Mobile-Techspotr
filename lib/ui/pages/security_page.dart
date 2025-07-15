import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../shared/theme.dart';
import '../widgets/custom_button.dart';
import '../widgets/input_form.dart';
import '../widgets/input_form_with_button_email.dart';
import '../widgets/input_form_with_button_username.dart';

class SecurityController extends GetxController {
  var isLoading = false.obs;
}

class SecurityPage extends StatelessWidget {
  SecurityPage({super.key});

  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final box = GetStorage();
  final SecurityController editAccountController =
      Get.put(SecurityController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Security',
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            InputFormWithButtonUsername(
              title: 'Username',
              subtitle: 'Only can change once',
              controller: usernameController,
              hintText: 'Fill your username',
              maxLines: 1,
              canVerify: 0,
            ),
            InputFormWithButtonEmail(
              title: 'Email',
              subtitle: 'email already verified',
              controller: emailController,
              hintText: 'Fill your email',
              maxLines: 1,
              canVerify: 0,
            ),
            const SizedBox(height: defaultSpace),
            CustomButton(
              ontap: () {
                Get.bottomSheet(
                  SafeArea(
                    child: Container(
                      padding: const EdgeInsets.all(
                        defaultSpace,
                      ),
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Change Password',
                                style: blackTextStyle.copyWith(
                                  fontSize: 22,
                                  fontWeight: bold,
                                ),
                              ),
                              GestureDetector(
                                onTap: () => Get.back(),
                                child: Icon(
                                  Icons.close,
                                  color: blackColor,
                                  size: 24,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'Ensure your new password is strong and unique to keep your account secure.',
                            style: blackTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: light,
                            ),
                          ),
                          const SizedBox(height: 5),
                          InputForm(
                            title: 'New Password',
                            controller: passwordController,
                            subtitle: '',
                            hintText: 'Your new password',
                            maxLines: 1,
                            obscureText: true,
                          ),
                          InputForm(
                            title: 'Confirm Password',
                            controller: confirmPasswordController,
                            subtitle: '',
                            hintText: 'Your confirm password',
                            maxLines: 1,
                            obscureText: true,
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              const Spacer(),
                              Obx(
                                () => editAccountController.isLoading.value
                                    ? Container(
                                        height: 40,
                                        width: 180,
                                        decoration: BoxDecoration(
                                          color: activeColor,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Center(
                                          child: SizedBox(
                                            height: 30,
                                            width: 30,
                                            child: CircularProgressIndicator(
                                              color: whiteColor,
                                              strokeWidth: 3,
                                            ),
                                          ),
                                        ),
                                      )
                                    : CustomButton(
                                        ontap: () async {
                                          Get.rawSnackbar(
                                            message:
                                                'Password and confirm password must be same',
                                            borderRadius: 10,
                                            duration:
                                                const Duration(seconds: 2),
                                            snackPosition: SnackPosition.BOTTOM,
                                            backgroundColor: Colors.red,
                                            margin: const EdgeInsets.only(
                                              bottom: 20,
                                              left: 20,
                                              right: 20,
                                            ),
                                          );
                                        },
                                        hintText: 'Save Password',
                                        height: 40,
                                        width: 180,
                                        borderRadius: 10,
                                      ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  isScrollControlled: true,
                );
              },
              hintText: 'Change Password',
              height: 40,
              width: 180,
              borderRadius: 10,
            ),
          ],
        ),
      ),
    );
  }
}
