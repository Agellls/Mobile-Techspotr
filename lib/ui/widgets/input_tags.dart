import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../shared/theme.dart';

class InputTagsController extends GetxController {
  final RxList<String> items = <String>[].obs;
  final TextEditingController textController = TextEditingController();
  final FocusNode focusNode = FocusNode();
  var isLoading = false.obs;

  @override
  void onClose() {
    textController.dispose();
    focusNode.dispose();
    super.onClose();
  }

  void addItem(String item) {
    if (item.trim().isNotEmpty && !items.contains(item.trim())) {
      items.add(item.trim());
      textController.clear();
      focusNode.requestFocus();
    }
  }

  void removeItem(int index) {
    if (index >= 0 && index < items.length) {
      items.removeAt(index);
    }
  }
}

class InputTags extends StatelessWidget {
  final String title;
  final String hintText;
  final String subtitle;
  final Function(List<String>) onItemsChanged;
  final List<String> initialItems;
  final int maxLines;
  final List<TextEditingController> inputControllers;
  final String postId;

  const InputTags({
    super.key,
    required this.title,
    required this.hintText,
    required this.subtitle,
    required this.onItemsChanged,
    required this.initialItems,
    this.maxLines = 1,
    required this.inputControllers,
    required this.postId,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(InputTagsController());

    // Initialize items if not empty
    if (initialItems.isNotEmpty && controller.items.isEmpty) {
      controller.items.addAll(initialItems);
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: blackTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: bold,
                ),
              ),
              Obx(
                () => controller.isLoading.value
                    ? Container(
                        width: 148,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: thirdtyColor,
                          borderRadius: BorderRadius.circular(60),
                        ),
                        child: Center(
                          child: SizedBox(
                            height: 17,
                            width: 17,
                            child: CircularProgressIndicator(
                              strokeWidth: 3,
                              color: whiteColor,
                            ),
                          ),
                        ),
                      )
                    : GestureDetector(
                        onTap: () async {
                          // // Extract current text from input controllers
                          // List<String> inputValues = inputControllers
                          //     .map((controller) => controller.text)
                          //     .toList();

                          // // Check if input list contains actual content
                          // bool hasContent =
                          //     inputValues.any((text) => text.trim().isNotEmpty);

                          // if (hasContent) {
                          //   controller.isLoading.value = true;

                          //   await ApiService()
                          //       .fetchGenerateTagAi(
                          //     postId,
                          //     inputValues,
                          //   )
                          //       .then((response) {
                          //     // Add each tag from the API response
                          //     for (String tag in response.data) {
                          //       if (!controller.items.contains(tag)) {
                          //         controller.items.add(tag);
                          //       }
                          //     } // Notify the parent widget of the changes
                          //     onItemsChanged(controller.items);

                          //     // No need to clear the input controllers, they will persist their values
                          //     Get.rawSnackbar(
                          //       message: 'Tags generated successfully',
                          //       borderRadius: 10,
                          //       duration: const Duration(seconds: 2),
                          //       snackPosition: SnackPosition.BOTTOM,
                          //       backgroundColor: activeColor,
                          //       margin: const EdgeInsets.only(
                          //         bottom: 20,
                          //         left: 20,
                          //         right: 20,
                          //       ),
                          //     );
                          //   }).catchError((error) {
                          //     // Error case
                          //     Get.rawSnackbar(
                          //       message:
                          //           'Failed to generate tags, please try again',
                          //       borderRadius: 10,
                          //       duration: const Duration(seconds: 2),
                          //       snackPosition: SnackPosition.BOTTOM,
                          //       backgroundColor: Colors.red,
                          //       margin: const EdgeInsets.only(
                          //         bottom: 20,
                          //         left: 20,
                          //         right: 20,
                          //       ),
                          //     );
                          //   }).whenComplete(() {
                          //     controller.isLoading.value = false;
                          //   });
                          // } else {
                          //   Get.rawSnackbar(
                          //     message:
                          //         'Please add some content for generating tags',
                          //     borderRadius: 10,
                          //     duration: const Duration(seconds: 2),
                          //     snackPosition: SnackPosition.BOTTOM,
                          //     backgroundColor: Colors.red,
                          //     margin: const EdgeInsets.only(
                          //       bottom: 20,
                          //       left: 20,
                          //       right: 20,
                          //     ),
                          //   );
                          // }
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: thirdtyColor,
                            borderRadius: BorderRadius.circular(60),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                CupertinoIcons.arrow_2_circlepath_circle,
                                color: whiteColor,
                                size: 20,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                'Generate Tags',
                                style: whiteTextStyle.copyWith(
                                  fontSize: 16,
                                  fontWeight: semibold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Text(
            subtitle,
            style: blackTextStyle.copyWith(
              fontSize: 14,
              fontWeight: regular,
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: controller.textController,
            focusNode: controller.focusNode,
            cursorColor: activeColor,
            style: blackTextStyle.copyWith(fontSize: 16),
            maxLines: maxLines,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: whiteTextStyle.copyWith(
                fontSize: 14,
                color: blackColor.withOpacity(0.5),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: secondaryColor,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: thirdtyColor,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: secondaryColor.withOpacity(0.8),
                ),
              ),
              filled: true,
              fillColor: secondaryColor,
              contentPadding: const EdgeInsets.all(10),
            ),
            onSubmitted: (value) {
              controller.addItem(value);
              onItemsChanged(controller.items);
            },
          ),
          Obx(
            () => controller.items.isNotEmpty
                ? Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: controller.items.asMap().entries.map((entry) {
                        return Container(
                          decoration: BoxDecoration(
                            color: activeColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                entry.value,
                                style: whiteTextStyle.copyWith(
                                  fontSize: 14,
                                  fontWeight: medium,
                                ),
                              ),
                              const SizedBox(width: 4),
                              GestureDetector(
                                onTap: () {
                                  controller.removeItem(entry.key);
                                  onItemsChanged(controller.items);
                                },
                                child: Icon(
                                  Icons.close_rounded,
                                  size: 18,
                                  color: whiteColor,
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
