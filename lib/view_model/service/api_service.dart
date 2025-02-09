import 'package:category_product_list/model/grocery_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ApiService {
  static final Dio _dio = Dio();

  static Future<List<GroceryModel>> fetchGroceryProduct({
    required int value,
    required dynamic categoryId,
    required int page,
  }) async {
    final String apiUrl =
        "https://alpha.bytesdelivery.com/api/v3/product/category-products/$value/$categoryId/$page";
    try {
      Response response = await _dio.get(apiUrl);

      if (response.statusCode == 200) {
        List<dynamic> result =
            List<dynamic>.from(response.data['data']['products']);
        List<GroceryModel> product =
            result.map((json) => GroceryModel.fromJson(json)).toList();
        return product;
      } else {
        throw Exception(
            'API request failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching data: $e');
      }
      return [];
    }
  }
}
