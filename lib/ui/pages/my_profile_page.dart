import 'package:flutter/material.dart';

import '../../shared/theme.dart';
import '../widgets/button_text_menu.dart';
import '../widgets/discuss_widget.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'My Profile',
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Thoughts, takes, and hot debates.',
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  color: thirdtyColor,
                ),
              ),
              const SizedBox(height: defaultSpace),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ButtonTextMenu(
                      isActive: true,
                      text: 'My Discussions',
                    ),
                    ButtonTextMenu(
                      text: 'My Favorite Discussions',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: defaultSpace),
              DiscussWidget(
                mainColor: thirdtyColor,
              ),
              DiscussWidget(
                mainColor: thirdtyColor,
              ),
              DiscussWidget(
                mainColor: thirdtyColor,
              ),
              DiscussWidget(
                mainColor: thirdtyColor,
              ),
              SizedBox(height: defaultSpace),
            ],
          ),
        ),
      ),
    );
  }
}
