import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/widgets/discuss_reply_widget.dart';
import 'package:flutter_application_1/ui/widgets/replies_widget.dart';
import 'package:flutter_application_1/ui/widgets/report_widget.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shimmer/shimmer.dart';
import 'package:get_storage/get_storage.dart';

import '../../shared/theme.dart';
import '../../utilities/loading.dart';

class DiscussReplyPage extends StatelessWidget {
  final Color mainColor;
  DiscussReplyPage({super.key, required this.mainColor});

  final TextEditingController reasonController = TextEditingController();
  final TextEditingController commentController = TextEditingController();
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments ?? {};
    final userName = args['name']?.toString() ?? 'John Doe';
    final userImage = (args['discussion']?['user']?['image'] ??
        'https://wallpapers.com/images/featured-full/cool-profile-picture-87h46gcobjl5e4xu.jpg');
    final totalDiscuss = args['totalDiscuss']?.toString() ?? '1';
    final timeDate = args['timedate']?.toString() ?? '2 days ago';
    final title =
        args['title']?.toString() ?? 'How to change the water filter?';
    final content = args['content']?.toString() ??
        'Sunt occaecat duis eiusmod mollit elit ex fugiat veniam commodo non. Fugiat do sint veniam officia deserunt exercitation aliqua. Laborum enim enim do do ullamco. Fugiat consectetur magna in ut amet cupidatat aliqua.';
    final tags = (args['tags'] as List?)
            ?.map((e) => e['name']?.toString() ?? '')
            .where((t) => t.isNotEmpty)
            .toList() ??
        [];
    final discussionId = args['id'] ?? 1;

    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Reply Discussions',
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
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: defaultSpace),
              decoration: BoxDecoration(
                color: whiteColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // header row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipOval(
                        child: CachedNetworkImage(
                          imageUrl: userImage,
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Shimmer.fromColors(
                            baseColor: secondaryColor,
                            highlightColor: thirdtyColor,
                            child: const ShimmerPerProfile(),
                          ),
                          errorWidget: (context, url, error) => Image.network(
                            'https://icons.veryicon.com/png/o/business/new-vision-2/picture-loading-failed-1.png',
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: defaultSpace),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            userName,
                            style: blackTextStyle.copyWith(
                              fontSize: 18,
                              fontWeight: bold,
                            ),
                          ),
                          Text(
                            '$totalDiscuss Discussions',
                            style: blackTextStyle.copyWith(
                              fontSize: 14,
                              fontWeight: regular,
                              color: mainColor,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Text(
                        timeDate,
                        style: blackTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: regular,
                          color: blackColor,
                        ),
                      ),
                    ],
                  ),

                  // discuss content
                  const SizedBox(height: defaultSpace),
                  Text(
                    title,
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: bold,
                    ),
                  ),
                  const SizedBox(height: defaultSpace / 2),
                  Text(
                    content,
                    style: blackTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: regular,
                    ),
                  ),

                  // tags
                  const SizedBox(height: defaultSpace / 2),
                  Column(
                    children: [
                      if (tags.isNotEmpty) ...[
                        const SizedBox(height: defaultSpace / 2),
                        Wrap(
                          spacing: 5, // horizontal spacing between tags
                          runSpacing:
                              5, // vertical spacing between lines of tags
                          children: [
                            for (var tag in tags)
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                decoration: BoxDecoration(
                                  color: mainColor,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Text(
                                  tag,
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 14,
                                    fontWeight: regular,
                                  ),
                                  maxLines: 1,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                          ],
                        ),
                      ],
                    ],
                  ),

                  // option
                  const SizedBox(height: defaultSpace),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(color: whiteColor),
                          child: Row(
                            children: [
                              Icon(
                                CupertinoIcons.heart,
                                color: blackColor,
                                size: 18,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                'Useful',
                                style: blackTextStyle.copyWith(
                                  fontSize: 14,
                                  color: blackColor,
                                  fontWeight: regular,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () => Share.share(
                                'Check this out, $userName has written a discussion in Techspotr. View more here https://techspotr.com/discuss/$discussionId'),
                            child: Container(
                              color: primaryColor,
                              child: Icon(
                                CupertinoIcons.share,
                                color: blackColor,
                                size: 18,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          GestureDetector(
                            onTap: () => Get.bottomSheet(
                              ReportWidget(
                                reasonController: reasonController,
                                id: discussionId,
                              ),
                              isScrollControlled: true,
                            ),
                            child: Container(
                              color: primaryColor,
                              child: Icon(
                                CupertinoIcons.flag,
                                color: blackColor,
                                size: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  // lines
                  Divider(
                    color: mainColor.withOpacity(0.5),
                    height: defaultSpace * 2,
                  ),

                  // reply ui
                  DiscussReplyWidget(
                    mainColor: mainColor,
                  )
                ],
              ),
            ),
          ),

          // Floating Action Button for Comment
          Positioned(
            bottom: defaultSpace,
            right: defaultSpace,
            child: FloatingActionButton(
              onPressed: () {
                Get.bottomSheet(
                  RepliesWidget(
                    id: discussionId,
                    commentController: commentController,
                  ),
                  isScrollControlled: true,
                );
              },
              backgroundColor: activeColor,
              child: Icon(Icons.comment, color: whiteColor),
            ),
          ),
        ],
      ),
    );
  }
}
