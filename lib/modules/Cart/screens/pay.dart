import 'package:flutter/material.dart';

import '../widgets/cart_card.dart';
import '../../home/models/product.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({super.key});

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  List<Product> products = [
    Product(
      imageChild: [
        'converse',
        'Nikey1'
            'adidas'
            'adidas1'
      ],
      imageName: 'converse',
      productName: 'Converse in 1975',
      productPrice: 19.99,
      productSize: [
        '4',
        '4.5',
        '5',
        '5.5',
        '6',
        '6.5',
        '7',
        '7.5',
        '8',
        '8.5',
        '9',
        '9.5',
        '10',
        '10.5',
        '11',
        '11.5',
        '12',
        '12.5',
        '13',
        '13.5',
        '14'
      ],
    ),
    Product(
      imageName: 'Nikey1',
      imageChild: [
        'converse',
        'Nikey1'
            'adidas'
            'adidas1'
      ],
      productName: 'Nikey mix color',
      productPrice: 29.99,
      productSize: [
        '4',
        '4.5',
        '5',
        '5.5',
        '6',
        '6.5',
        '7',
        '7.5',
        '8',
        '8.5',
        '9',
        '9.5',
        '10',
        '10.5',
        '11',
        '11.5',
        '12',
        '12.5',
        '13',
        '13.5',
        '14'
      ],
    ),
    Product(
      imageChild: [
        'converse',
        'Nikey1'
            'adidas'
            'adidas1'
      ],
      imageName: 'adidas',
      productName: 'Adidas white',
      productPrice: 14.99,
      productSize: [
        '4',
        '4.5',
        '5',
        '5.5',
        '6',
        '6.5',
        '7',
        '7.5',
        '8',
        '8.5',
        '9',
        '9.5',
        '10',
        '10.5',
        '11',
        '11.5',
        '12',
        '12.5',
        '13',
        '13.5',
        '14'
      ],
    ),
  ];
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
            Container(
              decoration: const BoxDecoration(
                color: Colors.amber,
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("data"),
                ],
              ),
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: products.length,
              itemBuilder: (BuildContext context, int index) {
                Product product = products[index];
                return CartCard(product: product);
              },
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.amber,
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("data"),
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
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Thanh toán thành công!'),
                  actions: <Widget>[
                    ElevatedButton(
                      child: const Text('OK'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
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
