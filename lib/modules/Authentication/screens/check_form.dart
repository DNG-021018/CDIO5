import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/constants/palette.dart';
import '../utils/validator_util.dart';

class CheckForm extends StatefulWidget {
  const CheckForm({super.key});

  @override
  State<CheckForm> createState() => _CheckFormState();
}

class _CheckFormState extends State<CheckForm> {
  late Size mediaSize;
  bool obscureTextPassword = true;
  bool obscureTextPasswordConfirm = true;
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();

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
              child: _checkForm(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _checkForm() {
    return Container(
      width: mediaSize.width,
      height: mediaSize.height / 2.4,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
                Row(
                  children: [
                    SizedBox(
                      height: mediaSize.height / 20,
                      child:
                          Image.asset("lib/data/images/logo/flutter_icon.png"),
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
                const SizedBox(width: 70),
              ],
            ),
            // Input Email address
            const SizedBox(height: 20),
            TextField(
              controller: passwordController,
              cursorColor: brandColorSecondary,
              obscureText: obscureTextPassword,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                hintText: "Mật khẩu mới",
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
                      obscureTextPassword = !obscureTextPassword;
                    });
                  },
                  icon: obscureTextPassword
                      ? const Icon(FontAwesomeIcons.eyeSlash, size: 18)
                      : const Icon(FontAwesomeIcons.eye, size: 18),
                ),
                suffixIconColor: brandColorSecondary,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: passwordConfirmController,
              cursorColor: brandColorSecondary,
              obscureText: obscureTextPasswordConfirm,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                hintText: "Xác thực mật khẩu",
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
                      obscureTextPasswordConfirm = !obscureTextPasswordConfirm;
                    });
                  },
                  icon: obscureTextPasswordConfirm
                      ? const Icon(FontAwesomeIcons.eyeSlash, size: 18)
                      : const Icon(FontAwesomeIcons.eye, size: 18),
                ),
                suffixIconColor: brandColorSecondary,
              ),
            ),
            const Spacer(),
            const SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                validateTextField(
                    passwordController.text, passwordConfirmController.text);
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
                    "Tiếp theo",
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
          ],
        ),
      ),
    );
  }

  void validateTextField(value, value2) {
    if (ValidatorUtil.validate(value) == false ||
        ValidatorUtil.validate(value2) == false) {
      if (ValidatorUtil.validateConfirmPassword(value2, value) == true) {
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
              title: const Text("Thành công"),
              content: const Text("Đổi mật khẩu thành công."),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.popAndPushNamed(context, "/login");
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
            title: const Text(
              "Thông tin chưa đầy đủ",
              style: TextStyle(fontSize: 17),
            ),
            content: const Text("Vui lòng nhập đầy đủ thông tin."),
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
