import 'package:flutter/material.dart';

class AccountSetting extends StatefulWidget {
  const AccountSetting({super.key});

  @override
  State<AccountSetting> createState() => _AccountSettingState();
}

class _AccountSettingState extends State<AccountSetting> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _fullName, _gender, _email, _password, _phoneNumber;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thiết lập tài khoản'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(labelText: 'Họ và Tên'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Hãy nhập Họ và Tên';
                  }
                  return null;
                },
                onSaved: (value) {
                  _fullName = value;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Giới Tính'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Hãy nhập Giới Tính';
                  }
                  return null;
                },
                onSaved: (value) {
                  _gender = value;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Địa Chỉ Email'),
                validator: (value) {
                  if (value!.isEmpty || !value.contains('@')) {
                    return 'Hãy nhập địa chỉ email hợp lệ';
                  }
                  return null;
                },
                onSaved: (value) {
                  _email = value;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Mật Khẩu'),
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty || value.length < 6) {
                    return 'Mật khẩu phải có ít nhất 6 ký tự';
                  }
                  return null;
                },
                onSaved: (value) {
                  _password = value;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Số Điện Thoại'),
                validator: (value) {
                  if (value!.isEmpty || value.length != 10) {
                    return 'Hãy nhập số điện thoại hợp lệ (10 số)';
                  }
                  return null;
                },
                onSaved: (value) {
                  _phoneNumber = value;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                    Colors.orange,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Lưu'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
