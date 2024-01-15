import 'package:flutter/material.dart';

import '../../../core/constants/palette.dart';
import '../../Models/product.dart';
import '../../Widgets/cart_card.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({super.key});

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  bool isAddressEmpty = false;
  bool isNameEmpty = false;
  bool isPhoneNumberEmpty = false;

  final TextEditingController addressController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController noteController = TextEditingController();

  List<Shoes> shoes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('Thanh toán'),
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: shoes.length,
              itemBuilder: (BuildContext context, int index) {
                Shoes shoe = shoes[index];
                return CartCard(shoe: shoe);
              },
            ),
            Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                  // TODO: Input address
                  TextField(
                    controller: addressController,
                    cursorColor: brandColorSecondary,
                    decoration: InputDecoration(
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: isAddressEmpty ? Colors.red : Colors.black),
                      ),
                      hintText: isAddressEmpty
                          ? "Không được bỏ trống"
                          : "Địa chỉ nhận hàng",
                      hintStyle: TextStyle(
                        fontSize: 12,
                        color: isAddressEmpty ? Colors.red : Colors.black,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onChanged: (text) {
                      setState(() {
                        isAddressEmpty = addressController.text.isEmpty;
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  const SizedBox(height: 10),
                  // TODO: Input address
                  TextField(
                    controller: nameController,
                    cursorColor: brandColorSecondary,
                    decoration: InputDecoration(
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: isNameEmpty ? Colors.red : Colors.black),
                      ),
                      hintText: isNameEmpty
                          ? "Không được bỏ trống"
                          : "Họ và tên người nhận:",
                      hintStyle: TextStyle(
                        fontSize: 12,
                        color: isNameEmpty ? Colors.red : Colors.black,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onChanged: (text) {
                      setState(() {
                        isNameEmpty = nameController.text.isEmpty;
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  const SizedBox(height: 10),
                  // TODO: Input address
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
                          color: isPhoneNumberEmpty ? Colors.red : Colors.black,
                        ),
                      ),
                      hintText: isPhoneNumberEmpty
                          ? "Không được bỏ trống"
                          : "Số điện thoại:",
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
                  const SizedBox(height: 10),
                  const SizedBox(height: 10),
                  // TODO: Input address
                  TextField(
                    maxLines: 5,
                    controller: noteController,
                    cursorColor: brandColorSecondary,
                    decoration: InputDecoration(
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      hintText: "Lưu ý:",
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
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ButtonStyle(
            fixedSize: MaterialStatePropertyAll(
              Size(MediaQuery.of(context).size.width, 60),
            ),
            splashFactory: NoSplash.splashFactory,
            backgroundColor: const MaterialStatePropertyAll(Colors.orange),
          ),
          onPressed: () {
            if (addressController.text.isNotEmpty &&
                nameController.text.isNotEmpty &&
                phoneNumberController.text.isNotEmpty) {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Thanh toán thành công!'),
                    actions: <Widget>[
                      ElevatedButton(
                        style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.orange),
                        ),
                        child: const Text('OK'),
                        onPressed: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            }
          },
          child: const Text(
            'Mua hàng',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              letterSpacing: 4,
            ),
          ),
        ),
      ),
    );
  }
}
