import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/shared/theme.dart';

class ShimmerPerProfile extends StatelessWidget {
  final double width;
  final double height;
  const ShimmerPerProfile({
    super.key,
    this.width = 40,
    this.height = 40,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: secondaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(60),
      ),
      width: width,
      height: height,
    );
  }
}

class ShimmerLoadImage extends StatelessWidget {
  final double width;
  final double height;
  const ShimmerLoadImage({
    super.key,
    this.width = 50,
    this.height = 50,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: secondaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      width: width,
      height: height,
    );
  }
}

class ShimmerGetFeaturedCoupons extends StatelessWidget {
  final double height;
  final double width;
  const ShimmerGetFeaturedCoupons({
    super.key,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: secondaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      height: height,
      width: width,
      // Add clip to ensure shimmer doesn't leak outside rounded corners
      clipBehavior: Clip.antiAlias,
    );
  }
}
