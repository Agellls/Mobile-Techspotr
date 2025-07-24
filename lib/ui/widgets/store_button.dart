import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/shared/theme.dart';
import 'package:flutter_application_1/utilities/loading.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class StoreButtonController extends GetxController {
  final _value = 0.0.obs;

  void setPrice(double price) {
    _value.value = price;
  }
}

class StoreButton extends StatelessWidget {
  final String logoUrl;
  final double price;
  final String currency;
  final VoidCallback? onTap;
  final Color mainColor;
  final Color textColor;
  final StoreButtonController controller = StoreButtonController();

  StoreButton({
    super.key,
    required this.logoUrl,
    required this.price,
    required this.currency,
    this.onTap,
    this.mainColor = const Color(0xfff2f1f4),
    this.textColor = const Color(0xff000000),
  });

  @override
  Widget build(BuildContext context) {
    // Initialize the price value only once
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.setPrice(price);
    });

    return GestureDetector(
      onTap: onTap,
      child: IntrinsicWidth(
        child: Container(
          padding: const EdgeInsets.symmetric(
              horizontal: defaultSpace, vertical: defaultSpace / 2),
          decoration: BoxDecoration(
            color: mainColor,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipOval(
                child: CachedNetworkImage(
                  imageUrl: logoUrl,
                  width: 15,
                  height: 15,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Shimmer.fromColors(
                    baseColor: secondaryColor,
                    highlightColor: thirdtyColor,
                    child: const ShimmerPerProfile(),
                  ),
                  errorWidget: (context, url, error) => Image.network(
                    'https://icons.veryicon.com/png/o/business/new-vision-2/picture-loading-failed-1.png',
                    width: 15,
                    height: 15,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: defaultSpace / 2),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    currency,
                    style: blackTextStyle.copyWith(
                      fontWeight: bold,
                      fontSize: 12,
                      color: textColor,
                    ),
                  ),
                  Obx(
                    () => AnimatedFlipCounter(
                      value: controller._value.value,
                      duration: const Duration(milliseconds: 1500),
                      curve: Curves.easeInOut,
                      textStyle: blackTextStyle.copyWith(
                        fontWeight: bold,
                        fontSize: 12,
                        color: textColor,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
