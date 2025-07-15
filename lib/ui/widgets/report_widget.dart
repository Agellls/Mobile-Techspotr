import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/widgets/custom_field.dart';
import 'package:get/get.dart';

import '../../shared/theme.dart';

class ReportWidgetController extends GetxController {
  var isLoading = false.obs;

  Future<void> submitReport(
      {required String parentId, required String content}) async {
    isLoading.value = true;
    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));
    // Add your actual API call here
    isLoading.value = false;
    Get.back(); // Close bottom sheet
  }
}

class ReportWidget extends StatelessWidget {
  final TextEditingController reasonController;
  final int id;
  ReportWidget({super.key, required this.reasonController, required this.id});

  final reportWidgetController = Get.put(ReportWidgetController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: defaultSpace / 2,
        horizontal: defaultSpace,
      ),
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(
            color: blackColor,
            thickness: 3,
            height: 10,
            indent: 165,
            endIndent: 165,
          ),
          const SizedBox(height: defaultSpace / 2),
          Text(
            'Report post of agellls',
            style: blackTextStyle.copyWith(
              fontSize: 18,
              fontWeight: bold,
            ),
          ),
          Text(
            'Please provide a reason for reporting this post. Your report will be reviewed by our team.',
            style: blackTextStyle.copyWith(
              fontSize: 14,
              fontWeight: light,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultSpace / 2),
            child: CustomField(
              hintText: 'Type your reason here...',
              fillColor: secondaryColor,
              controller: reasonController,
            ),
          ),
          Row(
            children: [
              const Spacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: activeColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60),
                  ),
                ),
                onPressed: () async {
                  if (reasonController.text.trim().isEmpty) {
                    Get.rawSnackbar(
                      duration: const Duration(seconds: 2),
                      message: 'Reason cannot be empty',
                      borderRadius: 10,
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: thirdtyColor,
                      margin: const EdgeInsets.only(
                          bottom: 20, left: 20, right: 20),
                    );
                    return;
                  }

                  await reportWidgetController.submitReport(
                    parentId: id.toString(),
                    content: reasonController.text,
                  );
                },
                child: reportWidgetController.isLoading.value
                    ? SizedBox(
                        width: 25,
                        height: 25,
                        child: CircularProgressIndicator(
                          color: whiteColor,
                          strokeWidth: 3,
                        ),
                      )
                    : Text(
                        'Send Report',
                        style: whiteTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: bold,
                        ),
                      ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
