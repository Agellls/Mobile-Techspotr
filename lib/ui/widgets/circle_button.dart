import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/shared/theme.dart';

class CircleButton extends StatelessWidget {
  final IconData icon;
  const CircleButton({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: whiteColor,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: blackColor.withOpacity(0.3),
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      padding: const EdgeInsets.all(defaultSpace),
      child: Icon(
        icon,
        color: blackColor,
        size: 20,
      ),
    );
  }
}
