import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/ui/widgets/replies_widget.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../shared/theme.dart';
import '../../utilities/loading.dart';

class DiscussReplyWidget extends StatelessWidget {
  final Color mainColor;
  DiscussReplyWidget({super.key, required this.mainColor});

  final TextEditingController commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // header row
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipOval(
              child: CachedNetworkImage(
                imageUrl:
                    'https://wallpapers.com/images/featured-full/cool-profile-picture-87h46gcobjl5e4xu.jpg',
                width: 40,
                height: 40,
                fit: BoxFit.cover,
                placeholder: (context, url) => Shimmer.fromColors(
                  baseColor: secondaryColor,
                  highlightColor: thirdtyColor,
                  child: const ShimmerPerProfile(),
                ),
                errorWidget: (context, url, error) => Image.network(
                  'https://icons.veryicon.com/png/o/business/new-vision-2/picture-loading-failed-1.png',
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: defaultSpace),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'John Doe',
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: bold,
                  ),
                ),
                Text(
                  '1 Replies',
                  style: blackTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: regular,
                    color: mainColor,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Text(
              '2 days ago',
              style: blackTextStyle.copyWith(
                fontSize: 12,
                fontWeight: regular,
                color: blackColor,
              ),
            ),
          ],
        ),

        // review content
        const SizedBox(height: defaultSpace),
        Text(
          'Sunt occaecat duis eiusmod mollit elit ex fugiat veniam commodo non. Fugiat do sint veniam officia deserunt exercitation aliqua. Laborum enim enim do do ullamco. Fugiat consectetur magna in ut amet cupidatat aliqua.',
          style: blackTextStyle.copyWith(
            fontSize: 13,
            fontWeight: regular,
          ),
        ),

        // reply section
        const SizedBox(height: 5),
        Row(
          children: [
            Container(
              color: primaryColor,
              child: Row(
                children: [
                  Icon(
                    CupertinoIcons.heart,
                    color: blackColor,
                    size: 16,
                  ),
                  const SizedBox(width: defaultSpace / 2),
                  Text(
                    '0',
                    style: blackTextStyle.copyWith(
                      fontSize: 13,
                      fontWeight: regular,
                      color: blackColor,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: defaultSpace),
            GestureDetector(
              onTap: () {
                Get.bottomSheet(
                  RepliesWidget(
                    id: 1, // Sample ID, replace with actual ID
                    commentController: commentController,
                  ),
                  isScrollControlled: true,
                );
              },
              child: Container(
                color: primaryColor,
                child: Row(
                  children: [
                    Icon(
                      CupertinoIcons.chat_bubble,
                      color: blackColor,
                      size: 16,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      'Reply',
                      style: blackTextStyle.copyWith(
                        fontSize: 13,
                        color: blackColor,
                        fontWeight: regular,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            Text(
              'View reply...',
              style: blackTextStyle.copyWith(
                fontSize: 13,
                fontWeight: regular,
                color: mainColor,
              ),
            ),
          ],
        ), // show replies
        const SizedBox(height: defaultSpace / 2),

        // replies
        IntrinsicHeight(
          child: Row(
            children: [
              const SizedBox(width: 5 + 1),
              Container(
                width: 5,
                height: 150,
                decoration: BoxDecoration(
                  color: mainColor,
                  borderRadius: BorderRadius.circular(60),
                ),
              ),
              const SizedBox(width: defaultSpace),
              Expanded(
                child: Column(
                  children: [
                    //header row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipOval(
                          child: CachedNetworkImage(
                            imageUrl:
                                'https://wallpapers.com/images/featured-full/cool-profile-picture-87h46gcobjl5e4xu.jpg',
                            width: 40,
                            height: 40,
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Shimmer.fromColors(
                              baseColor: secondaryColor,
                              highlightColor: thirdtyColor,
                              child: const ShimmerPerProfile(),
                            ),
                            errorWidget: (context, url, error) => Image.network(
                              'https://icons.veryicon.com/png/o/business/new-vision-2/picture-loading-failed-1.png',
                              width: 40,
                              height: 40,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: defaultSpace),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'John Doe',
                              style: blackTextStyle.copyWith(
                                fontSize: 16,
                                fontWeight: bold,
                              ),
                            ),
                            Text(
                              '1 Replies',
                              style: blackTextStyle.copyWith(
                                fontSize: 12,
                                fontWeight: regular,
                                color: mainColor,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Text(
                          '2 days ago',
                          style: blackTextStyle.copyWith(
                            fontSize: 12,
                            fontWeight: regular,
                            color: blackColor,
                          ),
                        ),
                      ],
                    ),
                    // review content
                    const SizedBox(height: defaultSpace),
                    Text(
                      'Sunt occaecat duis eiusmod mollit elit ex fugiat veniam commodo non. Fugiat do sint veniam officia deserunt exercitation aliqua. Laborum enim enim do do ullamco. Fugiat consectetur magna in ut amet cupidatat aliqua.',
                      style: blackTextStyle.copyWith(
                        fontSize: 13,
                        fontWeight: regular,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Container(
                          color: primaryColor,
                          child: Row(
                            children: [
                              Icon(
                                CupertinoIcons.heart,
                                color: blackColor,
                                size: 16,
                              ),
                              const SizedBox(width: defaultSpace / 2),
                              Text(
                                '0',
                                style: blackTextStyle.copyWith(
                                  fontSize: 13,
                                  fontWeight: regular,
                                  color: blackColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: defaultSpace),
                        GestureDetector(
                          onTap: () {
                            Get.bottomSheet(
                              RepliesWidget(
                                id: 1,
                                commentController: commentController,
                              ),
                              isScrollControlled: true,
                            );
                          },
                          child: Container(
                            color: primaryColor,
                            child: Row(
                              children: [
                                Icon(
                                  CupertinoIcons.chat_bubble,
                                  color: blackColor,
                                  size: 16,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  'Reply',
                                  style: blackTextStyle.copyWith(
                                    fontSize: 13,
                                    color: blackColor,
                                    fontWeight: regular,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Spacer(),
                        Text(
                          'View reply...',
                          style: blackTextStyle.copyWith(
                            fontSize: 13,
                            fontWeight: regular,
                            color: mainColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: defaultSpace / 2),

        // child replies
        IntrinsicHeight(
          child: Row(
            children: [
              const SizedBox(width: defaultSpace * 2 + 2),
              Container(
                width: 5,
                decoration: BoxDecoration(
                  color: mainColor,
                  borderRadius: BorderRadius.circular(60),
                ),
              ),
              const SizedBox(width: defaultSpace),
              Expanded(
                child: Column(
                  children: [
                    //header row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipOval(
                          child: CachedNetworkImage(
                            imageUrl:
                                'https://wallpapers.com/images/featured-full/cool-profile-picture-87h46gcobjl5e4xu.jpg',
                            width: 40,
                            height: 40,
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Shimmer.fromColors(
                              baseColor: secondaryColor,
                              highlightColor: thirdtyColor,
                              child: const ShimmerPerProfile(),
                            ),
                            errorWidget: (context, url, error) => Image.network(
                              'https://icons.veryicon.com/png/o/business/new-vision-2/picture-loading-failed-1.png',
                              width: 40,
                              height: 40,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: defaultSpace),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'John Doe',
                              style: blackTextStyle.copyWith(
                                fontSize: 16,
                                fontWeight: bold,
                              ),
                            ),
                            Text(
                              '1 Replies',
                              style: blackTextStyle.copyWith(
                                fontSize: 12,
                                fontWeight: regular,
                                color: mainColor,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Text(
                          '2 days ago',
                          style: blackTextStyle.copyWith(
                            fontSize: 12,
                            fontWeight: regular,
                            color: blackColor,
                          ),
                        ),
                      ],
                    ),
                    // review content
                    const SizedBox(height: defaultSpace),
                    Text(
                      'Sunt occaecat duis eiusmod mollit elit ex fugiat veniam commodo non. Fugiat do sint veniam officia deserunt exercitation aliqua. Laborum enim enim do do ullamco. Fugiat consectetur magna in ut amet cupidatat aliqua.',
                      style: blackTextStyle.copyWith(
                        fontSize: 13,
                        fontWeight: regular,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Container(
                          color: primaryColor,
                          child: Row(
                            children: [
                              Icon(
                                CupertinoIcons.heart,
                                color: blackColor,
                                size: 16,
                              ),
                              const SizedBox(width: defaultSpace / 2),
                              Text(
                                '0',
                                style: blackTextStyle.copyWith(
                                  fontSize: 13,
                                  fontWeight: regular,
                                  color: blackColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: defaultSpace),
                        GestureDetector(
                          onTap: () {
                            Get.bottomSheet(
                              RepliesWidget(
                                id: 1, // Sample ID, replace with actual ID
                                commentController: commentController,
                              ),
                              isScrollControlled: true,
                            );
                          },
                          child: Container(
                            color: primaryColor,
                            child: Row(
                              children: [
                                Icon(
                                  CupertinoIcons.chat_bubble,
                                  color: blackColor,
                                  size: 16,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  'Reply',
                                  style: blackTextStyle.copyWith(
                                    fontSize: 13,
                                    color: blackColor,
                                    fontWeight: regular,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Spacer(),
                        // Text(
                        //   'View reply...',
                        //   style: blackTextStyle.copyWith(
                        //     fontSize: 13,
                        //     fontWeight: regular,
                        //     color: mainColor,
                        //   ),
                        // ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: defaultSpace / 2),
      ],
    );
  }
}
