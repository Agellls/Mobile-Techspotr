import 'package:get/get.dart';
import 'package:flutter_application_1/services/api_services.dart';

class CollectionSingleController extends GetxController {
  // Observables for collection and products
  final Rxn<Map<String, dynamic>> collection = Rxn<Map<String, dynamic>>();
  final RxList<Map<String, dynamic>> allItems = <Map<String, dynamic>>[].obs;
  final RxList<Map<String, dynamic>> filteredItems =
      <Map<String, dynamic>>[].obs;

  // Loading, error, and search state
  final RxBool isLoading = false.obs;
  final RxnString error = RxnString();
  final RxString searchQuery = ''.obs;

  final ApiServices _apiServices = ApiServices();

  // Fetch a single collection and map items
  Future<void> fetchSingleCollection(int collectionId) async {
    isLoading.value = true;
    error.value = null;
    try {
      final data = await _apiServices.fetchSingleCollection(collectionId);
      collection.value = data;
      // Map items to product format
      final items = (data['items'] as List<dynamic>? ?? [])
          .map<Map<String, dynamic>>((item) => _mapApiItemToProduct(item))
          .toList();
      allItems.assignAll(items);
      _applySearchFilter();
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  // Map API item to product format
  Map<String, dynamic> _mapApiItemToProduct(Map<String, dynamic> item) {
    final brand = item['brand'] ?? {};
    final prices = (item['prices'] as List<dynamic>? ?? [])
        .map((e) => Map<String, dynamic>.from(e as Map))
        .toList();
    return {
      'id': item['id']?.toString() ?? '',
      'productName': item['title'] ?? '',
      'productImage': item['image'] ?? brand['image'] ?? '',
      'productRating':
          (item['score'] is num) ? (item['score'] as num).toDouble() / 10 : 0.0,
      'productPrice':
          prices.map((e) => (e['price'] as num?)?.toDouble() ?? 0.0).toList(),
      'productPriceImages':
          prices.map((e) => brand['image']?.toString() ?? '').toList(),
      'brandImage': brand['image'] ?? '',
      'brandName': brand['name'] ?? '',
      'slug': item['slug'] ?? '',
      'description': '', // Not provided in item
      'category': {}, // Not provided in item
      'prices': prices,
      'brand': brand,
    };
  }

  // Filter items by search query
  void filterItems(String query) {
    searchQuery.value = query;
    _applySearchFilter();
  }

  // Clear search and show all items
  void clearSearch() {
    searchQuery.value = '';
    filteredItems.assignAll(allItems);
    filteredItems.refresh();
  }

  void _applySearchFilter() {
    if (searchQuery.value.isEmpty) {
      filteredItems.assignAll(allItems);
    } else {
      final q = searchQuery.value.toLowerCase();
      filteredItems.assignAll(allItems.where((item) {
        final name = item['productName']?.toString().toLowerCase() ?? '';
        final brand = item['brandName']?.toString().toLowerCase() ?? '';
        return name.contains(q) || brand.contains(q);
      }).toList());
    }
  }
}
