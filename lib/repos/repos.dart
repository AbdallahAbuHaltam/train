import 'package:sportify/api/api.dart';
import 'package:sportify/models/product.dart';

class ProductRepost{
  static Future<List<Product>> FetchProduct() async {
    List<Product> products= await API.fetchData();
    return products;
  }
}