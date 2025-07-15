import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/pages/blog_page.dart';
import 'package:flutter_application_1/ui/pages/profile_page.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/ui/widgets/menu_widget.dart';
import 'package:flutter_application_1/ui/pages/home_page.dart';
import 'package:flutter_application_1/ui/pages/brand_page.dart';

import '../../controllers/profile_controller.dart';

class MenuController extends GetxController {
  var selectedIndex = 0.obs;

  void updateSelectedIndex(int index) {
    selectedIndex.value = index;
  }
}

class MenuPage extends StatelessWidget {
  MenuPage({super.key});

  final ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    final MenuController menuController =
        Get.put(MenuController(), permanent: true);

    return Scaffold(
      body: Obx(() => IndexedStack(
            index: menuController.selectedIndex.value,
            children: [
              HomePage(),
              BrandPage(),
              BlogPage(),
              ProfilePage(),
            ],
          )),
      bottomNavigationBar: Obx(() => MenuWidget(
            selectedIndex: menuController.selectedIndex.value,
            onTabChange: (index) {
              menuController.updateSelectedIndex(index);
            },
          )),
    );
  }
}
