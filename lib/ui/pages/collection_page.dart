import 'package:flutter/material.dart';
import 'package:flutter_application_1/shared/theme.dart';
import 'package:get/get.dart';

import '../../controllers/get_collection_controller.dart';
import '../../routes/routes_name.dart';
import '../widgets/collection_widget.dart';

class CollectionPage extends StatelessWidget {
  const CollectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final GetCollectionController collectionController =
        Get.put(GetCollectionController());
    final args = Get.arguments ?? {};
    final int postId = args['postId'] ?? 0;
    final int userId = args['userId'] ?? 0;

    // Fetch collections when page loads
    if (postId != 0) {
      collectionController.loadCollections(
        postId: postId,
      );
    } else if (userId != 0) {
      collectionController.loadCollections(
        userId: userId,
      );
    }

    return Container(
      color: primaryColor,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: primaryColor,
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'Collection',
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
            actions: [
              IconButton(
                icon: Icon(
                  Icons.bookmark_add_outlined,
                  color: activeColor,
                ),
                splashColor: Colors.transparent, // Disable splash
                highlightColor: Colors.transparent, // Disable highlight
                hoverColor:
                    Colors.transparent, // Disable hover (for web/desktop)
                onPressed: () {
                  Get.toNamed(RouteName.writeCollection);
                },
              ),
            ],
            backgroundColor: Colors.transparent,
            foregroundColor: blackColor,
            surfaceTintColor: Colors.transparent,
          ),
          body: Obx(() {
            if (collectionController.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            }
            if (collectionController.error.isNotEmpty) {
              return Center(child: Text(collectionController.error.value));
            }
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultSpace),
                child: Column(
                  children: [
                    ...collectionController.collections.map((collection) {
                      final user = collection['user'] ?? {};
                      final showcase = collection['post_showcase'] ?? [];
                      return CollectionWidget(
                        idCollection: collection['id'] ?? 0,
                        imageProfileUrl: user['image'] ?? '',
                        profileName: user['name'] ?? '',
                        totalCollection: user['total_collection'] ?? 0,
                        totalItems: collection['total_item'] ?? 0,
                        mainColor: thirdtyColor,
                        productImageUrl1: showcase.isNotEmpty
                            ? showcase[0]['image'] ?? ''
                            : '',
                        productImageUrl2: showcase.length > 1
                            ? showcase[1]['image'] ?? ''
                            : '',
                        productImageUrl3: showcase.length > 2
                            ? showcase[2]['image'] ?? ''
                            : '',
                        title: collection['title'] ?? '', // <-- read title here
                      );
                    }),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
