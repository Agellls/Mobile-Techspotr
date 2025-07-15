import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class VideosWidget extends StatelessWidget {
  final Color mainColor;
  const VideosWidget({super.key, required this.mainColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        color: secondaryColor,
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
