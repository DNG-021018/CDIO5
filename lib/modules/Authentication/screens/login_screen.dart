// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shoes_shop_app/core/constants/palette.dart';
import 'package:shoes_shop_app/modules/Authentication/services/api_service.dart';
import 'package:shoes_shop_app/modules/Authentication/utils/validator_util.dart';

import '../models/user.dart';
import '../widgets/login_third_place.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late Size mediaSize;
  bool obscureText = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    mediaSize = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("lib/data/images/logo/backGround_image.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        // loginForm
        body: Stack(
          children: [
            Positioned(
              bottom: 0,
              child: _loginForm(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _loginForm() {
    return Container(
      width: mediaSize.width,
      height: mediaSize.height / 1.7,
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black87,
            blurRadius: 5,
          ),
        ],
        color: baseColor3,
        border: Border.fromBorderSide(
          BorderSide(width: 1),
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            // Introduction
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: mediaSize.height / 20,
                    child: Image.asset("lib/data/images/logo/flutter_icon.png"),
                  ),
                  const Text(
                    "CDIO",
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: "fonts/Roboto-Bold.ttf",
                    ),
                  ),
                ],
              ),
            ),
            // Input Email address
            const SizedBox(height: 20),
            TextField(
              controller: emailController,
              cursorColor: brandColorSecondary,
              decoration: InputDecoration(
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                hintText: "Địa chỉ Email",
                hintStyle: const TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 10),
            // Input Password
            TextField(
              controller: passwordController,
              cursorColor: brandColorSecondary,
              obscureText: obscureText,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                hintText: "Mật khẩu",
                hintStyle: const TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                  icon: obscureText
                      ? const Icon(FontAwesomeIcons.eyeSlash, size: 18)
                      : const Icon(FontAwesomeIcons.eye, size: 18),
                ),
                suffixIconColor: brandColorSecondary,
              ),
              onSubmitted: (value) {
                Navigator.of(context).pushNamed("/home");
              },
            ),
            Row(
              children: [
                Checkbox(
                  activeColor: brandColorSecondary,
                  value: rememberMe,
                  onChanged: (value) {
                    _toggleRememberMe();
                  },
                ),
                const Text('Remember Me'),
              ],
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                _checkFormValidationIsEmpty();
              },
              child: Container(
                width: mediaSize.width,
                height: 55,
                decoration: BoxDecoration(
                  color: brandColorPrimary,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                  border: Border.all(width: 1),
                ),
                child: const Center(
                  // button login
                  child: Text(
                    "Đăng nhập",
                    style: TextStyle(
                      color: brandColorSecondary,
                      fontFamily: "lib/data/fonts/Roboto-Bold.ttf",
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
            // Span signup
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                RichText(
                  text: TextSpan(
                    text: "Chưa có tài khoản? ",
                    style: const TextStyle(
                        fontSize: 16, color: brandColorSecondary),
                    children: [
                      WidgetSpan(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed("/signup");
                          },
                          child: const Text(
                            "Đăng ký!",
                            style: TextStyle(fontSize: 15, color: Colors.blue),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            const Divider(
              color: Colors.grey,
              thickness: 1,
              indent: 30,
              endIndent: 30,
              height: 10,
            ),
            const SizedBox(height: 10),
            // Login to third place
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(height: 1),
                AnotherLogin(
                  logoName: "Google_Logo",
                  thirdPlace: () {
                    Navigator.of(context).pushNamed("/home");
                  },
                ),
                const SizedBox(height: 1),
                AnotherLogin(
                  logoName: "Apple_Logo",
                  thirdPlace: () {
                    Navigator.of(context).pushNamed("/home");
                  },
                ),
                const SizedBox(height: 1),
                AnotherLogin(
                  logoName: "Facebook_Logo",
                  thirdPlace: () {
                    Navigator.of(context).pushNamed("/home");
                  },
                ),
                const SizedBox(height: 1),
              ],
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // renember me
  void _toggleRememberMe() {
    setState(() {
      rememberMe = !rememberMe;
    });
  }

  // check Empty of email & password
  void _checkFormValidationIsEmpty() async {
    if (ValidatorUtil.validate(passwordController.text) == false &&
        ValidatorUtil.validate(emailController.text) == false) {
      try {
        User userToSignIn = User(
          accName: emailController.text,
          password: passwordController.text,
        );
        final response = await AuthService().signIn(userToSignIn);
        final responseData = json.decode(response);
        if (responseData['status'] == true) {
          Navigator.of(context).pushNamed("/home");
        } else {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text(
                  "Không tìm thấy tài khoản đăng nhập",
                  style: TextStyle(fontSize: 17),
                ),
                content: const Text("Vui lòng kiểm tra lại thông tin."),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("OK"),
                  ),
                ],
              );
            },
          );
        }
      } catch (error) {
        // Xử lý lỗi ở đây nếu cần
        debugPrint(error.toString());
      }
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text(
              "Không tìm thấy tài khoản đăng nhập",
              style: TextStyle(fontSize: 17),
            ),
            content: const Text("Vui lòng kiểm tra lại thông tin."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("OK"),
              ),
            ],
          );
        },
      );
    }
  }
}
