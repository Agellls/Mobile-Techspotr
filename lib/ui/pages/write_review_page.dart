import 'package:flexible_wrap/flexible_wrap.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../controllers/write_review_controller.dart';
import '../../shared/theme.dart';
import '../widgets/input_form.dart';
import '../widgets/input_image.dart';
import '../widgets/input_pros_cons.dart';
import '../widgets/input_rating.dart';
import '../widgets/input_tags.dart';

class WriteReviewPage extends StatelessWidget {
  WriteReviewPage({super.key});

  final WriteReviewsController writeReviewsController =
      Get.put(WriteReviewsController());
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  final List<XFile?> _pickedImages = List<XFile?>.filled(10, null).obs;
  // Create RxList to store the values
  final RxList<String> prosList = <String>[].obs;
  final RxList<String> consList = <String>[].obs;
  final RxList<String> tagsList = <String>[].obs;

  // Add a method to count actual images in the UI
  int countActualPickedImages() {
    return _pickedImages.where((image) => image != null).length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Write Reviews',
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultSpace),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InputForm(
                title: 'Title *',
                subtitle: '',
                controller: titleController,
                hintText: 'Got a title in mind?',
                maxLines: 1,
              ),
              InputForm(
                title: 'Content *',
                subtitle: '',
                controller: contentController,
                hintText: 'Let the keyboard do talking...',
                maxLines: 3,
              ),
              InputImage(
                title: 'Add photos for review',
                subtitle:
                    'Photos are useful to other users and make your review stand out.',
                secTitle: 'Upload an image related to this review.',
                secSubtitle:
                    '(Images can be screenshots of you checking out, product quality, etc.)',
                onImageSelected: (file) {
                  writeReviewsController.setImage(file);
                },
              ),
              const SizedBox(height: defaultSpace),
              InputProsAndCons(
                title: 'Pros *',
                subtitle: 'Add some positive points',
                hintText: 'Pros... (Enter to save your pros)',
                onItemsChanged: (items) {
                  prosList.value = items;
                },
                initialItems: const [],
                uniqueTag: 'pros',
              ),
              InputProsAndCons(
                title: 'Cons *',
                subtitle: 'Add some negative points',
                hintText: 'Cons...(Enter to save your cros)',
                onItemsChanged: (items) {
                  consList.value = items;
                },
                initialItems: const [],
                uniqueTag: 'cons',
              ),
              InputTags(
                title: 'Tags *',
                hintText: 'Tags...(Enter to save your tags)',
                subtitle:
                    'Add tags to your review, separate them with commas (,) or generate tag using AI',
                onItemsChanged: (items) {
                  tagsList.value = items;
                },
                initialItems: const [],
                inputControllers: [titleController, contentController],
                postId: '1',
              ),
              const SizedBox(height: defaultSpace),
              Text(
                'Rate Me?',
                style: blackTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: bold,
                ),
              ),
              Text(
                'Slam those stars like a pro ...',
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: regular,
                ),
              ),
              const SizedBox(height: defaultSpace / 2),
              FlexibleWrap(
                isOneRowExpanded: true,
                children: [
                  InputRating(
                    title: 'Dimensions & Weight',
                    subtitle: 'Looking good... or meh?',
                    ratingController:
                        Get.put(RatingController(), tag: 'ordering'),
                    icon: Icons.shopping_bag_outlined,
                  ),
                  InputRating(
                    title: 'Capacity',
                    subtitle: 'Looking good... or meh?',
                    ratingController:
                        Get.put(RatingController(), tag: 'service'),
                    icon: Icons.handshake_outlined,
                  ),
                  InputRating(
                    title: 'Refrigerator',
                    subtitle: 'Looking good... or meh?',
                    ratingController:
                        Get.put(RatingController(), tag: 'pricing'),
                    icon: CupertinoIcons.money_dollar_circle,
                  ),
                  InputRating(
                    title: 'Features',
                    subtitle: 'Looking good... or meh?',
                    ratingController:
                        Get.put(RatingController(), tag: 'delivery'),
                    icon: CupertinoIcons.hare,
                  ),
                  InputRating(
                    title: 'Freezer',
                    subtitle: 'Looking good... or meh?',
                    ratingController:
                        Get.put(RatingController(), tag: 'product'),
                    icon: CupertinoIcons.cube_box,
                  ),
                ],
              ),
              const SizedBox(height: defaultSpace),
              Container(
                padding: const EdgeInsets.all(defaultSpace),
                decoration: BoxDecoration(
                  color: compareColor,
                  borderRadius: BorderRadius.circular(60),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    writeReviewsController.isLoading.value
                        ? SizedBox(
                            width: 25,
                            height: 25,
                            child: CircularProgressIndicator(
                              color: whiteColor,
                              strokeWidth: 3,
                            ),
                          )
                        : Icon(
                            Icons.send_rounded,
                            color: whiteColor,
                            size: 25,
                          ),
                    const SizedBox(width: defaultSpace),
                    Text(
                      writeReviewsController.isLoading.value
                          ? 'Submitting...'
                          : 'Submit Review',
                      style: whiteTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: bold,
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
    );
  }
}
