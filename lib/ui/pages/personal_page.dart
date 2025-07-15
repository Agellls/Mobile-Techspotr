import 'package:flutter/material.dart';
import '../../shared/app_svg.dart';
import '../../shared/theme.dart';
import '../widgets/custom_button.dart';
import '../widgets/form_with_lottie.dart';
import '../widgets/input_form.dart';

class PersonalPage extends StatelessWidget {
  PersonalPage({super.key});

  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController zipController = TextEditingController();
  final TextEditingController facebookController = TextEditingController();
  final TextEditingController instagramController = TextEditingController();
  final TextEditingController tiktokController = TextEditingController();
  final TextEditingController youtubeController = TextEditingController();
  final TextEditingController pinterestController = TextEditingController();
  final TextEditingController linkedinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Personal',
          style: blackTextStyle.copyWith(
            fontSize: 22,
            fontWeight: extrabold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.close,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        foregroundColor: blackColor,
        surfaceTintColor: Colors.transparent,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            InputForm(
              title: 'Phone Number',
              subtitle: '',
              controller: phoneController,
              hintText: 'Enter your phone number',
              maxLines: 1,
            ),
            InputForm(
              title: 'Address',
              subtitle: '',
              controller: addressController,
              hintText: 'Enter your address',
              maxLines: 3,
            ),
            InputForm(
              title: 'Zip Code',
              subtitle: '',
              controller: zipController,
              hintText: 'Enter your zip code',
              maxLines: 1,
            ),
            const SizedBox(height: defaultSpace / 2),
            Row(
              children: [
                Expanded(
                  child: CustomFieldWithLogo(
                    hintText: 'link facebook',
                    controller: facebookController,
                    maxLines: 1,
                    iconSize: 24,
                    fillColor: secondaryColor,
                    lottieAsset: 'assets/facebook.json',
                  ),
                ),
                const SizedBox(width: defaultSpace),
                Expanded(
                  child: CustomFieldWithLogo(
                    hintText: 'link instagram',
                    controller: instagramController,
                    maxLines: 1,
                    iconSize: 24,
                    fillColor: secondaryColor,
                    lottieAsset: 'assets/instagram.json',
                  ),
                ),
              ],
            ),
            const SizedBox(height: defaultSpace),
            Row(
              children: [
                Expanded(
                  child: CustomFieldWithLogo(
                    hintText: 'link tiktok',
                    controller: tiktokController,
                    maxLines: 1,
                    iconSize: 24,
                    fillColor: secondaryColor,
                    lottieAsset: 'assets/tiktok.json',
                  ),
                ),
                const SizedBox(width: defaultSpace),
                Expanded(
                  child: CustomFieldWithLogo(
                    hintText: 'link youtube',
                    controller: youtubeController,
                    maxLines: 1,
                    svgIcon: AppSvg.youtube,
                    iconSize: 24,
                    fillColor: secondaryColor,
                    lottieAsset: 'assets/youtube.json',
                  ),
                ),
              ],
            ),
            const SizedBox(height: defaultSpace),
            Row(
              children: [
                Expanded(
                  child: CustomFieldWithLogo(
                    hintText: 'link pinterest',
                    controller: pinterestController,
                    maxLines: 1,
                    iconSize: 24,
                    fillColor: secondaryColor,
                    lottieAsset: 'assets/pinterest.json',
                  ),
                ),
                const SizedBox(width: defaultSpace),
                Expanded(
                  child: CustomFieldWithLogo(
                    hintText: 'link linkedin',
                    controller: linkedinController,
                    maxLines: 1,
                    iconSize: 24,
                    fillColor: secondaryColor,
                    lottieAsset: 'assets/linkedin.json',
                  ),
                ),
              ],
            ),
            const SizedBox(height: defaultSpace * 2),
            CustomButton(
              ontap: () {},
              hintText: 'Save Changes',
              height: 40,
              width: 180,
              borderRadius: 10,
            ),
          ],
        ),
      ),
    );
  }
}
