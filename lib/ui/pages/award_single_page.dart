import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/widgets/award_single_detail_widget.dart';
import 'package:flutter_application_1/ui/widgets/button_widget.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:shimmer/shimmer.dart';

import '../../shared/app_svg.dart';
import '../../shared/theme.dart';
import '../../utilities/loading.dart';
import '../widgets/store_button.dart';

class AwardSinglePage extends StatelessWidget {
  const AwardSinglePage({super.key});

  @override
  Widget build(BuildContext context) {
    final horizontalScrollController = ScrollController();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Detail Award',
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
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Icon(CupertinoIcons.bag_fill,
                          color: compareColor, size: 20),
                      const SizedBox(width: 5),
                      Text(
                        '11',
                        style: whiteTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: bold,
                            color: compareColor),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        'Products',
                        style: whiteTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: bold,
                          color: compareColor,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(CupertinoIcons.chat_bubble_fill,
                          color: compareColor, size: 20),
                      const SizedBox(width: 5),
                      Text(
                        '0',
                        style: whiteTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: bold,
                          color: compareColor,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        'Response',
                        style: whiteTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: bold,
                          color: compareColor,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(CupertinoIcons.heart_fill,
                          color: compareColor, size: 20),
                      const SizedBox(width: 5),
                      Text(
                        '3',
                        style: whiteTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: bold,
                          color: compareColor,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        'Likes',
                        style: whiteTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: bold,
                          color: compareColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: defaultSpace / 2),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultSpace),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Best Counter-Depth Refrigerator​s: ',
                        style: blackTextStyle.copyWith(
                          fontSize: 20,
                          fontWeight: bold,
                        ),
                      ),
                      TextSpan(
                        text:
                            '8 Champs & 3 Wannabes — Counter-Depth or Counter-Drama??',
                        style: blackTextStyle.copyWith(
                          fontSize: 20,
                          fontWeight: regular,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: defaultSpace / 2),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultSpace),
                child: Text(
                  'Fits perfectly in your space, while keeping your kitchen stylish and organized.',
                  style: blackTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: regular,
                    color: blackColor.withOpacity(0.6),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: defaultSpace / 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(15),
                        width: 55,
                        height: 55,
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            image: NetworkImage(
                                'https://www.rankcdn.com/cdn-cgi/image/quality=90,onerror=redirect,format=webp,fit=cover,width=100/techspotr.com/andhi-about-image.jpg'),
                            fit: BoxFit.cover,
                          ),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: thirdtyColor,
                            width: 5,
                            strokeAlign: BorderSide.strokeAlignOutside,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        child: Container(
                          width: 85,
                          height: 20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: compareColor,
                          ),
                          child: Center(
                            child: Text(
                              'Supermod',
                              style: whiteTextStyle.copyWith(
                                fontSize: 14,
                                fontWeight: bold,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(15),
                        width: 55,
                        height: 55,
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            image: NetworkImage(
                                'https://www.rankcdn.com/cdn-cgi/image/quality 85,onerror=redirect,format=webp,fit=cover,width=100/techspotr.com/maya-about-img-2.PNG'),
                            fit: BoxFit.cover,
                          ),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: thirdtyColor,
                            width: 5,
                            strokeAlign: BorderSide.strokeAlignOutside,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        child: Container(
                          width: 85,
                          height: 20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: compareColor,
                          ),
                          child: Center(
                            child: Text(
                              'Editor',
                              style: whiteTextStyle.copyWith(
                                fontSize: 14,
                                fontWeight: bold,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(15),
                        width: 55,
                        height: 55,
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            image: NetworkImage(
                                'https://www.rankcdn.com/cdn-cgi/image/quality 85,onerror=redirect,format=webp,fit=cover,width=100/techspotr.com/iqbal-about-img.PNG'),
                            fit: BoxFit.cover,
                          ),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: thirdtyColor,
                            width: 5,
                            strokeAlign: BorderSide.strokeAlignOutside,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        child: Container(
                          width: 85,
                          height: 20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: compareColor,
                          ),
                          child: Center(
                            child: Text(
                              'Moderator',
                              style: whiteTextStyle.copyWith(
                                fontSize: 14,
                                fontWeight: bold,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(height: defaultSpace),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultSpace),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(
                          top: 5, bottom: 5, right: 10, left: 5),
                      decoration: BoxDecoration(
                        color: thirdtyColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.arrow_drop_down_circle_sharp,
                            color: whiteColor,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            'What\'s the deal ?',
                            style: whiteTextStyle.copyWith(
                              fontSize: 14,
                              fontWeight: bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                          top: 5, bottom: 5, right: 10, left: 5),
                      decoration: BoxDecoration(
                        color: thirdtyColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.arrow_drop_down_circle_sharp,
                            color: whiteColor,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            'What\'s the deal ?',
                            style: whiteTextStyle.copyWith(
                              fontSize: 14,
                              fontWeight: bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: defaultSpace),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultSpace),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    imageUrl:
                        'https://www.rankcdn.com/cdn-cgi/image/quality=90,onerror=redirect,format=webp,fit=cover,width=1000/techspotr.com/photo-1668910231038-e342ad670789.avif',
                    width: double.infinity,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Shimmer.fromColors(
                      baseColor: secondaryColor,
                      highlightColor: thirdtyColor,
                      child: const ShimmerPerProfile(),
                    ),
                    errorWidget: (context, url, error) => Image.network(
                      'https://icons.veryicon.com/png/o/business/new-vision-2/picture-loading-failed-1.png',
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: defaultSpace * 2),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultSpace),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'What\'s the Deal?',
                      style: blackTextStyle.copyWith(
                        fontSize: 20,
                        fontWeight: bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'Quick lowdown, no fluff.',
                      style: blackTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: regular,
                        color: blackColor.withOpacity(0.6),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: defaultSpace),
                    Text(
                      'Tired of your fridge sticking out like a sore thumb? Counter-depth models are the perfect solution. While standard refrigerators take up more space, counter-depth ones give your kitchen a cleaner look and stay aesthetic. No more drama. This fridge will fit seamlessly into the space under your kitchen countertop.\n\nMost counter-depth fridges come with a slightly higher price tag than standard fridges, but they\'re totally worth it with their built-in look that gives ✨main character energy ✨\n\nSo, ready to glow up your kitchen? We’ve got 10 counter-depth fridges lined up—pick your fave now!',
                      style: blackTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: regular,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: defaultSpace * 2),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultSpace),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'How’d We Pick ‘Em?',
                      style: blackTextStyle.copyWith(
                        fontSize: 20,
                        fontWeight: bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'Our not-so-secret sauce, spilled.',
                      style: blackTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: regular,
                        color: blackColor.withOpacity(0.6),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: defaultSpace / 2),
                    const HowWePickSteps(),
                  ],
                ),
              ),
              const SizedBox(height: defaultSpace * 2),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultSpace),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Too Lazy to Scroll?',
                      style: blackTextStyle.copyWith(
                        fontSize: 20,
                        fontWeight: bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'Here’s the Cheat Sheet!',
                      style: blackTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: regular,
                        color: blackColor.withOpacity(0.6),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: defaultSpace),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                controller: horizontalScrollController,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: defaultSpace / 2,
                  ),
                  decoration: BoxDecoration(
                    color: thirdtyColor,
                    border: Border(
                      bottom: BorderSide(
                        color: whiteColor,
                        width: 0.1,
                      ),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              RotatedBox(
                                quarterTurns: 3,
                                child: Text(
                                  'NO',
                                  style: whiteTextStyle.copyWith(
                                    fontWeight: extrabold,
                                    fontSize: 20,
                                    letterSpacing: 2,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 120),
                              RotatedBox(
                                quarterTurns: 3,
                                child: Text(
                                  'NAME',
                                  style: whiteTextStyle.copyWith(
                                    fontWeight: extrabold,
                                    fontSize: 20,
                                    letterSpacing: 2,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: defaultSpace / 2),
                          Container(
                            width: 0.1,
                            height: 350,
                            color: whiteColor,
                          ),
                          const SizedBox(width: defaultSpace / 2),
                          SizedBox(
                            width: 140,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 42,
                                  height: 42,
                                  decoration: BoxDecoration(
                                    color: compareColor,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: blackColor.withOpacity(0.3),
                                        width: 5,
                                        strokeAlign:
                                            BorderSide.strokeAlignInside),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '1',
                                      style: whiteTextStyle.copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: defaultSpace / 2),
                                CachedNetworkImage(
                                  imageUrl:
                                      'https://www.rankcdn.com/cdn-cgi/image/quality=90,onerror=redirect,format=webp,fit=cover,width=500/techspotr.com/frigidaire-grmc2273cd-2.png',
                                  width: 120,
                                  height: 120,
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
                                    width: 120,
                                    height: 120,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(height: defaultSpace / 2),
                                Text(
                                  '90 Scores',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: defaultSpace / 2),
                                Row(
                                  children: [
                                    ClipOval(
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            'https://www.rankcdn.com/cdn-cgi/image/quality=90,onerror=redirect,format=webp,fit=cover,width=400/techspotr.com/frigidaire-logo.png',
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
                                      'Frigidaire',
                                      style: whiteTextStyle.copyWith(
                                        fontSize: 18,
                                        fontWeight: extrabold,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: defaultSpace / 2),
                                SizedBox(
                                  width:
                                      120, // set width to constrain text wrapping
                                  child: Text(
                                    'Frigidaire GRMC2273CD',
                                    style: whiteTextStyle.copyWith(
                                      fontSize: 16,
                                      fontWeight: bold,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: defaultSpace / 2),
                          Container(
                            width: 0.1,
                            height: 350,
                            color: whiteColor,
                          ),
                          const SizedBox(width: defaultSpace / 2),
                          SizedBox(
                            width: 140,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 42,
                                  height: 42,
                                  decoration: BoxDecoration(
                                    color: compareColor,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: blackColor.withOpacity(0.3),
                                      width: 5,
                                      strokeAlign: BorderSide.strokeAlignInside,
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '2',
                                      style: whiteTextStyle.copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: defaultSpace / 2),
                                CachedNetworkImage(
                                  imageUrl:
                                      'https://www.rankcdn.com/cdn-cgi/image/quality=90,onerror=redirect,format=webp,fit=cover,width=500/techspotr.com/frigidaire-grmc2273cd-2.png',
                                  width: 120,
                                  height: 120,
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
                                    width: 120,
                                    height: 120,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(height: defaultSpace / 2),
                                Text(
                                  '90 Scores',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: defaultSpace / 2),
                                Row(
                                  children: [
                                    ClipOval(
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            'https://www.rankcdn.com/cdn-cgi/image/quality=90,onerror=redirect,format=webp,fit=cover,width=400/techspotr.com/frigidaire-logo.png',
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
                                      'Frigidaire',
                                      style: whiteTextStyle.copyWith(
                                        fontSize: 18,
                                        fontWeight: extrabold,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: defaultSpace / 2),
                                SizedBox(
                                  width:
                                      120, // set width to constrain text wrapping
                                  child: Text(
                                    'Frigidaire GRMC2273CD',
                                    style: whiteTextStyle.copyWith(
                                      fontSize: 16,
                                      fontWeight: bold,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: defaultSpace / 2),
                          Container(
                            width: 0.1,
                            height: 350,
                            color: whiteColor,
                          ),
                          const SizedBox(width: defaultSpace / 2),
                          SizedBox(
                            width: 140,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 42,
                                  height: 42,
                                  decoration: BoxDecoration(
                                    color: compareColor,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: blackColor.withOpacity(0.3),
                                      width: 5,
                                      strokeAlign: BorderSide.strokeAlignInside,
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '3',
                                      style: whiteTextStyle.copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: defaultSpace / 2),
                                CachedNetworkImage(
                                  imageUrl:
                                      'https://www.rankcdn.com/cdn-cgi/image/quality=90,onerror=redirect,format=webp,fit=cover,width=500/techspotr.com/frigidaire-grmc2273cd-2.png',
                                  width: 120,
                                  height: 120,
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
                                    width: 120,
                                    height: 120,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(height: defaultSpace / 2),
                                Text(
                                  '90 Scores',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: defaultSpace / 2),
                                Row(
                                  children: [
                                    ClipOval(
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            'https://www.rankcdn.com/cdn-cgi/image/quality=90,onerror=redirect,format=webp,fit=cover,width=400/techspotr.com/frigidaire-logo.png',
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
                                      'Frigidaire',
                                      style: whiteTextStyle.copyWith(
                                        fontSize: 18,
                                        fontWeight: extrabold,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: defaultSpace / 2),
                                SizedBox(
                                  width:
                                      120, // set width to constrain text wrapping
                                  child: Text(
                                    'Frigidaire GRMC2273CD',
                                    style: whiteTextStyle.copyWith(
                                      fontSize: 16,
                                      fontWeight: bold,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: defaultSpace / 2),
                          Container(
                            width: 0.1,
                            height: 350,
                            color: whiteColor,
                          ),
                          const SizedBox(width: defaultSpace / 2),
                          SizedBox(
                            width: 140,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 42,
                                  height: 42,
                                  decoration: BoxDecoration(
                                    color: compareColor,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: blackColor.withOpacity(0.3),
                                      width: 5,
                                      strokeAlign: BorderSide.strokeAlignInside,
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '4',
                                      style: whiteTextStyle.copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: defaultSpace / 2),
                                CachedNetworkImage(
                                  imageUrl:
                                      'https://www.rankcdn.com/cdn-cgi/image/quality=90,onerror=redirect,format=webp,fit=cover,width=500/techspotr.com/frigidaire-grmc2273cd-2.png',
                                  width: 120,
                                  height: 120,
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
                                    width: 120,
                                    height: 120,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(height: defaultSpace / 2),
                                Text(
                                  '90 Scores',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: defaultSpace / 2),
                                Row(
                                  children: [
                                    ClipOval(
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            'https://www.rankcdn.com/cdn-cgi/image/quality=90,onerror=redirect,format=webp,fit=cover,width=400/techspotr.com/frigidaire-logo.png',
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
                                      'Frigidaire',
                                      style: whiteTextStyle.copyWith(
                                        fontSize: 18,
                                        fontWeight: extrabold,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: defaultSpace / 2),
                                SizedBox(
                                  width:
                                      120, // set width to constrain text wrapping
                                  child: Text(
                                    'Frigidaire GRMC2273CD',
                                    style: whiteTextStyle.copyWith(
                                      fontSize: 16,
                                      fontWeight: bold,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              RotatedBox(
                                quarterTurns: 3,
                                child: Text(
                                  'RATINGS',
                                  style: whiteTextStyle.copyWith(
                                    fontWeight: extrabold,
                                    fontSize: 20,
                                    letterSpacing: 2,
                                  ),
                                ),
                              ),
                              const SizedBox(height: defaultSpace * 2),
                              RotatedBox(
                                quarterTurns: 3,
                                child: Text(
                                  'HIGHLIGHTS',
                                  style: whiteTextStyle.copyWith(
                                    fontWeight: extrabold,
                                    fontSize: 20,
                                    letterSpacing: 2,
                                  ),
                                ),
                              ),
                              const SizedBox(height: defaultSpace * 2),
                              RotatedBox(
                                quarterTurns: 3,
                                child: Text(
                                  'SPECS',
                                  style: whiteTextStyle.copyWith(
                                    fontWeight: extrabold,
                                    fontSize: 20,
                                    letterSpacing: 2,
                                  ),
                                ),
                              ),
                              const SizedBox(height: defaultSpace),
                            ],
                          ),
                          const SizedBox(width: defaultSpace / 2),
                          Container(
                            width: 0.1,
                            height: 1380,
                            color: whiteColor,
                          ),
                          const SizedBox(width: defaultSpace / 2),
                          SizedBox(
                            width: 140,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(height: defaultSpace),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        color: compareColor,
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(
                                        CupertinoIcons.smiley_fill,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                    ),
                                    const SizedBox(width: defaultSpace / 2),
                                    Text(
                                      '5',
                                      style: whiteTextStyle.copyWith(
                                        fontSize: 26,
                                        fontWeight: bold,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: defaultSpace / 2),
                                Text(
                                  '2 REVIEWS',
                                  style: whiteTextStyle.copyWith(
                                      fontSize: 16,
                                      fontWeight: bold,
                                      color: whiteColor.withOpacity(0.8)),
                                ),
                                const SizedBox(height: defaultSpace * 4.5),
                                SvgPicture.string(
                                  AppSvg.petikAtas,
                                  width: 25,
                                  color: whiteColor.withOpacity(0.3),
                                ),
                                Text(
                                  'Best Overall',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 24,
                                    fontWeight: extrabold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SvgPicture.string(
                                  AppSvg.petikBawah,
                                  width: 25,
                                  color: whiteColor.withOpacity(0.3),
                                ),
                                const SizedBox(height: defaultSpace * 4),
                                Text(
                                  'Refrigerator Type',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: bold,
                                    color: whiteColor.withOpacity(0.8),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  '92 Score',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 20,
                                    fontWeight: extrabold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  'French Door',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: defaultSpace * 2),
                                Text(
                                  'Number of Doors',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: bold,
                                    color: whiteColor.withOpacity(0.8),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  '75 Score',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 20,
                                    fontWeight: extrabold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  '4',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: defaultSpace * 2),
                                Text(
                                  'Height with Hinge',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: bold,
                                    color: whiteColor.withOpacity(0.8),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  '?',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 20,
                                    fontWeight: extrabold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  'N/A',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: defaultSpace * 2),
                                Text(
                                  'Depth without Handles',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: bold,
                                    color: whiteColor.withOpacity(0.8),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  '?',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 20,
                                    fontWeight: extrabold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  'N/A',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: defaultSpace * 2),
                                Text(
                                  'Width',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: bold,
                                    color: whiteColor.withOpacity(0.8),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                LinearPercentIndicator(
                                  animation: true,
                                  lineHeight: 10,
                                  animationDuration: 1000,
                                  percent: 0.8,
                                  progressColor: compareColor,
                                  backgroundColor: blackColor.withOpacity(0.2),
                                  barRadius: const Radius.circular(100),
                                ),
                                Text(
                                  '38.7',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 20,
                                    fontWeight: extrabold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  'INCH',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: defaultSpace * 2),
                                Text(
                                  'Depth with Door',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: bold,
                                    color: whiteColor.withOpacity(0.8),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  '?',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 20,
                                    fontWeight: extrabold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  'N/A',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: defaultSpace * 2),
                                Text(
                                  'Total Capacity',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: bold,
                                    color: whiteColor.withOpacity(0.8),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                LinearPercentIndicator(
                                  animation: true,
                                  lineHeight: 10,
                                  animationDuration: 1000,
                                  percent: 0.8,
                                  progressColor: compareColor,
                                  backgroundColor: blackColor.withOpacity(0.2),
                                  barRadius: const Radius.circular(100),
                                ),
                                Text(
                                  '28.6',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 20,
                                    fontWeight: extrabold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  'CU. FT',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: defaultSpace * 2),
                                Text(
                                  'Noise Level',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: bold,
                                    color: whiteColor.withOpacity(0.8),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                LinearPercentIndicator(
                                  animation: true,
                                  lineHeight: 10,
                                  animationDuration: 1000,
                                  percent: 0.8,
                                  progressColor: compareColor,
                                  backgroundColor: blackColor.withOpacity(0.2),
                                  barRadius: const Radius.circular(100),
                                ),
                                Text(
                                  '37',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 20,
                                    fontWeight: extrabold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  'DB',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: defaultSpace * 2),
                                Text(
                                  'Energy Consumption',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: bold,
                                    color: whiteColor.withOpacity(0.8),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                LinearPercentIndicator(
                                  animation: true,
                                  lineHeight: 10,
                                  animationDuration: 1000,
                                  percent: 0.8,
                                  progressColor: compareColor,
                                  backgroundColor: blackColor.withOpacity(0.2),
                                  barRadius: const Radius.circular(100),
                                ),
                                Text(
                                  '698',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 20,
                                    fontWeight: extrabold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  'kWh/year',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: defaultSpace * 2),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: defaultSpace,
                                    vertical: defaultSpace / 2,
                                  ),
                                  decoration: BoxDecoration(
                                    color: compareColor,
                                    borderRadius: BorderRadius.circular(60),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'See More Specs',
                                      style: whiteTextStyle.copyWith(
                                        fontSize: 14,
                                        fontWeight: bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: defaultSpace / 2),
                          Container(
                            width: 0.1,
                            height: 1380,
                            color: whiteColor,
                          ),
                          const SizedBox(width: defaultSpace / 2),
                          SizedBox(
                            width: 140,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(height: defaultSpace),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        color: compareColor,
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(
                                        CupertinoIcons.smiley_fill,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                    ),
                                    const SizedBox(width: defaultSpace / 2),
                                    Text(
                                      '5',
                                      style: whiteTextStyle.copyWith(
                                        fontSize: 26,
                                        fontWeight: bold,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: defaultSpace / 2),
                                Text(
                                  '2 REVIEWS',
                                  style: whiteTextStyle.copyWith(
                                      fontSize: 16,
                                      fontWeight: bold,
                                      color: whiteColor.withOpacity(0.8)),
                                ),
                                const SizedBox(height: defaultSpace * 4.5),
                                SvgPicture.string(
                                  AppSvg.petikAtas,
                                  width: 25,
                                  color: whiteColor.withOpacity(0.3),
                                ),
                                Text(
                                  'Best Overall',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 24,
                                    fontWeight: extrabold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SvgPicture.string(
                                  AppSvg.petikBawah,
                                  width: 25,
                                  color: whiteColor.withOpacity(0.3),
                                ),
                                const SizedBox(height: defaultSpace * 4),
                                Text(
                                  'Refrigerator Type',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: bold,
                                    color: whiteColor.withOpacity(0.8),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  '92 Score',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 20,
                                    fontWeight: extrabold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  'French Door',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: defaultSpace * 2),
                                Text(
                                  'Number of Doors',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: bold,
                                    color: whiteColor.withOpacity(0.8),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  '75 Score',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 20,
                                    fontWeight: extrabold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  '4',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: defaultSpace * 2),
                                Text(
                                  'Height with Hinge',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: bold,
                                    color: whiteColor.withOpacity(0.8),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  '?',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 20,
                                    fontWeight: extrabold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  'N/A',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: defaultSpace * 2),
                                Text(
                                  'Depth without Handles',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: bold,
                                    color: whiteColor.withOpacity(0.8),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  '?',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 20,
                                    fontWeight: extrabold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  'N/A',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: defaultSpace * 2),
                                Text(
                                  'Width',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: bold,
                                    color: whiteColor.withOpacity(0.8),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                LinearPercentIndicator(
                                  animation: true,
                                  lineHeight: 10,
                                  animationDuration: 1000,
                                  percent: 0.8,
                                  progressColor: compareColor,
                                  backgroundColor: blackColor.withOpacity(0.2),
                                  barRadius: const Radius.circular(100),
                                ),
                                Text(
                                  '38.7',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 20,
                                    fontWeight: extrabold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  'INCH',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: defaultSpace * 2),
                                Text(
                                  'Depth with Door',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: bold,
                                    color: whiteColor.withOpacity(0.8),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  '?',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 20,
                                    fontWeight: extrabold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  'N/A',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: defaultSpace * 2),
                                Text(
                                  'Total Capacity',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: bold,
                                    color: whiteColor.withOpacity(0.8),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                LinearPercentIndicator(
                                  animation: true,
                                  lineHeight: 10,
                                  animationDuration: 1000,
                                  percent: 0.8,
                                  progressColor: compareColor,
                                  backgroundColor: blackColor.withOpacity(0.2),
                                  barRadius: const Radius.circular(100),
                                ),
                                Text(
                                  '28.6',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 20,
                                    fontWeight: extrabold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  'CU. FT',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: defaultSpace * 2),
                                Text(
                                  'Noise Level',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: bold,
                                    color: whiteColor.withOpacity(0.8),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                LinearPercentIndicator(
                                  animation: true,
                                  lineHeight: 10,
                                  animationDuration: 1000,
                                  percent: 0.8,
                                  progressColor: compareColor,
                                  backgroundColor: blackColor.withOpacity(0.2),
                                  barRadius: const Radius.circular(100),
                                ),
                                Text(
                                  '37',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 20,
                                    fontWeight: extrabold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  'DB',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: defaultSpace * 2),
                                Text(
                                  'Energy Consumption',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: bold,
                                    color: whiteColor.withOpacity(0.8),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                LinearPercentIndicator(
                                  animation: true,
                                  lineHeight: 10,
                                  animationDuration: 1000,
                                  percent: 0.8,
                                  progressColor: compareColor,
                                  backgroundColor: blackColor.withOpacity(0.2),
                                  barRadius: const Radius.circular(100),
                                ),
                                Text(
                                  '698',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 20,
                                    fontWeight: extrabold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  'kWh/year',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: defaultSpace * 2),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: defaultSpace,
                                    vertical: defaultSpace / 2,
                                  ),
                                  decoration: BoxDecoration(
                                    color: compareColor,
                                    borderRadius: BorderRadius.circular(60),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'See More Specs',
                                      style: whiteTextStyle.copyWith(
                                        fontSize: 14,
                                        fontWeight: bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: defaultSpace / 2),
                          Container(
                            width: 0.1,
                            height: 1380,
                            color: whiteColor,
                          ),
                          const SizedBox(width: defaultSpace / 2),
                          SizedBox(
                            width: 140,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(height: defaultSpace),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        color: compareColor,
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(
                                        CupertinoIcons.smiley_fill,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                    ),
                                    const SizedBox(width: defaultSpace / 2),
                                    Text(
                                      '5',
                                      style: whiteTextStyle.copyWith(
                                        fontSize: 26,
                                        fontWeight: bold,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: defaultSpace / 2),
                                Text(
                                  '2 REVIEWS',
                                  style: whiteTextStyle.copyWith(
                                      fontSize: 16,
                                      fontWeight: bold,
                                      color: whiteColor.withOpacity(0.8)),
                                ),
                                const SizedBox(height: defaultSpace * 4.5),
                                SvgPicture.string(
                                  AppSvg.petikAtas,
                                  width: 25,
                                  color: whiteColor.withOpacity(0.3),
                                ),
                                Text(
                                  'Best Overall',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 24,
                                    fontWeight: extrabold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SvgPicture.string(
                                  AppSvg.petikBawah,
                                  width: 25,
                                  color: whiteColor.withOpacity(0.3),
                                ),
                                const SizedBox(height: defaultSpace * 4),
                                Text(
                                  'Refrigerator Type',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: bold,
                                    color: whiteColor.withOpacity(0.8),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  '92 Score',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 20,
                                    fontWeight: extrabold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  'French Door',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: defaultSpace * 2),
                                Text(
                                  'Number of Doors',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: bold,
                                    color: whiteColor.withOpacity(0.8),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  '75 Score',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 20,
                                    fontWeight: extrabold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  '4',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: defaultSpace * 2),
                                Text(
                                  'Height with Hinge',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: bold,
                                    color: whiteColor.withOpacity(0.8),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  '?',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 20,
                                    fontWeight: extrabold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  'N/A',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: defaultSpace * 2),
                                Text(
                                  'Depth without Handles',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: bold,
                                    color: whiteColor.withOpacity(0.8),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  '?',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 20,
                                    fontWeight: extrabold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  'N/A',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: defaultSpace * 2),
                                Text(
                                  'Width',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: bold,
                                    color: whiteColor.withOpacity(0.8),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                LinearPercentIndicator(
                                  animation: true,
                                  lineHeight: 10,
                                  animationDuration: 1000,
                                  percent: 0.8,
                                  progressColor: compareColor,
                                  backgroundColor: blackColor.withOpacity(0.2),
                                  barRadius: const Radius.circular(100),
                                ),
                                Text(
                                  '38.7',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 20,
                                    fontWeight: extrabold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  'INCH',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: defaultSpace * 2),
                                Text(
                                  'Depth with Door',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: bold,
                                    color: whiteColor.withOpacity(0.8),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  '?',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 20,
                                    fontWeight: extrabold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  'N/A',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: defaultSpace * 2),
                                Text(
                                  'Total Capacity',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: bold,
                                    color: whiteColor.withOpacity(0.8),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                LinearPercentIndicator(
                                  animation: true,
                                  lineHeight: 10,
                                  animationDuration: 1000,
                                  percent: 0.8,
                                  progressColor: compareColor,
                                  backgroundColor: blackColor.withOpacity(0.2),
                                  barRadius: const Radius.circular(100),
                                ),
                                Text(
                                  '28.6',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 20,
                                    fontWeight: extrabold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  'CU. FT',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: defaultSpace * 2),
                                Text(
                                  'Noise Level',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: bold,
                                    color: whiteColor.withOpacity(0.8),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                LinearPercentIndicator(
                                  animation: true,
                                  lineHeight: 10,
                                  animationDuration: 1000,
                                  percent: 0.8,
                                  progressColor: compareColor,
                                  backgroundColor: blackColor.withOpacity(0.2),
                                  barRadius: const Radius.circular(100),
                                ),
                                Text(
                                  '37',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 20,
                                    fontWeight: extrabold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  'DB',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: defaultSpace * 2),
                                Text(
                                  'Energy Consumption',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: bold,
                                    color: whiteColor.withOpacity(0.8),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                LinearPercentIndicator(
                                  animation: true,
                                  lineHeight: 10,
                                  animationDuration: 1000,
                                  percent: 0.8,
                                  progressColor: compareColor,
                                  backgroundColor: blackColor.withOpacity(0.2),
                                  barRadius: const Radius.circular(100),
                                ),
                                Text(
                                  '698',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 20,
                                    fontWeight: extrabold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  'kWh/year',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: defaultSpace * 2),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: defaultSpace,
                                    vertical: defaultSpace / 2,
                                  ),
                                  decoration: BoxDecoration(
                                    color: compareColor,
                                    borderRadius: BorderRadius.circular(60),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'See More Specs',
                                      style: whiteTextStyle.copyWith(
                                        fontSize: 14,
                                        fontWeight: bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: defaultSpace / 2),
                          Container(
                            width: 0.1,
                            height: 1380,
                            color: whiteColor,
                          ),
                          const SizedBox(width: defaultSpace / 2),
                          SizedBox(
                            width: 140,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(height: defaultSpace),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        color: compareColor,
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(
                                        CupertinoIcons.smiley_fill,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                    ),
                                    const SizedBox(width: defaultSpace / 2),
                                    Text(
                                      '5',
                                      style: whiteTextStyle.copyWith(
                                        fontSize: 26,
                                        fontWeight: bold,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: defaultSpace / 2),
                                Text(
                                  '2 REVIEWS',
                                  style: whiteTextStyle.copyWith(
                                      fontSize: 16,
                                      fontWeight: bold,
                                      color: whiteColor.withOpacity(0.8)),
                                ),
                                const SizedBox(height: defaultSpace * 4.5),
                                SvgPicture.string(
                                  AppSvg.petikAtas,
                                  width: 25,
                                  color: whiteColor.withOpacity(0.3),
                                ),
                                Text(
                                  'Best Overall',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 24,
                                    fontWeight: extrabold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SvgPicture.string(
                                  AppSvg.petikBawah,
                                  width: 25,
                                  color: whiteColor.withOpacity(0.3),
                                ),
                                const SizedBox(height: defaultSpace * 4),
                                Text(
                                  'Refrigerator Type',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: bold,
                                    color: whiteColor.withOpacity(0.8),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  '92 Score',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 20,
                                    fontWeight: extrabold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  'French Door',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: defaultSpace * 2),
                                Text(
                                  'Number of Doors',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: bold,
                                    color: whiteColor.withOpacity(0.8),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  '75 Score',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 20,
                                    fontWeight: extrabold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  '4',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: defaultSpace * 2),
                                Text(
                                  'Height with Hinge',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: bold,
                                    color: whiteColor.withOpacity(0.8),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  '?',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 20,
                                    fontWeight: extrabold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  'N/A',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: defaultSpace * 2),
                                Text(
                                  'Depth without Handles',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: bold,
                                    color: whiteColor.withOpacity(0.8),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  '?',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 20,
                                    fontWeight: extrabold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  'N/A',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: defaultSpace * 2),
                                Text(
                                  'Width',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: bold,
                                    color: whiteColor.withOpacity(0.8),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                LinearPercentIndicator(
                                  animation: true,
                                  lineHeight: 10,
                                  animationDuration: 1000,
                                  percent: 0.8,
                                  progressColor: compareColor,
                                  backgroundColor: blackColor.withOpacity(0.2),
                                  barRadius: const Radius.circular(100),
                                ),
                                Text(
                                  '38.7',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 20,
                                    fontWeight: extrabold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  'INCH',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: defaultSpace * 2),
                                Text(
                                  'Depth with Door',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: bold,
                                    color: whiteColor.withOpacity(0.8),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  '?',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 20,
                                    fontWeight: extrabold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  'N/A',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: defaultSpace * 2),
                                Text(
                                  'Total Capacity',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: bold,
                                    color: whiteColor.withOpacity(0.8),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                LinearPercentIndicator(
                                  animation: true,
                                  lineHeight: 10,
                                  animationDuration: 1000,
                                  percent: 0.8,
                                  progressColor: compareColor,
                                  backgroundColor: blackColor.withOpacity(0.2),
                                  barRadius: const Radius.circular(100),
                                ),
                                Text(
                                  '28.6',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 20,
                                    fontWeight: extrabold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  'CU. FT',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: defaultSpace * 2),
                                Text(
                                  'Noise Level',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: bold,
                                    color: whiteColor.withOpacity(0.8),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                LinearPercentIndicator(
                                  animation: true,
                                  lineHeight: 10,
                                  animationDuration: 1000,
                                  percent: 0.8,
                                  progressColor: compareColor,
                                  backgroundColor: blackColor.withOpacity(0.2),
                                  barRadius: const Radius.circular(100),
                                ),
                                Text(
                                  '37',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 20,
                                    fontWeight: extrabold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  'DB',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: defaultSpace * 2),
                                Text(
                                  'Energy Consumption',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: bold,
                                    color: whiteColor.withOpacity(0.8),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                LinearPercentIndicator(
                                  animation: true,
                                  lineHeight: 10,
                                  animationDuration: 1000,
                                  percent: 0.8,
                                  progressColor: compareColor,
                                  backgroundColor: blackColor.withOpacity(0.2),
                                  barRadius: const Radius.circular(100),
                                ),
                                Text(
                                  '698',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 20,
                                    fontWeight: extrabold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  'kWh/year',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: defaultSpace * 2),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: defaultSpace,
                                    vertical: defaultSpace / 2,
                                  ),
                                  decoration: BoxDecoration(
                                    color: compareColor,
                                    borderRadius: BorderRadius.circular(60),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'See More Specs',
                                      style: whiteTextStyle.copyWith(
                                        fontSize: 14,
                                        fontWeight: bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              RotatedBox(
                                quarterTurns: 3,
                                child: Text(
                                  'PRICES',
                                  style: whiteTextStyle.copyWith(
                                    fontWeight: extrabold,
                                    fontSize: 20,
                                    letterSpacing: 2,
                                  ),
                                ),
                              ),
                              const SizedBox(height: defaultSpace),
                            ],
                          ),
                          const SizedBox(width: defaultSpace / 2),
                          Container(
                            width: 0.1,
                            height: 160,
                            color: whiteColor,
                          ),
                          const SizedBox(width: defaultSpace / 2),
                          SizedBox(
                            width: 140,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                StoreButton(
                                  logoUrl:
                                      'https://t3.gstatic.com/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&url=http://www.samsung.com&size=128',
                                  price: 3783,
                                  currency: '\$',
                                  onTap: () async {},
                                  mainColor: compareColor,
                                  textColor: whiteColor,
                                ),
                                const SizedBox(height: defaultSpace),
                                StoreButton(
                                  logoUrl:
                                      'https://t3.gstatic.com/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&url=http://www.samsung.com&size=128',
                                  price: 3783,
                                  currency: '\$',
                                  onTap: () async {},
                                  mainColor: compareColor,
                                  textColor: whiteColor,
                                ),
                                const SizedBox(height: defaultSpace),
                                StoreButton(
                                  logoUrl:
                                      'https://t3.gstatic.com/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&url=http://www.samsung.com&size=128',
                                  price: 3783,
                                  currency: '\$',
                                  onTap: () async {},
                                  mainColor: compareColor,
                                  textColor: whiteColor,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: defaultSpace / 2),
                          Container(
                            width: 0.1,
                            height: 160,
                            color: whiteColor,
                          ),
                          const SizedBox(width: defaultSpace / 2),
                          SizedBox(
                            width: 140,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                StoreButton(
                                  logoUrl:
                                      'https://t3.gstatic.com/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&url=http://www.samsung.com&size=128',
                                  price: 3783,
                                  currency: '\$',
                                  onTap: () async {},
                                  mainColor: compareColor,
                                  textColor: whiteColor,
                                ),
                                const SizedBox(height: defaultSpace),
                                StoreButton(
                                  logoUrl:
                                      'https://t3.gstatic.com/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&url=http://www.samsung.com&size=128',
                                  price: 3783,
                                  currency: '\$',
                                  onTap: () async {},
                                  mainColor: compareColor,
                                  textColor: whiteColor,
                                ),
                                const SizedBox(height: defaultSpace),
                                StoreButton(
                                  logoUrl:
                                      'https://t3.gstatic.com/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&url=http://www.samsung.com&size=128',
                                  price: 3783,
                                  currency: '\$',
                                  onTap: () async {},
                                  mainColor: compareColor,
                                  textColor: whiteColor,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: defaultSpace / 2),
                          Container(
                            width: 0.1,
                            height: 160,
                            color: whiteColor,
                          ),
                          const SizedBox(width: defaultSpace / 2),
                          SizedBox(
                            width: 140,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                StoreButton(
                                  logoUrl:
                                      'https://t3.gstatic.com/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&url=http://www.samsung.com&size=128',
                                  price: 3783,
                                  currency: '\$',
                                  onTap: () async {},
                                  mainColor: compareColor,
                                  textColor: whiteColor,
                                ),
                                const SizedBox(height: defaultSpace),
                                StoreButton(
                                  logoUrl:
                                      'https://t3.gstatic.com/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&url=http://www.samsung.com&size=128',
                                  price: 3783,
                                  currency: '\$',
                                  onTap: () async {},
                                  mainColor: compareColor,
                                  textColor: whiteColor,
                                ),
                                const SizedBox(height: defaultSpace),
                                StoreButton(
                                  logoUrl:
                                      'https://t3.gstatic.com/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&url=http://www.samsung.com&size=128',
                                  price: 3783,
                                  currency: '\$',
                                  onTap: () async {},
                                  mainColor: compareColor,
                                  textColor: whiteColor,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: defaultSpace / 2),
                          Container(
                            width: 0.1,
                            height: 160,
                            color: whiteColor,
                          ),
                          const SizedBox(width: defaultSpace / 2),
                          SizedBox(
                            width: 140,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                StoreButton(
                                  logoUrl:
                                      'https://t3.gstatic.com/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&url=http://www.samsung.com&size=128',
                                  price: 3783,
                                  currency: '\$',
                                  onTap: () async {},
                                  mainColor: compareColor,
                                  textColor: whiteColor,
                                ),
                                const SizedBox(height: defaultSpace),
                                StoreButton(
                                  logoUrl:
                                      'https://t3.gstatic.com/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&url=http://www.samsung.com&size=128',
                                  price: 3783,
                                  currency: '\$',
                                  onTap: () async {},
                                  mainColor: compareColor,
                                  textColor: whiteColor,
                                ),
                                const SizedBox(height: defaultSpace),
                                StoreButton(
                                  logoUrl:
                                      'https://t3.gstatic.com/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&url=http://www.samsung.com&size=128',
                                  price: 3783,
                                  currency: '\$',
                                  onTap: () async {},
                                  mainColor: compareColor,
                                  textColor: whiteColor,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: defaultSpace),
              Text(
                'Hall of Fame Finds',
                style: blackTextStyle.copyWith(
                  fontSize: 20,
                  fontWeight: bold,
                ),
              ),
              Text(
                'Legendary champs that deserve a spotlight.',
                style: blackTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: bold,
                  color: blackColor.withOpacity(0.6),
                ),
              ),
              const SizedBox(height: defaultSpace),
              AwardSingleDetailWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _menuTile(String title, String subtitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 18, vertical: 0),
          title: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
              fontSize: 16,
            ),
          ),
          subtitle: Text(
            subtitle,
            style: TextStyle(
              color: Colors.white.withOpacity(0.85),
              fontSize: 13,
            ),
          ),
          onTap: () {
            // Add your navigation or logic here
          },
        ),
        Divider(color: Colors.white24, height: 1, thickness: 1),
      ],
    );
  }
}

class HowWePickStepsController extends GetxController {
  var expandedIndex = RxnInt();
}

class HowWePickSteps extends StatelessWidget {
  final steps = const [
    {
      "title": "Prioritize Depth and Fit",
      "desc":
          "Counter-depth refrigerators are designed to save space and blend seamlessly into your kitchen. That's why we focus on models that sit perfectly with your countertops and cabinets, so no more bulky fridges sticking out.",
    },
    {
      "title": "Consider Features and Budget",
      "desc":
          "We look at features like ice makers, smart tech, and price to make sure you get the best bang for your buck—without sacrificing style or function.",
    },
  ];

  const HowWePickSteps({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HowWePickStepsController());
    return Obx(
      () => Column(
        children: List.generate(
          steps.length,
          (i) {
            final isExpanded = controller.expandedIndex.value == i;
            return Column(
              children: [
                InkWell(
                  onTap: () {
                    controller.expandedIndex.value = isExpanded ? null : i;
                  },
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Circle number
                        Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            color: thirdtyColor,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: thirdtyColor.withOpacity(0.4),
                              width: 2,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "${i + 1}",
                              style: whiteTextStyle.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        // Title and (optional) description
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      steps[i]["title"]!,
                                      style: blackTextStyle.copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                  Icon(
                                    isExpanded
                                        ? Icons.keyboard_arrow_down
                                        : Icons.keyboard_arrow_right,
                                    color: thirdtyColor,
                                    size: 28,
                                  ),
                                ],
                              ),
                              const SizedBox(height: defaultSpace / 2),
                              if (isExpanded)
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Text(
                                    steps[i]["desc"]!,
                                    style: blackTextStyle.copyWith(
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                if (i < steps.length - 1)
                  Divider(
                    color: thirdtyColor,
                    thickness: 0.5,
                    height: 16,
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
