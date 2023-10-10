// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shoes_shop_app/core/constants/palette.dart';

import '../models/user.dart';
import '../services/api_service.dart';
import '../utils/validator_util.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  late Size mediaSize;
  bool obscureTextPassword = true;
  bool obscureTextPasswordConfirm = true;
  String dropdownValue = 'Nam';
  List<String> genders = ['Nam', 'Nữ'];
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  bool isLastNameEmpty = false;
  bool isFirstNameEmpty = false;
  bool isEmailEmpty = false;
  bool isPasswordEmpty = false;
  bool isPasswordConfirmEmpty = false;
  bool isPhoneNumberEmpty = false;

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
              child: _signinForm(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _signinForm() {
    return Container(
      width: mediaSize.width,
      height: mediaSize.height / 1.4,
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
            Row(children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).popAndPushNamed("/login");
                },
                icon: const Icon(Icons.arrow_back),
              ),
            ]),
            // Introduction
            //TODO: Icon app
            Row(
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
            // Input Email address
            const SizedBox(height: 20),
            // TODO: Họ và tên
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: mediaSize.width / 1.7,
                  child: TextField(
                    controller: fullNameController,
                    cursorColor: brandColorSecondary,
                    decoration: InputDecoration(
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: isLastNameEmpty ? Colors.red : Colors.black),
                      ),
                      hintText: isLastNameEmpty
                          ? "Không được bỏ trống"
                          : "Tài khoản",
                      hintStyle: TextStyle(
                        fontSize: 12,
                        color: isLastNameEmpty ? Colors.red : Colors.black,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onChanged: (text) {
                      setState(() {
                        isLastNameEmpty = fullNameController.text.isEmpty;
                      });
                    },
                  ),
                ),
                // TODO: Giới tính
                Container(
                  width: mediaSize.width / 4,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5),
                    ),
                    border: Border.all(width: 1),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: DropdownButton<String>(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      value: dropdownValue,
                      underline: const DecoratedBox(
                        decoration: BoxDecoration(color: Colors.transparent),
                      ),
                      isExpanded: true,
                      icon: const Icon(Icons.arrow_drop_down),
                      iconSize: 24,
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                      onChanged: (newValue) {
                        setState(() {
                          dropdownValue = newValue.toString();
                        });
                      },
                      items: genders.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            // TODO: địa chỉ email
            TextField(
              controller: emailController,
              cursorColor: brandColorSecondary,
              decoration: InputDecoration(
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: isEmailEmpty ? Colors.red : Colors.black),
                ),
                hintText:
                    isEmailEmpty ? "Không được bỏ trống" : "Địa chỉ Email",
                hintStyle: TextStyle(
                  fontSize: 12,
                  color: isEmailEmpty ? Colors.red : Colors.black,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onChanged: (text) {
                setState(() {
                  isEmailEmpty = emailController.text.isEmpty;
                });
              },
            ),
            const SizedBox(height: 10),
            // TODO: Input Password
            TextField(
              controller: passwordController,
              cursorColor: brandColorSecondary,
              obscureText: obscureTextPassword,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: isPasswordEmpty ? Colors.red : Colors.black),
                ),
                hintText:
                    isPasswordEmpty ? "Không được bỏ trống" : "Mật khẩu",
                hintStyle: TextStyle(
                  fontSize: 12,
                  color: isPasswordEmpty ? Colors.red : Colors.black,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      obscureTextPassword = !obscureTextPassword;
                    });
                  },
                  icon: obscureTextPassword
                      ? const Icon(FontAwesomeIcons.eyeSlash, size: 18)
                      : const Icon(FontAwesomeIcons.eye, size: 18),
                ),
                suffixIconColor: brandColorSecondary,
              ),
              onChanged: (text) {
                setState(() {
                  isPasswordEmpty = passwordController.text.isEmpty;
                });
              },
            ),
            const SizedBox(
              height: 10,
            ),
            // TODO: Confirm Password

            TextField(
              controller: passwordConfirmController,
              cursorColor: brandColorSecondary,
              obscureText: obscureTextPasswordConfirm,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color:
                          isPasswordConfirmEmpty ? Colors.red : Colors.black),
                ),
                hintText: isPasswordConfirmEmpty
                    ? "Không được bỏ trống"
                    : "Xác thực mật khẩu",
                hintStyle: TextStyle(
                  fontSize: 12,
                  color: isPasswordConfirmEmpty ? Colors.red : Colors.black,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      obscureTextPasswordConfirm = !obscureTextPasswordConfirm;
                    });
                  },
                  icon: obscureTextPasswordConfirm
                      ? const Icon(FontAwesomeIcons.eyeSlash, size: 18)
                      : const Icon(FontAwesomeIcons.eye, size: 18),
                ),
                suffixIconColor: brandColorSecondary,
              ),
              onChanged: (text) {
                setState(() {
                  text = passwordConfirmController.text;
                  isPasswordConfirmEmpty = text.isEmpty;
                });
              },
            ),
            const SizedBox(
              height: 10,
            ),
            // TODO: Input Phonenumber
            TextField(
              keyboardType: TextInputType.number,
              controller: phoneNumberController,
              cursorColor: brandColorSecondary,
              decoration: InputDecoration(
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: isPhoneNumberEmpty ? Colors.red : Colors.black),
                ),
                hintText: isPhoneNumberEmpty
                    ? "Không được bỏ trống"
                    : "Số điện thoại",
                hintStyle: TextStyle(
                  fontSize: 12,
                  color: isPhoneNumberEmpty ? Colors.red : Colors.black,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onChanged: (text) {
                setState(() {
                  isPhoneNumberEmpty = phoneNumberController.text.isEmpty;
                });
              },
            ),
            const SizedBox(height: 20),
            // TODO: BTN_Signup
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
                    "Đăng ký",
                    style: TextStyle(
                      color: brandColorSecondary,
                      fontFamily: "lib/data/fonts/Roboto-Bold.ttf",
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  void _checkFormValidationIsEmpty() {
    if (ValidatorUtil.validate(fullNameController.text) == true ||
        ValidatorUtil.validate(emailController.text) == true ||
        ValidatorUtil.validate(passwordController.text) == true ||
        ValidatorUtil.validate(passwordConfirmController.text) == true ||
        ValidatorUtil.validate(phoneNumberController.text) == true) {
      if (ValidatorUtil.validateConfirmPassword(
              passwordConfirmController.text, passwordController.text) ==
          true) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text(
                "Lỗi",
                style: TextStyle(color: Colors.red),
              ),
              content: const Text("Mật khẩu xác thực không đúng."),
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
      } else {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text(
                "Lỗi",
                style: TextStyle(color: Colors.red),
              ),
              content: const Text("Vui lòng điền đầy đủ thông tin."),
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
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Thành công"),
            content: const Text("Đăng ký thành công."),
            actions: [
              TextButton(
                onPressed: () async {
                  User userToAccounts = User(
                      accName: fullNameController.text,
                      email: emailController.text,
                      password: passwordController.text,
                      passwordCF: passwordConfirmController.text,
                      phoneNumber: phoneNumberController.text,
                      gender: dropdownValue);
                  final response = await AuthService().accounts(userToAccounts);
                  final responseData = json.decode(response);
                  if (responseData['status'] == true) {
                    Navigator.popAndPushNamed(context, "/login");
                  }
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
