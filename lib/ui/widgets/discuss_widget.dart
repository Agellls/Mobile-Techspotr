import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/widgets/report_widget.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shimmer/shimmer.dart';

import '../../routes/routes_name.dart';
import '../../shared/theme.dart';
import '../../utilities/loading.dart';

class DiscussWidgetController extends GetxController {
  var isFullDiscuss = false.obs;

  void toggleFullDiscuss() {
    isFullDiscuss.value = !isFullDiscuss.value;
  }
}

class DiscussWidget extends StatelessWidget {
  final Color mainColor;
  final Map<String, dynamic> discussion;
  DiscussWidget({super.key, required this.mainColor, required this.discussion});

  final DiscussWidgetController discussWidgetController =
      Get.put(DiscussWidgetController());
  final TextEditingController reasonController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final user = discussion['user'] ?? {};
    final tags = (discussion['tags'] as List?)
            ?.map((e) => e['name']?.toString() ?? '')
            .where((t) => t.isNotEmpty)
            .toList() ??
        [];
    return Container(
      margin: const EdgeInsets.only(bottom: defaultSpace),
      padding: const EdgeInsets.all(defaultSpace),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: const BorderRadius.all(Radius.circular(defaultSpace)),
        boxShadow: [
          BoxShadow(
            color: blackColor.withOpacity(0.3),
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
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
                  imageUrl: user['image'] ??
                      'https://icons.veryicon.com/png/o/business/new-vision-2/picture-loading-failed-1.png',
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
                    user['name']?.toString() ?? '-',
                    style: blackTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: bold,
                    ),
                  ),
                  Text(
                    '${user['total_discuss'] ?? 0} Discussions',
                    style: blackTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: regular,
                      color: mainColor,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    discussion['create_time_elapsed']?.toString() ?? '',
                    style: blackTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: regular,
                      color: blackColor,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.reply,
                        color: blackColor,
                        size: 23,
                      ),
                      Text(
                        (discussion['total_child'] ?? 0).toString(),
                        style: blackTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: bold,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),

          // discuss content
          const SizedBox(height: defaultSpace),
          Text(
            discussion['title']?.toString() ?? '',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: bold,
            ),
          ),
          if (discussWidgetController.isFullDiscuss.value) ...[
            const SizedBox(height: defaultSpace / 2),
            Text(
              discussion['content']?.toString() ?? '',
              style: blackTextStyle.copyWith(
                fontSize: 14,
                fontWeight: regular,
              ),
            ),
          ] else
            ...[],

          // tags
          const SizedBox(height: defaultSpace / 2),
          Column(
            children: [
              if (tags.isNotEmpty) ...[
                const SizedBox(height: defaultSpace / 2),
                Wrap(
                  spacing: 5, // horizontal spacing between tags
                  runSpacing: 5, // vertical spacing between lines of tags
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
              Row(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(color: primaryColor),
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
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteName.discussReply, arguments: {
                        'mainColor': mainColor,
                        'discussion': discussion,
                        'name': user['name'] ?? '',
                        'totalDiscuss': user['total_discuss'] ?? 0,
                        'timedate': discussion['create_time_elapsed'] ?? '',
                        'title': discussion['title'] ?? '',
                        'content': discussion['content'] ?? '',
                        'tags': discussion['tags'] ?? [],
                        'id': discussion['id'] ?? 0,
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(color: primaryColor),
                      child: Row(
                        children: [
                          Icon(
                            CupertinoIcons.chat_bubble,
                            color: blackColor,
                            size: 18,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            'Reply',
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
                ],
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Share.share(
                        'Check this out, ${user['name'] ?? ''} has written a discussion in Techspotr. View more here https://techspotr.com/discuss/${discussion['id']}'),
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
                          id: discussion['id'] ?? 1),
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
        ],
      ),
    );
  }
}
