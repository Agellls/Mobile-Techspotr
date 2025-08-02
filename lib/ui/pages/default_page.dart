import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/shared/theme.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/controllers/theme_controller.dart';
import 'package:flutter_application_1/routes/routes_name.dart';
import 'package:get_storage/get_storage.dart';

import '../../shared/app_svg.dart';

class DefaultPage extends StatelessWidget {
  DefaultPage({super.key});

  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.put(ThemeController());

    return Scaffold(
      backgroundColor: primaryColor,
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 100),
              Container(
                padding: const EdgeInsets.all(30),
                decoration: const BoxDecoration(
                  color: Color(0xff00310b),
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.string(
                  AppSvg.compare,
                  width: 100,
                  color: const Color(0xff00ff37),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Compare Anything',
                style: blackTextStyle.copyWith(
                  fontSize: 24,
                  fontWeight: extrabold,
                ),
              ),
              const SizedBox(height: 100),
              Text(
                'Choose Your Option',
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: regular,
                  color: blackColor.withOpacity(0.5),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      themeController.setTheme('techspotr');
                      box.write('LogoImage', AppSvg.logoTechspotr);
                      box.write('NameBrand', 'Techspotr');
                      Get.toNamed(RouteName.menu);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: const Color(0xff0284c7),
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                offset: const Offset(0, 2),
                                blurRadius: 3,
                                spreadRadius: 0.5,
                              ),
                            ],
                          ),
                          child: Center(
                            child: SvgPicture.string(
                              AppSvg.logoTechspotr,
                              width: 60,
                              color: whiteColor.withOpacity(0.8),
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Techspotr',
                          style: blackTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: extrabold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      themeController.setTheme('gadgetspotr');
                      box.write('LogoImage', AppSvg.logoGadgetspotr);
                      box.write('NameBrand', 'Gadgetspotr');
                      Get.toNamed(RouteName.menu);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: const Color(0xff0367fc),
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                offset: const Offset(0, 2),
                                blurRadius: 3,
                                spreadRadius: 0.5,
                              ),
                            ],
                          ),
                          child: Center(
                            child: SvgPicture.string(
                              AppSvg.logoGadgetspotr,
                              width: 60,
                              color: whiteColor.withOpacity(0.8),
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Gadgetspotr',
                          style: blackTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: extrabold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      themeController.setTheme('stylehuntr');
                      box.write('LogoImage', AppSvg.logoStylehuntr);
                      box.write('NameBrand', 'Stylehuntr');
                      Get.toNamed(RouteName.menu);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: const Color(0xffa23bd6),
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                offset: const Offset(0, 2),
                                blurRadius: 3,
                                spreadRadius: 0.5,
                              ),
                            ],
                          ),
                          child: Center(
                            child: SvgPicture.string(
                              AppSvg.logoStylehuntr,
                              width: 60,
                              color: whiteColor.withOpacity(0.8),
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Stylehuntr',
                          style: blackTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: extrabold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      themeController.setTheme('autologr');
                      box.write('LogoImage', AppSvg.logoAutologr);
                      box.write('NameBrand', 'Autologr');
                      Get.toNamed(RouteName.menu);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: const Color(0xffe51c1c),
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                offset: const Offset(0, 2),
                                blurRadius: 3,
                                spreadRadius: 0.5,
                              ),
                            ],
                          ),
                          child: Center(
                            child: SvgPicture.string(
                              AppSvg.logoAutologr,
                              width: 60,
                              color: whiteColor.withOpacity(0.8),
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Autologr',
                          style: blackTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: extrabold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      themeController.setTheme('petspotr');
                      box.write('LogoImage', AppSvg.logoPetspotr);
                      box.write('NameBrand', 'Petspotr');
                      Get.toNamed(RouteName.menu);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: const Color(0xffbc9e89),
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                offset: const Offset(0, 2),
                                blurRadius: 3,
                                spreadRadius: 0.5,
                              ),
                            ],
                          ),
                          child: Center(
                            child: SvgPicture.string(
                              AppSvg.logoPetspotr,
                              width: 60,
                              color: whiteColor.withOpacity(0.8),
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Petspotr',
                          style: blackTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: extrabold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      themeController.setTheme('apprankr');
                      box.write('LogoImage', AppSvg.logoApprankr);
                      box.write('NameBrand', 'Apprankr');
                      Get.toNamed(RouteName.menu);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: const Color(0xff7523bc),
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                offset: const Offset(0, 2),
                                blurRadius: 3,
                                spreadRadius: 0.5,
                              ),
                            ],
                          ),
                          child: Center(
                            child: SvgPicture.string(
                              AppSvg.logoApprankr,
                              width: 60,
                              color: whiteColor.withOpacity(0.8),
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Apprankr',
                          style: blackTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: extrabold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      themeController.setTheme('hubpickr');
                      box.write('LogoImage', AppSvg.logoHubpickr);
                      box.write('NameBrand', 'Hubpickr');
                      Get.toNamed(RouteName.menu);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: const Color(0xff00d9a5),
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                offset: const Offset(0, 2),
                                blurRadius: 3,
                                spreadRadius: 0.5,
                              ),
                            ],
                          ),
                          child: Center(
                            child: SvgPicture.string(
                              AppSvg.logoHubpickr,
                              width: 60,
                              color: whiteColor.withOpacity(0.8),
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Hubpickr',
                          style: blackTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: extrabold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      themeController.setTheme('parentspotr');
                      box.write('LogoImage', AppSvg.logoParentspotr);
                      box.write('NameBrand', 'Parentspotr');
                      Get.toNamed(RouteName.menu);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: const Color(0xff55a0c3),
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                offset: const Offset(0, 2),
                                blurRadius: 3,
                                spreadRadius: 0.5,
                              ),
                            ],
                          ),
                          child: Center(
                            child: SvgPicture.string(
                              AppSvg.logoParentspotr,
                              width: 60,
                              color: whiteColor.withOpacity(0.8),
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Parentspotr',
                          style: blackTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: extrabold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      themeController.setTheme('sleepdeepr');
                      box.write('LogoImage', AppSvg.logoSleepdeepr);
                      box.write('NameBrand', 'Sleepdeepr');
                      Get.toNamed(RouteName.menu);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: const Color(0xff8254b0),
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                offset: const Offset(0, 2),
                                blurRadius: 3,
                                spreadRadius: 0.5,
                              ),
                            ],
                          ),
                          child: Center(
                            child: SvgPicture.string(
                              AppSvg.logoSleepdeepr,
                              width: 60,
                              color: whiteColor.withOpacity(0.8),
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Sleepdeepr',
                          style: blackTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: extrabold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      themeController.setTheme('soundfindr');
                      box.write('LogoImage', AppSvg.logoSoundfindr);
                      box.write('NameBrand', 'Soundfindr');
                      Get.toNamed(RouteName.menu);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: const Color(0xffd81c98),
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                offset: const Offset(0, 2),
                                blurRadius: 3,
                                spreadRadius: 0.5,
                              ),
                            ],
                          ),
                          child: Center(
                            child: SvgPicture.string(
                              AppSvg.logoSoundfindr,
                              width: 60,
                              color: whiteColor.withOpacity(0.8),
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Soundfindr',
                          style: blackTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: extrabold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      themeController.setTheme('yardpickr');
                      box.write('LogoImage', AppSvg.logoYardpickr);
                      box.write('NameBrand', 'Yardpickr');
                      Get.toNamed(RouteName.menu);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: const Color(0xffb89f5c),
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                offset: const Offset(0, 2),
                                blurRadius: 3,
                                spreadRadius: 0.5,
                              ),
                            ],
                          ),
                          child: Center(
                            child: SvgPicture.string(
                              AppSvg.logoYardpickr,
                              width: 60,
                              color: whiteColor.withOpacity(0.8),
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Yardpickr',
                          style: blackTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: extrabold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      themeController.setTheme('undefined');
                      box.write('LogoImage', AppSvg.undefinedProduct);
                      box.write('NameBrand', 'Undefined');
                      Get.toNamed(RouteName.menu);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: const Color(0xff282a36),
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                offset: const Offset(0, 2),
                                blurRadius: 3,
                                spreadRadius: 0.5,
                              ),
                            ],
                          ),
                          child: Center(
                            child: SvgPicture.string(
                              AppSvg.undefinedProduct,
                              width: 60,
                              color: whiteColor.withOpacity(0.8),
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Undefined',
                          style: blackTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: extrabold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
