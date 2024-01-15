import 'package:flutter/material.dart';

import '../../Models/product.dart';
import '../../Services/home_service.dart';
import '../../Widgets/gridview_item.dart';

class MyBrand extends StatefulWidget {
  const MyBrand({super.key});

  @override
  State<MyBrand> createState() => _MyBrandState();
}

class _MyBrandState extends State<MyBrand> {
  List<Shoes>? shoe;
  var isloaded = false;

  @override
  void initState() {
    getPost();
    super.initState();
  }

  getPost() async {
    shoe = await ProductService().fetch();
    if (shoe != null) {
      isloaded = true;
    }
  }

  late Size mediaSize;
  @override
  Widget build(BuildContext context) {
    mediaSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('Top brand'),
      ),
      body: SingleChildScrollView(
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.8,
          ),
          itemCount: shoe?.length,
          shrinkWrap: true, // Thêm dòng này
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            // List<String> imageUrls = shoe![index]
            //     .imgs
            //     .map((imageName) =>
            //         "lib/data/images/shoes images/$imageName.png")
            //     .toList();
            return InkWell(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => ProductDetailPage(
                //       shoe: shoe![index],
                //       imageUrls: imageUrls,
                //     ),
                //   ),
                // );
              },
              child: CardItem(
                imagesName: shoe![index].img,
                productName: shoe![index].name.toString(),
                productPrice: shoe![index].price.toString(),
                mediaSize: mediaSize,
              ),
            );
          },
        ),
      ),
    );
  }
}
