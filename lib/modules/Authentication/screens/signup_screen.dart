import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shoes_shop_app/constants/palette.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  late Size mediaSize;
  bool obscureText = true;
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
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
      height: mediaSize.height / 1.5,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: mediaSize.width / 3,
                  child: TextField(
                    controller: lastNameController,
                    cursorColor: brandColorSecondary,
                    decoration: InputDecoration(
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: isLastNameEmpty ? Colors.red : Colors.black),
                      ),
                      hintText:
                          isLastNameEmpty ? "Không được bỏ trống" : "Họ",
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
                        isLastNameEmpty = lastNameController.text.isEmpty;
                      });
                    },
                  ),
                ),
                const SizedBox(width: 10),
                SizedBox(
                  width: mediaSize.width / 2,
                  child: TextField(
                    controller: firstNameController,
                    cursorColor: brandColorSecondary,
                    decoration: InputDecoration(
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color:
                                isFirstNameEmpty ? Colors.red : Colors.black),
                      ),
                      hintText:
                          isFirstNameEmpty ? "Không được bỏ trống" : "Tên",
                      hintStyle: TextStyle(
                        fontSize: 12,
                        color: isFirstNameEmpty ? Colors.red : Colors.black,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onChanged: (text) {
                      setState(() {
                        isFirstNameEmpty = firstNameController.text.isEmpty;
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
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
                      obscureText = !obscureText;
                    });
                  },
                  icon: obscureText
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
            TextField(
              controller: passwordConfirmController,
              cursorColor: brandColorSecondary,
              obscureText: obscureText,
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
            TextField(
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
    if (lastNameController.text.isEmpty ||
        firstNameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        passwordConfirmController.text.isEmpty ||
        phoneNumberController.text.isEmpty) {
      // Hiển thị hộp thoại thông báo lỗi
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
    } else {
      // Hiển thị hộp thoại thông báo đăng ký thành công
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Thành công"),
            content: const Text("Đăng ký thành công."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                  Navigator.of(context).pushNamed("/login");
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
