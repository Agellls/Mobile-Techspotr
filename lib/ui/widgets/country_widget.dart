import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/profile_controller.dart';
import 'package:get/get.dart';
import '../../shared/theme.dart';

class CountryWidget extends StatelessWidget {
  final ProfileController controller;
  final Function(String) onCountrySelected;
  final double height;
  final String selectedCountry;

  const CountryWidget({
    super.key,
    required this.controller,
    required this.onCountrySelected,
    required this.selectedCountry,
    this.height = 48.0,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showCountryPicker(context),
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
                selectedCountry.isEmpty ? 'Select country' : selectedCountry,
                style: selectedCountry.isEmpty
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

  void _showCountryPicker(BuildContext context) {
    final searchController = TextEditingController();
    RxList<String> filteredCountries = RxList<String>();

    // Initialize filtered countries with all countries
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
                        onCountrySelected(country);
                        Get.back();
                      },
                      trailing: selectedCountry == country
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
