import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/profile_controller.dart';
import '../../shared/theme.dart';

class LanguageWidget extends StatelessWidget {
  final ProfileController controller;
  final Function(String) onLanguageSelected;
  final double height;
  final String selectedLanguage;

  const LanguageWidget({
    super.key,
    required this.controller,
    required this.onLanguageSelected,
    required this.selectedLanguage,
    this.height = 48.0,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showLanguagePicker(context),
      child: Container(
        height: height,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                selectedLanguage.isEmpty ? 'Select language' : selectedLanguage,
                style: selectedLanguage.isEmpty
                    ? blackTextStyle.copyWith(
                        color: thirdtyColor.withOpacity(0.3),
                        fontSize: 16,
                      )
                    : blackTextStyle.copyWith(
                        fontSize: 16,
                      ),
              ),
            ),
            Icon(
              Icons.arrow_drop_down,
              color: activeColor,
            ),
          ],
        ),
      ),
    );
  }

  void _showLanguagePicker(BuildContext context) {
    final searchController = TextEditingController();
    RxList<String> filteredLanguages = RxList<String>();

    // Initialize filtered languages with all languages
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
                        onLanguageSelected(language);
                        Get.back();
                      },
                      trailing: selectedLanguage == language
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
