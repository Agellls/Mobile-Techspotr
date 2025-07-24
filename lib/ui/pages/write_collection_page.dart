import 'package:cached_network_image/cached_network_image.dart';
import 'package:flexible_wrap/flexible_wrap.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shimmer/shimmer.dart';

import '../../controllers/write_review_controller.dart';
import '../../services/api_services.dart';
import '../../shared/theme.dart';
import '../../utilities/loading.dart';
import '../widgets/input_form.dart';
import '../widgets/input_image.dart';
import '../widgets/input_pros_cons.dart';
import '../widgets/input_rating.dart';
import '../widgets/input_tags.dart';
import '../widgets/single_products.dart';

class WriteCollectionPage extends StatelessWidget {
  WriteCollectionPage({super.key});

  final WriteReviewsController writeReviewsController =
      Get.put(WriteReviewsController());
  final ApiServices apiServices = ApiServices();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  final TextEditingController searchController = TextEditingController();
  final List<XFile?> _pickedImages = List<XFile?>.filled(10, null).obs;
  // Create RxList to store the values
  final RxList<String> prosList = <String>[].obs;
  final RxList<String> consList = <String>[].obs;
  final RxList<String> tagsList = <String>[].obs;
  final RxList<Map<String, dynamic>> searchResults =
      <Map<String, dynamic>>[].obs;
  // Change pickedItem to a list
  final RxList<Map<String, dynamic>> pickedItems = <Map<String, dynamic>>[].obs;

  // Add a method to count actual images in the UI
  int countActualPickedImages() {
    return _pickedImages.where((image) => image != null).length;
  }

  void searchItems(String keyword) async {
    searchResults.value = [];
    if (keyword.isEmpty) return;
    // Example: search posts by keyword, you can change to other API if needed
    final results = await apiServices.fetchPopularPosts(keyword: keyword);
    searchResults.value = results;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Write Collection',
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
              left: defaultSpace, right: defaultSpace, bottom: defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- Picked Items (if any) ---
              Obx(() {
                if (pickedItems.isEmpty) return const SizedBox.shrink();
                return FlexibleWrap(
                  spacing: defaultSpace,
                  runSpacing: defaultSpace,
                  isOneRowExpanded: true,
                  children: pickedItems.map((item) {
                    return Container(
                      width: 160, // set fixed width for grid card
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: Stack(
                        children: [
                          _PickedProductCard(item: item),
                          Positioned(
                            left: 125,
                            child: IconButton(
                              icon: Icon(Icons.close, color: Colors.red),
                              onPressed: () => pickedItems.remove(item),
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                );
              }),
              // --- Search Form (always visible) ---
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Search Item *',
                      style: blackTextStyle.copyWith(
                          fontWeight: bold, fontSize: 16),
                    ),
                    Text(
                      'Search for a product/post to associate with this collection.',
                      style: blackTextStyle.copyWith(fontSize: 12),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: searchController,
                      decoration: InputDecoration(
                        hintText: 'Type to search...',
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
                            color: secondaryColor,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: secondaryColor,
                          ),
                        ),
                        filled: true,
                        fillColor: secondaryColor,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                      ),
                      onChanged: (val) {
                        searchItems(val);
                      },
                    ),
                  ],
                ),
              ),
              // --- Search Results ---
              Obx(() {
                if (searchResults.isEmpty) return SizedBox.shrink();
                return Column(
                  children: searchResults.map((item) {
                    return GestureDetector(
                      onTap: () {
                        // Only add if not already picked
                        if (!pickedItems.any((e) => e['id'] == item['id'])) {
                          pickedItems.add(item);
                        }
                        searchResults.value = [];
                        searchController.text = '';
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: defaultSpace / 2),
                        padding: const EdgeInsets.all(defaultSpace / 2),
                        decoration: BoxDecoration(
                          color: secondaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            CachedNetworkImage(
                              imageUrl: item['image'],
                              width: 60,
                              height: 60,
                              fit: BoxFit.cover,
                              placeholder: (context, url) => Shimmer.fromColors(
                                baseColor: secondaryColor,
                                highlightColor: thirdtyColor,
                                child: const ShimmerPerProfile(),
                              ),
                              errorWidget: (context, url, error) =>
                                  Image.network(
                                'https://icons.veryicon.com/png/o/business/new-vision-2/picture-loading-failed-1.png',
                                width: 60,
                                height: 60,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(
                              width: defaultSpace / 2,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  item['title'],
                                  style: blackTextStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: bold,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  children: [
                                    ClipOval(
                                      child: CachedNetworkImage(
                                        imageUrl: item['brand']['image'],
                                        width: 30,
                                        height: 30,
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
                                          width: 30,
                                          height: 30,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: defaultSpace / 2),
                                    Text(
                                      "${item['brand']['name']} • ${item['category']['alias']}",
                                      style: blackTextStyle.copyWith(
                                        fontSize: 14,
                                        fontWeight: medium,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                );
              }),
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
            ],
          ),
        ),
      ),
    );
  }
}

// Widget to show picked product info similar to SingleProducts
class _PickedProductCard extends StatelessWidget {
  final Map<String, dynamic> item;
  const _PickedProductCard({required this.item});

  @override
  Widget build(BuildContext context) {
    // Safely cast productPrice and productPriceImages (if available)
    List<double> priceList = [];
    if (item['productPrice'] is List) {
      priceList = (item['productPrice'] as List)
          .map((e) => e is double ? e : (e is num ? e.toDouble() : 0.0))
          .toList();
    }
    List<String> priceImagesList = [];
    if (item['productPriceImages'] is List) {
      priceImagesList = (item['productPriceImages'] as List)
          .map((e) => e is String ? e : e.toString())
          .toList();
    }

    // Map API fields to SingleProducts props
    final brand = item['brand'] ?? {};
    return SingleProducts(
      id: item['id']?.toString() ?? '',
      productName: item['title'] ?? item['name'] ?? 'Unknown Product',
      productImage: item['image'] ?? '',
      productRating: (item['score'] is num ? item['score'].toDouble() : 0.0),
      productPrice: priceList,
      productPriceImages: priceImagesList,
      brandImage: brand['image'] ?? '',
      brandName: brand['name'] ?? 'Unknown Brand',
    );
  }
}
