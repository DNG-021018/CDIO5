import 'package:flutter/material.dart';

import '../../home/models/product.dart';

class ShoppingCartPage extends StatefulWidget {
  const ShoppingCartPage({super.key});

  @override
  State<ShoppingCartPage> createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  List<Product> products = [
    Product(
      imageName: 'converse',
      productName: 'Converse in 1975',
      productPrice: 19.99,
    ),
    Product(
      imageName: 'Nikey1',
      productName: 'Nikey mix color',
      productPrice: 29.99,
    ),
    Product(
      imageName: 'adidas',
      productName: 'Adidas white',
      productPrice: 14.99,
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
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(
                  Radius.circular(12),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage(
                      "lib/data/images/shoes images/${product.imageName}.png"),
                  radius: 30,
                ),
                title: Text(product.productName),
                subtitle: const Text("Size 36"),
                trailing: Text(product.productPrice.toString()),
              ),
            ),
          );
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
                  // Xử lý logic khi nhấn nút thanh toán
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
