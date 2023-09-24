import 'package:dio/dio.dart';

import '../models/product.dart';

class API {
  static Future<List<Product>> fetchData() async {
    try {
      Dio dio = Dio(); // Create a Dio instance

      // Define the API endpoint URL
      String apiUrl = 'https://fakestoreapi.com/products/5';

      // Send a GET request
      Response response = await dio.get(apiUrl);

      // Check if the request was successful (HTTP status code 200)
      if (response.statusCode == 200) {
        final dynamic data = response.data;

        // Parse the response data
        if (data is List<dynamic>) { // Explicitly check if data is a List
          final List<Product> products = data
              .map((json) => Product.fromJson(json as Map<String, dynamic>))
              .toList();
          return products;
        } else {
          throw Exception('Response data is not a List');
        }
      } else {
        throw Exception('Failed to fetch data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
