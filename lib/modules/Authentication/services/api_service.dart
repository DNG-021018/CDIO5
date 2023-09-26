import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shoes_shop_app/modules/Authentication/models/user.dart';

class AuthService {
  Future<User> accounts(
    String accName,
    String fullName,
    String email,
    String password,
    String passwordCF,
    String phoneNumber,
    String dateOfBirth,
    String gender,
  ) async {
    final url = Uri.parse('http://localhost:8000/accounts');
    final response = await http.post(
      url,
      body: json.encode({
        'accName': accName,
        'fullName': fullName,
        'email': email,
        'password': password,
        'passwordCF': passwordCF,
        'phoneNumber': phoneNumber,
        'dateOfBirth': dateOfBirth,
        'gender': gender,
      }),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      // Đăng ký thành công
      return User.fromJson(json.decode(response.body));
    } else {
      // Đăng ký thất bại
      throw Exception('Sign up error: ${response.statusCode}');
    }
  }

  Future<User> signIn(String email, String password) async {
    final url = Uri.parse('http://localhost:8000/signin');
    final response = await http.post(
      url,
      body: json.encode({
        'email': email,
        'password': password,
      }),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      // Đăng nhập thành công
      return User.fromJson(json.decode(response.body));
    } else {
      // Đăng nhập thất bại
      throw Exception('Sign in error: ${response.statusCode}');
    }
  }
}
