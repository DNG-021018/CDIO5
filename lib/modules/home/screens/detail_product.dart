import 'package:flutter/material.dart';

import '../models/product.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('Product Detail'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                children: [
                  // TODO: Hình ảnh sản phẩm
                  Image.asset(
                    "lib/data/images/shoes images/${product.imageName}.png",
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 3,
                    fit: BoxFit.cover,
                  ),
                  const Divider(
                    color: Colors.grey,
                    height: 1,
                  ),
                  const SizedBox(
                    height: 100,
                  )
                ],
              ),
            ),
            const SizedBox(height: 25.0),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // TODO: Chi tiết sản phẩm
                    Text(
                      'Chi tiết sản phẩm:',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      "Lorem ipsum, aurum haec dimitto. Consurgo cibo duo crux damno caput eximietate passim pello. He malus longe. Civis detineo sic. Cui archa obruo. Quae ratum reus ita, doleo rei. Horum minus, maior legis magis, placitum veni. Fors, approbo frux latus.Consisto, facio proficio tibi illas. Pono siligo purgatio infitialis. Multus virgo depulso permissi mos adeo vera. Quies leviculus esse vere.",
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      // TODO: btn
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.width / 2.8,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
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
                  // TODO: Tên sản phẩm
                  Text(
                    product.productName,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  // TODO: Giá sản phẩm
                  Text(
                    'Giá: \$${product.productPrice.toStringAsFixed(2)}',
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              const Spacer(),
              // TODO: btn_Thêm vào giỏ hàng
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      fixedSize: MaterialStatePropertyAll(
                        Size(MediaQuery.of(context).size.width / 2.2, 50),
                      ),
                      splashFactory: NoSplash.splashFactory,
                      backgroundColor:
                          const MaterialStatePropertyAll(Colors.green),
                    ),
                    onPressed: () {
                      // Xử lý logic khi nhấn nút thanh toán
                    },
                    child: const Text(
                      'THÊM VÀO GIỎ HÀNG',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // TODO: btn_Thanh Toán

                  ElevatedButton(
                    style: ButtonStyle(
                      fixedSize: MaterialStatePropertyAll(
                        Size(MediaQuery.of(context).size.width / 2.2, 50),
                      ),
                      splashFactory: NoSplash.splashFactory,
                      backgroundColor:
                          const MaterialStatePropertyAll(Colors.orange),
                    ),
                    onPressed: () {
                      // Xử lý logic khi nhấn nút thanh toán
                    },
                    child: const Text(
                      'THANH TOÁN NGAY',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
