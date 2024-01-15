import 'package:http/http.dart' as http;

import '../Models/product.dart';

class ProductService {
  Future<List<Shoes>?> fetch() async {
    var clients = http.Client();
    final url = Uri.parse('https://shoesshop-6n6z.onrender.com/shoes');
    final response = await clients.get(url);

    if (response.statusCode == 200) {
      var json = response.body;
      return shoesFromJson(json);
    } else {
      throw Exception('Sign up error: ${response.statusCode}');
    }
  }
}
