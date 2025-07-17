import 'package:flutter/material.dart';

class VideosWidget extends StatelessWidget {
  final Color mainColor;
  final String imageUrl;
  const VideosWidget(
      {super.key, required this.mainColor, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: mainColor,
          width: 0.1,
        ),
      ),
      child: Center(
        child: Icon(
          Icons.play_arrow_rounded,
          size: 50,
          color: mainColor,
        ),
      ),
    );
  }
}
