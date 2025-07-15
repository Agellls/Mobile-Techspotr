import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../controllers/profile_controller.dart';
import '../../routes/routes_name.dart';
import '../../shared/theme.dart';
import '../../utilities/loading.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final ProfileController controller = Get.put(ProfileController());

  // Add date picker function
  Future<void> _selectDate(BuildContext context) async {
    // Parse current date if available, otherwise use current date
    DateTime initialDate;
    try {
      if (controller.birthController.text.isNotEmpty) {
        // Try to parse the date in format yyyy-MM-dd
        List<String> parts = controller.birthController.text.split('-');
        if (parts.length == 3) {
          initialDate = DateTime(
            int.parse(parts[0]), // year
            int.parse(parts[1]), // month
            int.parse(parts[2]), // day
          );
        } else {
          initialDate = DateTime.now();
        }
      } else {
        initialDate = DateTime.now();
      }
    } catch (e) {
      initialDate = DateTime.now();
    }

    // Ensure initialDate is not after today
    if (initialDate.isAfter(DateTime.now())) {
      initialDate = DateTime.now();
    }

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: thirdtyColor,
            colorScheme: ColorScheme.light(primary: thirdtyColor),
            buttonTheme:
                const ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      // Format date as yyyy-MM-dd
      String formattedDate = picked.toIso8601String().split('T')[0];
      controller.birthController.text = formattedDate;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryColor,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: primaryColor,
          body: Padding(
            padding: const EdgeInsets.only(
                left: defaultSpace, right: defaultSpace, top: defaultSpace),
            child: SingleChildScrollView(
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: defaultSpace),
                    // ...existing code...
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: compareColor,
                                blurRadius: 15,
                                spreadRadius: 1,
                              ),
                            ],
                          ),
                          child: ClipOval(
                            child: Obx(
                              () => controller.profileImage.value != null
                                  ? Image.file(
                                      controller.profileImage.value!,
                                      width: 120,
                                      height: 120,
                                      fit: BoxFit.cover,
                                    )
                                  : CachedNetworkImage(
                                      imageUrl:
                                          controller.profileImageUrl.value,
                                      width: 120,
                                      height: 120,
                                      fit: BoxFit.cover,
                                      placeholder: (context, url) =>
                                          Shimmer.fromColors(
                                        baseColor: secondaryColor,
                                        highlightColor: thirdtyColor,
                                        child: const ShimmerPerProfile(),
                                      ),
                                      errorWidget: (context, url, error) =>
                                          Image.network(
                                        'https://icons.veryicon.com/png/o/business/new-vision-2/picture-loading-failed-1.png',
                                        width: 120,
                                        height: 120,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: GestureDetector(
                            onTap: controller.pickImageFromGallery,
                            child: Container(
                              decoration: BoxDecoration(
                                color: blackColor.withOpacity(0.6),
                                shape: BoxShape.circle,
                              ),
                              padding: const EdgeInsets.all(8),
                              child: const Icon(
                                Icons.camera_alt,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: defaultSpace),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: defaultSpace, vertical: defaultSpace / 2),
                      decoration: BoxDecoration(
                        color: compareColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.person,
                            color: whiteColor,
                            size: 20,
                          ),
                          const SizedBox(width: defaultSpace / 2),
                          Text(
                            'FOLLOW',
                            style: whiteTextStyle.copyWith(
                              fontSize: 14,
                              fontWeight: bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: defaultSpace / 2),
                    Obx(
                      () => Text(
                        controller.displayName.value.isEmpty
                            ? controller.nameController.text
                            : controller.displayName.value,
                        style: blackTextStyle.copyWith(
                          fontSize: 24,
                          fontWeight: extrabold,
                        ),
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Active since • ',
                            style: blackTextStyle.copyWith(
                                fontSize: 16, fontWeight: regular),
                          ),
                          TextSpan(
                            text: 'Jul, 2025',
                            style: blackTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: extrabold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: defaultSpace * 2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.person,
                                    color: thirdtyColor, size: 30),
                                const SizedBox(width: defaultSpace / 2),
                                Text(
                                  'Followers',
                                  style: blackTextStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: bold,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              '324',
                              style: blackTextStyle.copyWith(
                                fontSize: 20,
                                fontWeight: bold,
                                color: activeColor,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                Icon(Icons.person_add_alt_1_rounded,
                                    color: thirdtyColor, size: 30),
                                const SizedBox(width: defaultSpace / 2),
                                Text(
                                  'Following',
                                  style: blackTextStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: bold,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              '342',
                              style: blackTextStyle.copyWith(
                                fontSize: 20,
                                fontWeight: bold,
                                color: activeColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: defaultSpace * 2),
                    Row(
                      children: [
                        Text(
                          'General Information',
                          style: blackTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: bold,
                          ),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: controller.toggleEdit,
                          child: Obx(() => Row(
                                children: [
                                  Icon(
                                    controller.isEdit.value
                                        ? Icons.done
                                        : Icons.edit,
                                    color: controller.isEdit.value
                                        ? Colors.green
                                        : thirdtyColor,
                                    size: 18,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    controller.isEdit.value ? 'Done' : 'Edit',
                                    style: blackTextStyle.copyWith(
                                      fontSize: 16,
                                      fontWeight: semibold,
                                      color: controller.isEdit.value
                                          ? Colors.green
                                          : thirdtyColor,
                                    ),
                                  ),
                                ],
                              )),
                        ),
                      ],
                    ),
                    const SizedBox(height: defaultSpace / 2),
                    Container(
                      decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: defaultSpace,
                              vertical: defaultSpace / 2,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.supervised_user_circle_outlined,
                                        color: thirdtyColor),
                                    const SizedBox(width: 10),
                                    Text(
                                      'Fullname',
                                      style: blackTextStyle.copyWith(
                                        fontSize: 14,
                                        fontWeight: regular,
                                      ),
                                    ),
                                    const SizedBox(width: defaultSpace),
                                  ],
                                ),
                                Flexible(
                                  child: Obx(() => controller.isEdit.value
                                      ? SizedBox(
                                          width: 150,
                                          child: TextField(
                                            controller:
                                                controller.nameController,
                                            style: blackTextStyle.copyWith(
                                              fontSize: 14,
                                              fontWeight: extrabold,
                                            ),
                                            decoration: const InputDecoration(
                                              border: InputBorder.none,
                                              isDense: true,
                                              contentPadding: EdgeInsets.zero,
                                            ),
                                            textAlign: TextAlign.end,
                                          ),
                                        )
                                      : Text(
                                          controller.nameController.text,
                                          style: blackTextStyle.copyWith(
                                            fontSize: 14,
                                            fontWeight: extrabold,
                                          ),
                                          textAlign: TextAlign.end,
                                        )),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            color: primaryColor,
                            thickness: 2,
                            height: defaultSpace / 2,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: defaultSpace,
                              vertical: defaultSpace / 2,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.note_alt_outlined,
                                        color: thirdtyColor),
                                    const SizedBox(width: 10),
                                    Text(
                                      'Biography',
                                      style: blackTextStyle.copyWith(
                                        fontSize: 14,
                                        fontWeight: regular,
                                      ),
                                    ),
                                    const SizedBox(width: defaultSpace),
                                  ],
                                ),
                                Flexible(
                                  child: Obx(() => controller.isEdit.value
                                      ? SizedBox(
                                          width: 150,
                                          child: TextField(
                                            controller:
                                                controller.bioController,
                                            style: blackTextStyle.copyWith(
                                              fontSize: 14,
                                              fontWeight: extrabold,
                                            ),
                                            decoration: const InputDecoration(
                                              border: InputBorder.none,
                                              isDense: true,
                                              contentPadding: EdgeInsets.zero,
                                            ),
                                            textAlign: TextAlign.end,
                                          ),
                                        )
                                      : Text(
                                          controller.bioController.text,
                                          style: blackTextStyle.copyWith(
                                            fontSize: 14,
                                            fontWeight: extrabold,
                                          ),
                                          textAlign: TextAlign.end,
                                        )),
                                ),
                              ],
                            ),
                          ),
                          // ...existing code...
                          Divider(
                            color: primaryColor,
                            thickness: 2,
                            height: defaultSpace / 2,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: defaultSpace,
                              vertical: defaultSpace / 2,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.date_range_outlined,
                                        color: thirdtyColor),
                                    const SizedBox(width: 10),
                                    Text(
                                      'Birthdate',
                                      style: blackTextStyle.copyWith(
                                        fontSize: 14,
                                        fontWeight: regular,
                                      ),
                                    ),
                                    const SizedBox(width: defaultSpace),
                                  ],
                                ),
                                Flexible(
                                  child: Obx(
                                    () => controller.isEdit.value
                                        ? Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Flexible(
                                                child: Obx(
                                                  () => Text(
                                                    controller.birthDate.value
                                                            .isEmpty
                                                        ? 'dd/mm/yyyy'
                                                        : controller
                                                            .birthDate.value,
                                                    style:
                                                        blackTextStyle.copyWith(
                                                      fontSize: 14,
                                                      fontWeight: extrabold,
                                                    ),
                                                    textAlign: TextAlign.end,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 8),
                                              GestureDetector(
                                                onTap: () =>
                                                    _selectDate(context),
                                                child: Icon(
                                                  Icons
                                                      .arrow_drop_down_circle_outlined,
                                                  color: compareColor,
                                                  size: 18,
                                                ),
                                              ),
                                            ],
                                          )
                                        : Obx(
                                            () => Text(
                                              controller.birthDate.value.isEmpty
                                                  ? ''
                                                  : controller.birthDate.value,
                                              style: blackTextStyle.copyWith(
                                                fontSize: 14,
                                                fontWeight: extrabold,
                                              ),
                                              textAlign: TextAlign.end,
                                            ),
                                          ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            color: primaryColor,
                            thickness: 2,
                            height: defaultSpace / 2,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: defaultSpace,
                              vertical: defaultSpace / 2,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.language, color: thirdtyColor),
                                    const SizedBox(width: 10),
                                    Text(
                                      'Language',
                                      style: blackTextStyle.copyWith(
                                        fontSize: 14,
                                        fontWeight: regular,
                                      ),
                                    ),
                                  ],
                                ),
                                Flexible(
                                  child: Obx(
                                    () => controller.isEdit.value
                                        ? Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Flexible(
                                                child: GestureDetector(
                                                  onTap: () =>
                                                      _showLanguagePicker(
                                                          context),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Text(
                                                        controller
                                                            .selectedLanguage
                                                            .value,
                                                        style: blackTextStyle
                                                            .copyWith(
                                                          fontSize: 14,
                                                          fontWeight: extrabold,
                                                        ),
                                                      ),
                                                      const SizedBox(width: 8),
                                                      Icon(
                                                        Icons
                                                            .arrow_drop_down_circle_outlined,
                                                        color: compareColor,
                                                        size: 18,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        : Text(
                                            controller.selectedLanguage.value,
                                            style: blackTextStyle.copyWith(
                                              fontSize: 14,
                                              fontWeight: extrabold,
                                            ),
                                            textAlign: TextAlign.end,
                                          ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            color: primaryColor,
                            thickness: 2,
                            height: defaultSpace / 2,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: defaultSpace,
                              vertical: defaultSpace / 2,
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.flag_outlined, color: thirdtyColor),
                                const SizedBox(width: 10),
                                Text(
                                  'Country',
                                  style: blackTextStyle.copyWith(
                                    fontSize: 14,
                                    fontWeight: regular,
                                  ),
                                ),
                                const Spacer(),
                                Obx(() => controller.isEdit.value
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          GestureDetector(
                                            onTap: () =>
                                                _showCountryPicker(context),
                                            child: Row(
                                              children: [
                                                Text(
                                                  controller
                                                      .selectedCountry.value,
                                                  style:
                                                      blackTextStyle.copyWith(
                                                    fontSize: 14,
                                                    fontWeight: extrabold,
                                                  ),
                                                ),
                                                const SizedBox(width: 8),
                                                Icon(
                                                  Icons
                                                      .arrow_drop_down_circle_outlined,
                                                  color: compareColor,
                                                  size: 18,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      )
                                    : Text(
                                        controller.selectedCountry.value,
                                        style: blackTextStyle.copyWith(
                                          fontSize: 14,
                                          fontWeight: extrabold,
                                        ),
                                      )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    // ...existing code...
                    const SizedBox(height: defaultSpace * 2),
                    Row(
                      children: [
                        Text(
                          'Utilities',
                          style: blackTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: bold,
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                    const SizedBox(height: defaultSpace / 2),
                    Container(
                      decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () => Get.toNamed(RouteName.myProfile),
                            child: Container(
                              color: secondaryColor,
                              padding: const EdgeInsets.symmetric(
                                horizontal: defaultSpace,
                                vertical: defaultSpace / 2,
                              ),
                              child: Row(
                                children: [
                                  Icon(Icons.newspaper, color: thirdtyColor),
                                  const SizedBox(width: 10),
                                  Text(
                                    'Profile',
                                    style: blackTextStyle.copyWith(
                                      fontSize: 14,
                                      fontWeight: regular,
                                    ),
                                  ),
                                  const Spacer(),
                                  Icon(Icons.arrow_right, color: thirdtyColor),
                                ],
                              ),
                            ),
                          ),
                          Divider(
                            color: primaryColor,
                            thickness: 2,
                            height: defaultSpace / 2,
                          ),
                          GestureDetector(
                            onTap: () => Get.toNamed(RouteName.security),
                            child: Container(
                              color: secondaryColor,
                              padding: const EdgeInsets.symmetric(
                                horizontal: defaultSpace,
                                vertical: defaultSpace / 2,
                              ),
                              child: Row(
                                children: [
                                  Icon(Icons.lock_outline_rounded,
                                      color: thirdtyColor),
                                  const SizedBox(width: 10),
                                  Text(
                                    'Security',
                                    style: blackTextStyle.copyWith(
                                      fontSize: 14,
                                      fontWeight: regular,
                                    ),
                                  ),
                                  const Spacer(),
                                  Icon(Icons.arrow_right, color: thirdtyColor),
                                ],
                              ),
                            ),
                          ),
                          Divider(
                            color: primaryColor,
                            thickness: 2,
                            height: defaultSpace / 2,
                          ),
                          GestureDetector(
                            onTap: () => Get.toNamed(RouteName.content),
                            child: Container(
                              color: secondaryColor,
                              padding: const EdgeInsets.symmetric(
                                horizontal: defaultSpace,
                                vertical: defaultSpace / 2,
                              ),
                              child: Row(
                                children: [
                                  Icon(LineIcons.blogger, color: thirdtyColor),
                                  const SizedBox(width: 10),
                                  Text(
                                    'Content',
                                    style: blackTextStyle.copyWith(
                                      fontSize: 14,
                                      fontWeight: regular,
                                    ),
                                  ),
                                  const Spacer(),
                                  Icon(Icons.arrow_right, color: thirdtyColor),
                                ],
                              ),
                            ),
                          ),
                          Divider(
                            color: primaryColor,
                            thickness: 2,
                            height: defaultSpace / 2,
                          ),
                          GestureDetector(
                            onTap: () => Get.toNamed(RouteName.personal),
                            child: Container(
                              color: secondaryColor,
                              padding: const EdgeInsets.symmetric(
                                horizontal: defaultSpace,
                                vertical: defaultSpace / 2,
                              ),
                              child: Row(
                                children: [
                                  Icon(Icons.person_outlined,
                                      color: thirdtyColor),
                                  const SizedBox(width: 10),
                                  Text(
                                    'Personal',
                                    style: blackTextStyle.copyWith(
                                      fontSize: 14,
                                      fontWeight: regular,
                                    ),
                                  ),
                                  const Spacer(),
                                  Icon(Icons.arrow_right, color: thirdtyColor),
                                ],
                              ),
                            ),
                          ),
                          Divider(
                            color: primaryColor,
                            thickness: 2,
                            height: defaultSpace / 2,
                          ),
                          GestureDetector(
                            onTap: () =>
                                // ignore: deprecated_member_use
                                launch('https://www.techspotr.com/privacy'),
                            child: Container(
                              color: secondaryColor,
                              padding: const EdgeInsets.symmetric(
                                horizontal: defaultSpace,
                                vertical: defaultSpace / 2,
                              ),
                              child: Row(
                                children: [
                                  Icon(Icons.privacy_tip_outlined,
                                      color: thirdtyColor),
                                  const SizedBox(width: 10),
                                  Text(
                                    'Privacy & Policy',
                                    style: blackTextStyle.copyWith(
                                      fontSize: 14,
                                      fontWeight: regular,
                                    ),
                                  ),
                                  const Spacer(),
                                  Icon(Icons.arrow_right, color: thirdtyColor),
                                ],
                              ),
                            ),
                          ),
                          Divider(
                            color: primaryColor,
                            thickness: 2,
                            height: defaultSpace / 2,
                          ),
                          GestureDetector(
                            onTap: () => Get.toNamed(RouteName.personal),
                            child: Container(
                              color: secondaryColor,
                              padding: const EdgeInsets.symmetric(
                                horizontal: defaultSpace,
                                vertical: defaultSpace / 2,
                              ),
                              child: Row(
                                children: [
                                  Icon(Icons.logout_rounded,
                                      color: thirdtyColor),
                                  const SizedBox(width: 10),
                                  Text(
                                    'Logout',
                                    style: blackTextStyle.copyWith(
                                      fontSize: 14,
                                      fontWeight: regular,
                                    ),
                                  ),
                                  const Spacer(),
                                  Icon(Icons.arrow_right, color: thirdtyColor),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: defaultSpace),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Add this method inside the ProfilePage class
  void _showLanguagePicker(BuildContext context) {
    final searchController = TextEditingController();
    RxList<String> filteredLanguages = RxList<String>();

    // Initialize filtered languages with all languages from controller
    filteredLanguages.value = [...controller.languages];

    // Function to filter languages based on search query
    void filterLanguages(String query) {
      if (query.isEmpty) {
        filteredLanguages.value = [...controller.languages];
      } else {
        filteredLanguages.value = controller.languages
            .where((language) =>
                language.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    }

    Get.bottomSheet(
      Container(
        height: Get.height * 0.5,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 8),
            // Header
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              height: 4,
              width: 40,
              decoration: BoxDecoration(
                color: thirdtyColor,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 16),
            // Search box
            Container(
              decoration: BoxDecoration(
                color: secondaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: searchController,
                style: blackTextStyle,
                decoration: InputDecoration(
                  hintText: 'Search language',
                  hintStyle: blackTextStyle.copyWith(
                    color: thirdtyColor.withOpacity(0.3),
                  ),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  prefixIcon: Icon(Icons.search, color: thirdtyColor),
                ),
                onChanged: filterLanguages,
              ),
            ),
            const SizedBox(height: 16),
            // Language list
            Expanded(
              child: Obx(() {
                if (filteredLanguages.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search_off,
                          size: 64,
                          color: thirdtyColor,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'No languages found',
                          style: blackTextStyle.copyWith(
                            color: thirdtyColor,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  );
                }

                return ListView.builder(
                  itemCount: filteredLanguages.length,
                  itemBuilder: (context, index) {
                    final language = filteredLanguages[index];
                    return ListTile(
                      title: Text(
                        language,
                        style: blackTextStyle.copyWith(fontSize: 16),
                      ),
                      onTap: () {
                        controller.selectedLanguage.value = language;
                        Get.back();
                      },
                      trailing: controller.selectedLanguage.value == language
                          ? Icon(
                              Icons.check_circle,
                              color: activeColor,
                            )
                          : null,
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
      isScrollControlled: true,
      enableDrag: true,
    );
  }

  // Add this method for country picker
  void _showCountryPicker(BuildContext context) {
    final searchController = TextEditingController();
    RxList<String> filteredCountries = RxList<String>();

    // Initialize filtered countries with all countries from controller
    filteredCountries.value = [...controller.countries];

    // Function to filter countries based on search query
    void filterCountries(String query) {
      if (query.isEmpty) {
        filteredCountries.value = [...controller.countries];
      } else {
        filteredCountries.value = controller.countries
            .where((country) =>
                country.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    }

    Get.bottomSheet(
      Container(
        height: Get.height * 0.5,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 8),
            // Header
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              height: 4,
              width: 40,
              decoration: BoxDecoration(
                color: thirdtyColor,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 16),
            // Search box
            Container(
              decoration: BoxDecoration(
                color: secondaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: searchController,
                style: blackTextStyle,
                decoration: InputDecoration(
                  hintText: 'Search country',
                  hintStyle: blackTextStyle.copyWith(
                    color: thirdtyColor.withOpacity(0.3),
                  ),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  prefixIcon: Icon(Icons.search, color: thirdtyColor),
                ),
                onChanged: filterCountries,
              ),
            ),
            const SizedBox(height: 16),
            // Country list
            Expanded(
              child: Obx(() {
                if (filteredCountries.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search_off,
                          size: 64,
                          color: thirdtyColor,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'No countries found',
                          style: blackTextStyle.copyWith(
                            color: thirdtyColor,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  );
                }

                return ListView.builder(
                  itemCount: filteredCountries.length,
                  itemBuilder: (context, index) {
                    final country = filteredCountries[index];
                    return ListTile(
                      title: Text(
                        country,
                        style: blackTextStyle.copyWith(fontSize: 16),
                      ),
                      onTap: () {
                        controller.selectedCountry.value = country;
                        Get.back();
                      },
                      trailing: controller.selectedCountry.value == country
                          ? Icon(
                              Icons.check_circle,
                              color: activeColor,
                            )
                          : null,
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
      isScrollControlled: true,
      enableDrag: true,
    );
  }
}
