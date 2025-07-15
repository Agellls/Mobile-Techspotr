import 'package:get/get.dart';

class ComparisonController extends GetxController {
  final RxList<Map<String, dynamic>> comparisonProducts =
      <Map<String, dynamic>>[].obs;
  var selectedTabIndex = 0.obs;

  void addProduct(Map<String, dynamic> product, {int? slotIndex}) {
    // Don't add if product ID already exists in the list
    if (comparisonProducts.any((p) => p['id'] == product['id'])) {
      return;
    }

    if (slotIndex != null) {
      // Add to specific slot
      if (slotIndex == 0) {
        // For first slot
        if (comparisonProducts.isEmpty) {
          comparisonProducts.add(product);
        } else {
          comparisonProducts[0] = product;
        }
      } else if (slotIndex == 1) {
        // For second slot - FIXED to avoid filling slot 0
        if (comparisonProducts.isEmpty || comparisonProducts.length == 1) {
          // Just add the product at the end, it will be in slot 1
          comparisonProducts.add(product);
        } else {
          comparisonProducts[1] = product;
        }
      }
    } else {
      // Original behavior - just add if there's space
      if (comparisonProducts.length < 2) {
        comparisonProducts.add(product);
      }
    }
  }

  void removeProductAt(int index) {
    if (index >= 0 && index < comparisonProducts.length) {
      comparisonProducts.removeAt(index);
    }
  }

  void clearProducts() {
    comparisonProducts.clear();
  }

  // No changes needed for these properties
  bool get canCompare => comparisonProducts.length == 2;
  bool get hasFirstProduct => comparisonProducts.isNotEmpty;
  bool get hasSecondProduct => comparisonProducts.length > 1;
}
