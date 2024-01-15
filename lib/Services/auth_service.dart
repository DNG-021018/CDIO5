import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../Models/user.dart';

class AuthService {
  Future<dynamic> accounts(User user) async {
    final url = Uri.parse('https://shoesshop-6n6z.onrender.com/signup');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'accName': user.accName,
        'email': user.email,
        'password': user.password,
        'passwordCF': user.passwordCF,
        'phoneNumber': user.phoneNumber,
        'gender': user.gender,
      }),
    );

    if (response.statusCode == 200) {
      // Đăng ký thành công
      return response.body;
    } else {
      // Đăng ký thất bại
      throw Exception('Sign up error: ${response.statusCode}');
    }
  }

  Future<dynamic> signIn(User user) async {
    final url = Uri.parse('https://shoesshop-6n6z.onrender.com/signin');
    final response = await post(url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'accName': user.accName,
          'password': user.password,
        }));

    if (response.statusCode == 200) {
      // Đăng nhập thành công
      return response.body;
    } else {
      // Đăng nhập thất bại
      throw Exception('Sign in error: ${response.statusCode}');
    }
  }
}
