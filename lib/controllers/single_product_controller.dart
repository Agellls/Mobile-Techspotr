import 'package:get/get.dart';
import 'package:flutter_application_1/services/api_services.dart';

class SingleProductController extends GetxController {
  final ApiServices _apiServices = ApiServices();

  // Observable variables for product data
  final RxMap<String, dynamic> productData = <String, dynamic>{}.obs;
  final RxList<Map<String, dynamic>> specParents = <Map<String, dynamic>>[].obs;
  final RxList<Map<String, dynamic>> priceData = <Map<String, dynamic>>[].obs;

  // Add highlights data
  final RxList<Map<String, dynamic>> highlightsData =
      <Map<String, dynamic>>[].obs;
  final RxMap<String, dynamic> chartData = <String, dynamic>{}.obs;

  // Loading and error states
  final RxBool isLoading = false.obs;
  final RxBool hasError = false.obs;
  final RxString errorMessage = ''.obs;

  // Tab selection
  final RxInt selectedTabIndex = 0.obs;

  Future<void> fetchProductDetails(String productId) async {
    try {
      isLoading.value = true;
      hasError.value = false;
      errorMessage.value = '';

      // Fetch both product details and highlights
      final data = await _apiServices.fetchSinglePost(productId);
      final highlights = await _apiServices.fetchProductHighlights(productId);

      productData.assignAll(data);

      // Extract spec parents for tabs
      if (data['category'] != null && data['category']['spec_parent'] != null) {
        specParents.assignAll(
            List<Map<String, dynamic>>.from(data['category']['spec_parent']));
      }

      // Extract price data
      if (data['price'] != null) {
        priceData.assignAll(List<Map<String, dynamic>>.from(data['price']));
      }

      // Extract highlights data for specifications
      if (highlights['spec_win'] != null) {
        highlightsData
            .assignAll(List<Map<String, dynamic>>.from(highlights['spec_win']));
      }

      // Extract chart data for radar chart
      if (highlights['chart'] != null) {
        chartData.assignAll(highlights['chart']);
      }

      print('Chart data extracted: ${chartData.keys.join(', ')}');
    } catch (e) {
      hasError.value = true;
      errorMessage.value = e.toString();
      print('Error fetching product details: $e');
    } finally {
      isLoading.value = false;
    }
  }

  // Getters for easy access to product data
  String get productName => productData['title'] ?? 'Unknown Product';
  String get productImage => productData['image'] ?? '';
  double get productRating =>
      (productData['score'] ?? 0).toDouble() / 10; // Convert to 0-10 scale
  String get brandName => productData['brand']?['name'] ?? 'Unknown Brand';
  String get brandImage => productData['brand']?['image'] ?? '';
  String get description => productData['content'] ?? '';

  List<double> get productPrices {
    if (priceData.isEmpty) return [0.0, 0.0];
    return priceData
        .take(2)
        .map((price) => (price['price'] as num? ?? 0).toDouble())
        .toList()
        .cast<double>();
  }

  List<String> get productPriceImages {
    if (priceData.isEmpty)
      return [
        'https://t0.gstatic.com/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&url=http://buywiseappliances.co.uk&size=128',
        'https://t0.gstatic.com/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&url=http://samsung.com&size=128'
      ];

    // Extract favicons from actual price links or use defaults
    return priceData.take(2).map((price) {
      final link = price['link'] ?? '';
      if (link.isNotEmpty) {
        final uri = Uri.tryParse(link);
        if (uri != null) {
          return 'https://t0.gstatic.com/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&url=${uri.scheme}://${uri.host}&size=128';
        }
      }
      return 'https://t0.gstatic.com/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&url=http://buywiseappliances.co.uk&size=128';
    }).toList();
  }

  // Add getters for price links and titles
  List<String> get productPriceLinks {
    if (priceData.isEmpty) return [];
    return priceData
        .take(2)
        .map((price) => (price['link'] as String? ?? ''))
        .toList()
        .cast<String>();
  }

  List<String> get productPriceTitles {
    if (priceData.isEmpty) return [];
    return priceData
        .take(2)
        .map((price) => (price['title'] as String? ?? 'Store'))
        .toList()
        .cast<String>();
  }

  // Get chart data for radar chart
  List<String> get radarFeatures {
    if (chartData.isEmpty) return [];
    return chartData.keys.toList();
  }

  List<List<double>> get radarData {
    if (chartData.isEmpty) return [];

    List<double> productScores = [];
    List<double> averageScores = [];

    for (var key in chartData.keys) {
      var categoryData = chartData[key];
      productScores.add((categoryData['score'] ?? 0).toDouble());
      averageScores.add((categoryData['avg_score'] ?? 0).toDouble());
    }

    return [productScores, averageScores];
  }

  // Get simplified feature names for display
  List<String> get simplifiedFeatures {
    if (chartData.isEmpty) return [];

    return chartData.values.map((category) {
      String name = category['name'] ?? '';
      // Simplify long names for better chart display
      if (name.length > 12) {
        return name.split(' ').first;
      }
      return name;
    }).toList();
  }

  // Get highlights for selected tab
  Map<String, dynamic>? get currentTabHighlights {
    if (highlightsData.isEmpty ||
        selectedTabIndex.value >= specParents.length) {
      return null;
    }

    // Get current selected spec parent
    final currentSpec = specParents[selectedTabIndex.value];
    final currentSlug = currentSpec['slug'];

    // Find matching highlights by slug
    for (var highlight in highlightsData) {
      if (highlight['slug'] == currentSlug) {
        return highlight;
      }
    }

    // Fallback: try by name
    final currentName = currentSpec['name'];
    for (var highlight in highlightsData) {
      if (highlight['name'] == currentName) {
        return highlight;
      }
    }

    return null;
  }

  // Get chart data for selected tab
  Map<String, dynamic>? get currentTabChart {
    if (chartData.isEmpty || selectedTabIndex.value >= specParents.length) {
      return null;
    }
    final currentSpec = specParents[selectedTabIndex.value];
    final slug = currentSpec['slug'];
    return chartData[slug];
  }
}
