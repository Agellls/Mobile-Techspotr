import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/routes/routes_name.dart';
import 'package:flutter_application_1/shared/theme.dart';
import 'package:flutter_application_1/utilities/loading.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class SingleProducts extends StatefulWidget {
  final String id;
  final String productName;
  final List<double> productPrice;
  final List<String> productPriceImages;
  final String productImage;
  final double productRating;
  final String brandName;
  final String brandImage;
  const SingleProducts({
    super.key,
    required this.id,
    required this.productName,
    required this.productPrice,
    required this.productPriceImages,
    required this.productImage,
    required this.productRating,
    required this.brandName,
    required this.brandImage,
  });

  @override
  State<SingleProducts> createState() => _SingleProductsState();
}

class _SingleProductsState extends State<SingleProducts> {
  bool _isDragging = false;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: _isDragging ? 0.3 : 1.0,
      child: _AnimatedShadowCard(
        id: widget.id,
        productName: widget.productName,
        productPrice: widget.productPrice,
        productPriceImages: widget.productPriceImages,
        productImage: widget.productImage,
        productRating: widget.productRating,
        brandName: widget.brandName,
        brandImage: widget.brandImage,
        onDragStarted: () {
          setState(() {
            _isDragging = true;
          });
        },
        onDragEnd: () {
          setState(() {
            _isDragging = false;
          });
        },
      ),
    );
  }
}

class _AnimatedShadowCard extends StatefulWidget {
  final VoidCallback onDragStarted;
  final VoidCallback onDragEnd;
  final String id;
  final String productName;
  final List<double> productPrice;
  final List<String> productPriceImages;
  final String productImage;
  final double productRating;
  final String brandName;
  final String brandImage;

  const _AnimatedShadowCard({
    required this.onDragStarted,
    required this.onDragEnd,
    required this.id,
    required this.productName,
    required this.productPrice,
    required this.productPriceImages,
    required this.productImage,
    required this.productRating,
    required this.brandName,
    required this.brandImage,
  });

  @override
  State<_AnimatedShadowCard> createState() => _AnimatedShadowCardState();
}

class _AnimatedShadowCardState extends State<_AnimatedShadowCard> {
  void _goToSinglePage(BuildContext context) {
    Get.toNamed(
      RouteName.single,
      arguments: {
        'id': widget.id, // Make sure this is passed correctly
        'productName': widget.productName,
        'productPrice': widget.productPrice,
        'productPriceImages': widget.productPriceImages,
        'productImage': widget.productImage,
        'productRating': widget.productRating,
        'brandName': widget.brandName,
        'brandImage': widget.brandImage,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _goToSinglePage(context),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
        width: 170,
        height: 215,
        padding: const EdgeInsets.all(defaultSpace / 2),
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.circular(defaultSpace),
        ),
        child: _buildProductCard(
          id: widget.id,
          productName: widget.productName,
          productPrice: widget.productPrice,
          productPriceImages: widget.productPriceImages,
          productImage: widget.productImage,
          productRating: widget.productRating,
          brandName: widget.brandName,
          brandImage: widget.brandImage,
          onDragStarted: widget.onDragStarted,
          onDragEnd: widget.onDragEnd,
        ),
      ),
    );
  }
}

Widget _buildProductCard({
  required String id,
  required String productName,
  required List<double> productPrice,
  required List<String> productPriceImages,
  required String productImage,
  required double productRating,
  required String brandName,
  required String brandImage,
  bool isDragging = false,
  VoidCallback? onDragStarted,
  VoidCallback? onDragEnd,
}) {
  final Map<String, dynamic> productData = {
    'id': id,
    'productName': productName, // Changed from 'product_name'
    'productImage': productImage, // Changed from 'product_image'
    'productRating': productRating, // Changed from 'product_rating'
    'brandName': brandName, // Changed from 'brand_name'
    'brandImage': brandImage, // Changed from 'brand_image'
    'productPrice': productPrice, // Added this missing field
    'productPriceImages': productPriceImages, // Added this missing field
  };

  // This is the feedback widget.
  Widget feedback(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(defaultSpace / 2),
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.circular(defaultSpace),
        ),
        width: 182,
        height: 215,
        child: _buildProductCard(
          id: id,
          productName: productName,
          productPrice: productPrice,
          productPriceImages: productPriceImages,
          productImage: productImage,
          productRating: productRating,
          brandName: brandName,
          brandImage: brandImage,
          isDragging: true,
        ),
      ),
    );
  }

  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Row(
        children: [
          if (!isDragging)
            LongPressDraggable<Map<String, dynamic>>(
              data: productData,
              onDragStarted: onDragStarted,
              onDragEnd: (_) => onDragEnd?.call(),
              onDraggableCanceled: (_, __) => onDragEnd?.call(),
              feedback: Builder(builder: feedback),
              child: Icon(
                Icons.add_circle,
                color: activeColor,
                size: 30,
              ),
            )
          else
            Icon(
              Icons.add_circle,
              color: activeColor,
              size: 30,
            ),
          const Spacer(),
        ],
      ),
      const SizedBox(height: defaultSpace / 2),
      CachedNetworkImage(
        imageUrl: productImage,
        width: 120,
        height: 120,
        fit: BoxFit.cover,
        placeholder: (context, url) => Shimmer.fromColors(
          baseColor: secondaryColor,
          highlightColor: thirdtyColor,
          child: const ShimmerPerProfile(),
        ),
        errorWidget: (context, url, error) => Image.network(
          'https://icons.veryicon.com/png/o/business/new-vision-2/picture-loading-failed-1.png',
          width: 120,
          height: 120,
          fit: BoxFit.cover,
        ),
      ),
      const SizedBox(height: defaultSpace),
      Text(
        productName,
        style: blackTextStyle.copyWith(
          fontSize: 16,
          fontWeight: bold,
        ),
        textAlign: TextAlign.start,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    ],
  );
}
