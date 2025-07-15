import 'package:flutter/material.dart';
import 'package:flutter_application_1/shared/theme.dart';
import 'package:flutter_application_1/ui/widgets/custom_field.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class InputFormWithButtonUsernameController extends GetxController {
  var isLoading = false.obs;
}

class InputFormWithButtonUsername extends StatelessWidget {
  final String title;
  final String subtitle;
  final TextEditingController controller;
  final String hintText;
  final int maxLines;
  final int canVerify;
  final String?
      initialCountryCode; // New parameter for passing the country code

  InputFormWithButtonUsername({
    super.key,
    required this.title,
    required this.subtitle,
    required this.controller,
    required this.hintText,
    required this.maxLines,
    required this.canVerify,
    this.initialCountryCode, // Optional parameter
  });

  final box = GetStorage();
  final InputFormWithButtonUsernameController inputFormController =
      Get.put(InputFormWithButtonUsernameController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: blackTextStyle.copyWith(
                fontSize: 18,
                fontWeight: bold,
              ),
            ),
            canVerify == 0
                ? GestureDetector(
                    onTap: () {
                      Get.rawSnackbar(
                        message: 'Please fill a new username',
                        borderRadius: 10,
                        duration: const Duration(seconds: 2),
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: activeColor,
                        margin: const EdgeInsets.only(
                            bottom: 20, left: 20, right: 20),
                      );
                    },
                    child: Obx(
                      () => inputFormController.isLoading.value
                          ? SizedBox(
                              height: 29,
                              width: 29,
                              child: Center(
                                child: CircularProgressIndicator(
                                  color: activeColor,
                                  strokeWidth: 3,
                                ),
                              ),
                            )
                          : Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 3,
                                horizontal: 8,
                              ),
                              decoration: BoxDecoration(
                                color: compareColor,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text(
                                'change username',
                                style: whiteTextStyle.copyWith(
                                  fontSize: 16,
                                  fontWeight: bold,
                                ),
                              ),
                            ),
                    ),
                  )
                : Text(
                    subtitle,
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: regular,
                    ),
                  ),
          ],
        ),
        const SizedBox(height: defaultSpace / 2),
        Theme(
          data: ThemeData(
            textSelectionTheme: TextSelectionThemeData(
              cursorColor: blackColor,
              selectionColor: blackColor,
              selectionHandleColor: blackColor,
            ),
          ),
          child: CustomField(
            controller: controller,
            hintText: hintText,
            maxLines: maxLines,
            fillColor: secondaryColor,
            isHavePickedImage: false,
            cantype: canVerify == 0 ? true : false,
          ),
        ),
        const SizedBox(height: defaultSpace / 2),
      ],
    );
  }
}
