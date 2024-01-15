import 'package:flutter/material.dart';

import '../../Models/product.dart';
import '../../Widgets/cart_card.dart';

class ShoppingCartPage extends StatefulWidget {
  const ShoppingCartPage({super.key});

  @override
  State<ShoppingCartPage> createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  List<Shoes> shoes = [];

  @override
  Widget build(BuildContext context) {
    // int total = calculateTotalPrice([shoes[]]);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Giỏ hàng'),
        backgroundColor: Colors.orange,
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        itemCount: shoes.length, // Số lượng sản phẩm trong giỏ hàng
        itemBuilder: (context, index) {
          Shoes shoe = shoes[index];
          return CartCard(shoe: shoe);
        },
      ),
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.width / 2.8,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Row(
                children: [
                  Text(
                    "Tổng: ",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  // Text(
                  //   total.toString(),
                  //   style: const TextStyle(
                  //     color: Colors.red,
                  //     fontSize: 24,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // )
                ],
              ),
              const Spacer(),
              // TODO: btn_Thanh Toán
              ElevatedButton(
                style: ButtonStyle(
                  fixedSize: MaterialStatePropertyAll(
                    Size(MediaQuery.of(context).size.width, 60),
                  ),
                  splashFactory: NoSplash.splashFactory,
                  backgroundColor:
                      const MaterialStatePropertyAll(Colors.orange),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed("/checkout");
                },
                child: const Text(
                  'THANH TOÁN',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 4,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
