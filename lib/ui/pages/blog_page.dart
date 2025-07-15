import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/widgets/blog_widget.dart';

import '../../shared/theme.dart';
import '../widgets/search_forms.dart';

class BlogPage extends StatelessWidget {
  BlogPage({super.key});

  final searchController = TextEditingController();
  final FocusNode searchFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryColor,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: primaryColor,
          body: Padding(
            padding: const EdgeInsets.only(
                left: defaultSpace, right: defaultSpace, top: defaultSpace),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Blogs',
                    style: blackTextStyle.copyWith(
                      fontSize: 24,
                      fontWeight: bold,
                    ),
                  ),
                  const SizedBox(height: defaultSpace),
                  Text(
                    'Explore any blogs',
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      color: thirdtyColor,
                    ),
                  ),
                  const SizedBox(height: defaultSpace),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: SearchForms(
                      hintText: 'Search Blogs',
                      fillColor: secondaryColor,
                      controller: searchController,
                      focusNode: searchFocusNode,
                      isSearch: true,
                      onChanged: (value) {},
                      onClearPressed: () {
                        searchController.clear();
                        FocusScope.of(context).unfocus();
                      },
                    ),
                  ),
                  // const SizedBox(height: defaultSpace),
                  // Row(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Text(
                  //       'All Blogs',
                  //       style: blackTextStyle.copyWith(
                  //         fontSize: 18,
                  //         fontWeight: bold,
                  //       ),
                  //     ),
                  //     Text(
                  //       'See all',
                  //       style: blackTextStyle.copyWith(
                  //         fontSize: 14,
                  //         fontWeight: bold,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  const BlogWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
