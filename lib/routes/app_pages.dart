import 'package:flutter_application_1/shared/theme.dart';
import 'package:flutter_application_1/ui/pages/award_page.dart';
import 'package:flutter_application_1/ui/pages/brand_detail_page.dart';
import 'package:flutter_application_1/ui/pages/compare_page.dart';
import 'package:flutter_application_1/ui/pages/default_page.dart';
import 'package:flutter_application_1/ui/pages/discuss_page.dart';
import 'package:flutter_application_1/ui/pages/guides_page.dart';
import 'package:flutter_application_1/ui/pages/home_page.dart';
import 'package:flutter_application_1/ui/pages/menu_page.dart';
import 'package:flutter_application_1/ui/pages/morecompare_page.dart';
import 'package:flutter_application_1/ui/pages/my_profile_page.dart';
import 'package:flutter_application_1/ui/pages/personal_page.dart';
import 'package:flutter_application_1/ui/pages/register_page.dart';
import 'package:flutter_application_1/ui/pages/review_page.dart';
import 'package:flutter_application_1/ui/pages/single_page.dart';
import 'package:flutter_application_1/ui/pages/write_discuss_page.dart';
import 'package:flutter_application_1/ui/pages/write_review_page.dart';
import 'package:get/get.dart';
import '../ui/pages/blog_page.dart';
import '../ui/pages/brand_page.dart';
import '../ui/pages/content_page.dart';
import '../ui/pages/discuss_reply_page.dart';
import '../ui/pages/security_page.dart';
import 'routes_name.dart';

class AppPages {
  static final pages = [
    GetPage(name: RouteName.defaults, page: () => DefaultPage()),
    GetPage(name: RouteName.menu, page: () => MenuPage()),
    GetPage(name: RouteName.home, page: () => HomePage()),
    GetPage(name: RouteName.brand, page: () => BrandPage()),
    GetPage(name: RouteName.blog, page: () => BlogPage()),
    GetPage(
      name: RouteName.single,
      page: () => SinglePage(),
      transition: Transition.leftToRight,
      showCupertinoParallax: false,
    ),
    GetPage(
      name: RouteName.compare,
      page: () => ComparePage(),
      transition: Transition.leftToRight,
      showCupertinoParallax: false,
    ),
    GetPage(
      name: RouteName.guides,
      page: () {
        // Get.arguments can be used to pass parameters
        final args = Get.arguments;
        final isCompare =
            (args is Map && args['isCompare'] == true) ? true : false;
        return GuidesPage(
          isCompare: isCompare,
        );
      },
      transition: Transition.downToUp,
      showCupertinoParallax: false,
    ),
    GetPage(
      name: RouteName.review,
      page: () {
        // Get.arguments can be used to pass parameters
        final args = Get.arguments;
        final isCompare =
            (args is Map && args['isCompare'] == true) ? true : false;
        return ReviewPage(isCompare: isCompare);
      },
      transition: Transition.downToUp,
      showCupertinoParallax: false,
    ),
    GetPage(
      name: RouteName.discuss,
      page: () {
        final args = Get.arguments;
        final isCompare =
            (args is Map && args['isCompare'] == true) ? true : false;
        return DiscussPage(isCompare: isCompare);
      },
      transition: Transition.downToUp,
      showCupertinoParallax: false,
    ),
    GetPage(
      name: RouteName.discussReply,
      page: () {
        final args = Get.arguments;
        final mainColor = (args is Map && args['mainColor'] != null)
            ? args['mainColor']
            : activeColor; // Use activeColor as default
        return DiscussReplyPage(mainColor: mainColor);
      },
      transition: Transition.rightToLeftWithFade,
      showCupertinoParallax: false,
    ),
    GetPage(
      name: RouteName.register,
      page: () => RegisterPage(),
      transition: Transition.downToUp,
      showCupertinoParallax: false,
    ),
    GetPage(
      name: RouteName.writeReview,
      page: () => WriteReviewPage(),
      transition: Transition.downToUp,
      showCupertinoParallax: false,
    ),
    GetPage(
      name: RouteName.writeDiscuss,
      page: () => WriteDiscussPage(),
      transition: Transition.downToUp,
      showCupertinoParallax: false,
    ),
    GetPage(
      name: RouteName.award,
      page: () {
        final args = Get.arguments;
        final isCompare =
            (args is Map && args['isCompare'] == true) ? true : false;
        return AwardPage(isCompare: isCompare);
      },
      transition: Transition.downToUp,
      showCupertinoParallax: false,
    ),
    GetPage(
      name: RouteName.moreCompare,
      page: () {
        final args = Get.arguments;
        final isCompare =
            (args is Map && args['isCompare'] == true) ? true : false;
        return MorecomparePage(isCompare: isCompare);
      },
      transition: Transition.downToUp,
      showCupertinoParallax: false,
    ),
    GetPage(
      name: RouteName.myProfile,
      page: () => MyProfile(),
      transition: Transition.downToUp,
      showCupertinoParallax: false,
    ),
    GetPage(
      name: RouteName.security,
      page: () => SecurityPage(),
      transition: Transition.downToUp,
      showCupertinoParallax: false,
    ),
    GetPage(
      name: RouteName.content,
      page: () => ContentPage(),
      transition: Transition.downToUp,
      showCupertinoParallax: false,
    ),
    GetPage(
      name: RouteName.personal,
      page: () => PersonalPage(),
      transition: Transition.downToUp,
      showCupertinoParallax: false,
    ),
    GetPage(
      name: RouteName.detailBrand,
      page: () => BrandDetailPage(),
      transition: Transition.downToUp,
      showCupertinoParallax: false,
    ),
  ];
}
