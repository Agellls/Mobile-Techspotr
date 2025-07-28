import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/ui/widgets/store_button.dart';

import '../../shared/theme.dart';

class AwardSinglePricesWidget extends StatelessWidget {
  final List<dynamic> prices;
  const AwardSinglePricesWidget({super.key, required this.prices});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (var price in prices)
            Column(
              children: [
                StoreButton(
                  logoUrl:
                      // Use a default favicon if possible, or fallback to a placeholder
                      'https://t3.gstatic.com/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&url=${price['link'] ?? 'http://www.example.com'}&size=128',
                  price: (price['price'] is num)
                      ? (price['price'] as num).toDouble()
                      : 0.0,
                  currency: '\$',
                  onTap: () async {
                    // Optionally, handle tap to open link
                  },
                  mainColor: compareColor,
                  textColor: whiteColor,
                ),
                if (price != prices.last) const SizedBox(height: defaultSpace),
              ],
            ),
        ],
      ),
    );
  }
}
