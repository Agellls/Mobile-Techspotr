import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../shared/theme.dart';

class InputProsAndConsController extends GetxController {
  final RxList<String> items = <String>[].obs;
  final TextEditingController textController = TextEditingController();
  final FocusNode focusNode = FocusNode();

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

class InputProsAndCons extends StatelessWidget {
  final String title;
  final String hintText;
  final String subtitle;
  final Function(List<String>) onItemsChanged;
  final List<String> initialItems;
  final int maxLines;
  final String uniqueTag;

  const InputProsAndCons({
    super.key,
    required this.title,
    required this.hintText,
    required this.subtitle,
    required this.onItemsChanged,
    required this.initialItems,
    this.maxLines = 1,
    required this.uniqueTag,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(InputProsAndConsController(), tag: uniqueTag);

    // Initialize items if not empty
    if (initialItems.isNotEmpty && controller.items.isEmpty) {
      controller.items.addAll(initialItems);
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                title,
                style: blackTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: bold,
                ),
              ),
              Text(
                subtitle,
                style: whiteTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: regular,
                ),
              ),
            ],
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
                fontSize: 16,
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
