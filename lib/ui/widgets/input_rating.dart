import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../shared/theme.dart';

class RatingController extends GetxController {
  var selectedRating = 0.obs;

  void updateRating(int rating) {
    selectedRating.value = rating;
  }
}

class InputRating extends StatelessWidget {
  final String title;
  final String subtitle;
  final RatingController ratingController;
  final IconData icon;

  const InputRating({
    super.key,
    required this.title,
    required this.subtitle,
    required this.ratingController,
    this.icon = CupertinoIcons.smiley,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: defaultSpace / 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: regular,
            ),
          ),
          Obx(() {
            return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: List.generate(5, (index) {
                return GestureDetector(
                  onTap: () {
                    ratingController.updateRating(index + 1);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 3),
                    child: Icon(
                      icon,
                      size: 35,
                      color: index < ratingController.selectedRating.value
                          ? thirdtyColor
                          : thirdtyColor.withOpacity(0.3),
                    ),
                  ),
                );
              }),
            );
          }),
        ],
      ),
    );
  }
}
