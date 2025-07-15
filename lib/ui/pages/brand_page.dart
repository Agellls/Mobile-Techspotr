import 'package:flutter/material.dart';
import 'package:flutter_application_1/shared/theme.dart';
import 'package:flutter_application_1/ui/widgets/brand_widget.dart';

import '../widgets/button_text_menu.dart';
import '../widgets/search_forms.dart';

class BrandPage extends StatelessWidget {
  BrandPage({super.key});

  final searchController = TextEditingController();
  final FocusNode searchFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryColor,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: primaryColor,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                left: defaultSpace,
                right: defaultSpace,
                top: defaultSpace,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Brands',
                    style: blackTextStyle.copyWith(
                      fontSize: 24,
                      fontWeight: bold,
                    ),
                  ),
                  const SizedBox(height: defaultSpace / 2),
                  Text(
                    'Explore different brands',
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
                      hintText: 'Search Brands',
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
                  //       'All Brands',
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
                  const SizedBox(height: defaultSpace),
                  const SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ButtonTextMenu(
                          isActive: true,
                          text: 'Popularity',
                        ),
                        ButtonTextMenu(
                          text: 'Recently',
                        ),
                      ],
                    ),
                  ),
                  BrandWidget(
                    brandImageUrl:
                        'https://www.rankcdn.com/cdn-cgi/image/quality=90,onerror=redirect,format=webp,fit=cover,width=360,height=360/techspotr.com/sharp.jpg',
                    brandName: 'SHARP',
                    totalProduct: 120,
                    brandImageUrl1:
                        'https://www.rankcdn.com/cdn-cgi/image/quality=90,onerror=redirect,format=webp,fit=cover,width=500/techspotr.com/sharp-4t-c65fs1ur.png',
                    brandImageUrl2:
                        'https://www.rankcdn.com/cdn-cgi/image/quality=90,onerror=redirect,format=webp,fit=cover,width=500/techspotr.com/4t-c75fv1u.png',
                    brandImageUrl3:
                        'https://www.rankcdn.com/cdn-cgi/image/quality=90,onerror=redirect,format=webp,fit=cover,width=500/techspotr.com/c55gm6540u.png',
                    brandImageUrl4:
                        'https://www.rankcdn.com/cdn-cgi/image/quality=90,onerror=redirect,format=webp,fit=cover,width=500/techspotr.com/4t-c75fv1u.png',
                  ),
                  BrandWidget(
                    brandImageUrl:
                        'https://www.rankcdn.com/cdn-cgi/image/quality=90,onerror=redirect,format=webp,fit=cover,width=360,height=360/techspotr.com/sony.jpg',
                    brandName: 'SONY',
                    totalProduct: 50,
                    brandImageUrl1:
                        'https://www.rankcdn.com/cdn-cgi/image/quality=90,onerror=redirect,format=webp,fit=cover,width=500/techspotr.com/bravia-x75.png',
                    brandImageUrl2:
                        'https://www.rankcdn.com/cdn-cgi/image/quality=90,onerror=redirect,format=webp,fit=cover,width=500/techspotr.com/bravia-9-65.png',
                  ),
                  BrandWidget(
                    brandImageUrl:
                        'https://www.rankcdn.com/cdn-cgi/image/quality=90,onerror=redirect,format=webp,fit=cover,width=360,height=360/techspotr.com/blackdecker.jpg',
                    brandName: 'BLACK+DECKER',
                    totalProduct: 43,
                    brandImageUrl1:
                        'https://www.rankcdn.com/cdn-cgi/image/quality=90,onerror=redirect,format=webp,fit=cover,width=500/techspotr.com/blackdecker-bpact14hwt.png',
                  ),
                  BrandWidget(
                    brandImageUrl:
                        'https://www.rankcdn.com/cdn-cgi/image/quality=90,onerror=redirect,format=webp,fit=cover,width=360,height=360/techspotr.com/bella-kitchen-appliances.jpg',
                    brandName: 'BELLA KITCHEN',
                    totalProduct: 20,
                    brandImageUrl1:
                        'https://www.rankcdn.com/cdn-cgi/image/quality=90,onerror=redirect,format=webp,fit=cover,width=500/techspotr.com/bella-pro-90235.png',
                    brandImageUrl2:
                        'https://www.rankcdn.com/cdn-cgi/image/quality=90,onerror=redirect,format=webp,fit=cover,width=500/techspotr.com/bella-90222.png',
                  ),
                  SizedBox(height: defaultSpace),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
