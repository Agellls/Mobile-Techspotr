import 'package:flutter/material.dart' hide MenuController;
import 'package:flutter_application_1/shared/theme.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/ui/pages/menu_page.dart';

class MenuWidget extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabChange;

  const MenuWidget({
    super.key,
    required this.selectedIndex,
    required this.onTabChange,
  });

  @override
  Widget build(BuildContext context) {
    // Use the MenuController from menu_page.dart
    final MenuController menuController = Get.find<MenuController>();

    return Container(
      padding: const EdgeInsets.all(defaultSpace / 2),
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Obx(() => GNav(
            rippleColor: primaryColor,
            hoverColor: compareColor,
            gap: 8,
            activeColor: whiteColor,
            iconSize: 24,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            duration: const Duration(milliseconds: 200),
            tabBackgroundColor: compareColor,
            color: thirdtyColor,
            selectedIndex: menuController.selectedIndex.value,
            onTabChange: (index) {
              menuController.updateSelectedIndex(index);
              onTabChange(index);
            },
            tabs: const [
              GButton(
                icon: LineIcons.home,
                text: 'Home',
              ),
              GButton(
                icon: LineIcons.copyright,
                text: 'Brand',
              ),
              GButton(
                icon: LineIcons.bloggerB,
                text: 'Search',
              ),
              GButton(
                icon: LineIcons.user,
                text: 'Profile',
              ),
            ],
          )),
    );
  }
}
