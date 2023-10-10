import 'package:flutter/material.dart';
import '../../Cart/widgets/cart_card.dart';
import '../../home/models/product.dart';

class ShoppingCartPage extends StatefulWidget {
  const ShoppingCartPage({super.key});

  @override
  State<ShoppingCartPage> createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
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
    var total = Product.totalPrice(products);

    return Scaffold(
      appBar: AppBar(
        title: Text('Giỏ hàng (${products.length})'),
        backgroundColor: Colors.orange,
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        itemCount: products.length, // Số lượng sản phẩm trong giỏ hàng
        itemBuilder: (context, index) {
          Product product = products[index];
          return CartCard(product: product);
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
              Row(
                children: [
                  const Text(
                    "Tổng: ",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    total.toString(),
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  )
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
