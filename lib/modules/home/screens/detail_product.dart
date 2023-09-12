import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../models/product.dart';

class ProductDetailPage extends StatefulWidget {
  final Product product;
  final List<String> imageUrls;

  const ProductDetailPage(
      {super.key, required this.product, required this.imageUrls});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  String selectedSize = '4';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('Product Detail'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // TODO: Slide ảnh
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
              ),
              child: CarouselSlider(
                options: CarouselOptions(
                  height: MediaQuery.of(context).size.height / 2.5,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: false,
                ),
                items: widget.imageUrls.map((imageUrl) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Image.asset(
                          imageUrl,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 25.0),
            // TODO: Size giày
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Select Size:',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Wrap(
                      spacing: 8.0,
                      children: List.generate(
                        widget.product.productSize.length,
                        (index) => ElevatedButton(
                          onPressed: () {
                            setState(() {
                              selectedSize = widget.product.productSize[index];
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            splashFactory: NoSplash.splashFactory,
                            backgroundColor: selectedSize ==
                                    widget.product.productSize[index]
                                ? Colors.orange
                                : Colors.white,
                          ),
                          child: Text(
                            widget.product.productSize[index],
                            style: TextStyle(
                              fontSize: 16.0,
                              color: selectedSize ==
                                      widget.product.productSize[index]
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                  ],
                ),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // TODO: Tên sản phẩm
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.product.productName,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Size: $selectedSize',
                        style: const TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  // TODO: Giá sản phẩm
                  Text(
                    'Giá: \$${widget.product.productPrice.toStringAsFixed(2)}',
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
