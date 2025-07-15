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
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Expanded(child: SizedBox()),
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
            const SizedBox(height: 200),
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
                            color: whiteColor.withOpacity(0.5),
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
                          color: const Color(0xff2563eb),
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
                            color: whiteColor.withOpacity(0.5),
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
                    themeController.setTheme('stylehunter');
                    box.write('LogoImage', AppSvg.logoStylehunter);
                    box.write('NameBrand', 'Stylehunter');
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
                          color: const Color(0xffc026d3),
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
                            AppSvg.logoStylehunter,
                            width: 60,
                            color: whiteColor.withOpacity(0.5),
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Stylehunter',
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
                          color: const Color(0xffdc2626),
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
                            color: whiteColor.withOpacity(0.5),
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
                          color: const Color(0xffffd900),
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
                            color: whiteColor.withOpacity(0.5),
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
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: const Color(0xff2b2b2b),
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
                        child: Icon(
                          Icons.warning_amber_rounded,
                          color: whiteColor.withOpacity(0.5),
                          size: 60,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Soon',
                      style: blackTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: extrabold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
