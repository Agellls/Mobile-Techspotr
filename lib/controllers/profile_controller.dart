import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  final RxBool isEdit = false.obs;
  final Rx<File?> profileImage = Rx<File?>(null);
  final RxString profileImageUrl =
      'https://i.etsystatic.com/31548528/r/il/ffde13/5804742914/il_794xN.5804742914_ap2d.jpg'
          .obs;
  final RxString displayName = ''.obs;
  final RxString birthDate = ''.obs;
  final RxString selectedLanguage = 'Indonesian'.obs;
  final RxString selectedCountry = 'Indonesia'.obs;

  final List<String> languages = [
    "English",
    "Spanish",
    "French",
    "German",
    "Italian",
    "Portuguese",
    "Russian",
    "Chinese",
    "Japanese",
    "Korean",
    "Arabic",
    "Hindi",
    "Bengali",
    "Malay",
    "Vietnamese",
    "Thai",
    "Indonesian",
    "Dutch",
    "Swedish",
    "Norwegian",
    "Finnish",
    "Danish",
    "Polish",
    "Turkish",
    "Greek",
    "Hebrew",
    "Czech",
    "Hungarian",
    "Romanian",
    "Ukrainian"
  ];

  final List<String> countries = [
    "Afghanistan",
    "Albania",
    "Algeria",
    "Argentina",
    "Australia",
    "Austria",
    "Bangladesh",
    "Belgium",
    "Brazil",
    "Bulgaria",
    "Canada",
    "Chile",
    "China",
    "Colombia",
    "Croatia",
    "Czech Republic",
    "Denmark",
    "Egypt",
    "Finland",
    "France",
    "Germany",
    "Greece",
    "Hungary",
    "India",
    "Indonesia",
    "Iran",
    "Iraq",
    "Ireland",
    "Israel",
    "Italy",
    "Japan",
    "Jordan",
    "Kazakhstan",
    "Kenya",
    "Kuwait",
    "Lebanon",
    "Malaysia",
    "Mexico",
    "Morocco",
    "Netherlands",
    "New Zealand",
    "Nigeria",
    "Norway",
    "Pakistan",
    "Philippines",
    "Poland",
    "Portugal",
    "Qatar",
    "Romania",
    "Russia",
    "Saudi Arabia",
    "Singapore",
    "South Africa",
    "South Korea",
    "Spain",
    "Sri Lanka",
    "Sweden",
    "Switzerland",
    "Thailand",
    "Turkey",
    "Ukraine",
    "United Arab Emirates",
    "United Kingdom",
    "United States",
    "Vietnam"
  ];

  final TextEditingController nameController =
      TextEditingController(text: 'John Doe');
  final TextEditingController bioController = TextEditingController(
      text:
          "life is simple, you make choices and don't look back"); // In your ProfileController class:
  final TextEditingController birthController = TextEditingController();

  final ImagePicker _picker = ImagePicker();

  @override
  void onInit() {
    super.onInit();
    // Add listener to birthController to update reactive variable
    birthController.addListener(() {
      birthDate.value = birthController.text;
    });
  }

  void toggleEdit() async {
    if (isEdit.value) {
      displayName.value = nameController.text;
      // Save changes
      await updateProfile();
    }
    isEdit.value = !isEdit.value;
  }

  Future<void> pickImageFromGallery() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        profileImage.value = File(image.path);
        // TODO: Add API call here later
        // onTap() {} // Placeholder for API call
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to pick image');
    }
  }

  Future<void> updateProfile() async {
    // Replace with your API call
    // print(
    //     'Send to API: name=${nameController.text}, bio=${bioController.text}');
    displayName.value = nameController.text;

    // await YourApi.updateProfile(nameController.text, bioController.text);
  }

  @override
  void onClose() {
    nameController.dispose();
    bioController.dispose();
    super.onClose();
  }
}
