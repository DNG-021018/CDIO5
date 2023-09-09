import 'package:flutter/material.dart';

class AccountSetting extends StatelessWidget {
  const AccountSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thiết lập tài khoản'),
      ),
      body: const Center(
        child: Text('Đây là trang Thiết lập tài khoản'),
      ),
    );
  }
}
