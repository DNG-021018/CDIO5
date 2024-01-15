import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../Models/product.dart';
import '../../Services/home_service.dart';
import '../../Widgets/gridview_item.dart';

class ProductDetailPage extends StatefulWidget {
  final Shoes shoe;
  final List<String> imageUrls;

  const ProductDetailPage(
      {super.key, required this.shoe, required this.imageUrls});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  String selectedSize = '36';
  List<Shoes>? shoe = [];
  List<Inventory> inventory = [];
  late Size mediaSize;
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

  checkSize(index) {
    if (widget.shoe.inventory[index].size == selectedSize) {
      return true;
    }
    return false;
  }

  checkQuantity(index) {
    bool check = checkSize(index);
    if (check) {
      if (widget.shoe.inventory[index].quantity == 0) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text(
                "Size này không còn hàng",
                style: TextStyle(fontSize: 17),
              ),
              content: const Text(
                  "Vui lòng xem sản phẩm khác hoặc liên hệ với shop."),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("OK"),
                ),
              ],
            );
          },
        );
      } else {
        Navigator.of(context).popAndPushNamed("/checkout");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    mediaSize = MediaQuery.of(context).size;
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
            // TODO: Thông tin giày
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'Mã sản phẩm: ',
                            style: const TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            children: [
                              WidgetSpan(
                                child: GestureDetector(
                                  child: Text(
                                    widget.shoe.id.toString(),
                                    style: const TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'Kho: ',
                            style: const TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            children: [
                              WidgetSpan(
                                child: GestureDetector(
                                  child: Text(
                                    widget.shoe.inventory[0].quantity
                                        .toString(),
                                    style: const TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
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
                        widget.shoe.inventory.length,
                        (index) => ElevatedButton(
                          onPressed: () {
                            setState(() {
                              //TODO: fix
                              selectedSize = widget.shoe.inventory[index].size;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            splashFactory: NoSplash.splashFactory,
                            backgroundColor: selectedSize ==
                                    widget.shoe.inventory[index].size
                                ? Colors.orange
                                : Colors.white,
                          ),
                          child: Text(
                            widget.shoe.inventory[index].size,
                            style: TextStyle(
                              fontSize: 16.0,
                              color: selectedSize ==
                                      widget.shoe.inventory[index].size
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
              height: MediaQuery.of(context).size.height / 4,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // TODO: Chi tiết sản phẩm
                    const Text(
                      'Chi tiết sản phẩm:',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      widget.shoe.description,
                      style: const TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              height: mediaSize.height / 20,
              width: mediaSize.width,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
                color: Colors.white,
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Text(
                      "Gợi ý cho bạn",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Visibility(
              visible: isloaded,
              replacement: const Center(
                child: CircularProgressIndicator(),
              ),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                ),
                itemCount: shoe!.length,
                shrinkWrap: true, // Thêm dòng này
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  List<String> imageUrls = shoe![index]
                      .imgs
                      .map((imageName) => "lib/data/imgs/$imageName")
                      .toList();
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetailPage(
                            shoe: shoe![index],
                            imageUrls: imageUrls,
                          ),
                        ),
                      );
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
                        widget.shoe.name,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        softWrap: false,
                      ),
                      // TODO: Giá sản phẩm
                      Text(
                        'Giá: \$${widget.shoe.price}',
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
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
                      // Xử lý logic khi nhấn nút thêm vào giỏ hàng
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Thêm thành công!'),
                            actions: <Widget>[
                              ElevatedButton(
                                style: const ButtonStyle(
                                  backgroundColor:
                                      MaterialStatePropertyAll(Colors.orange),
                                ),
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
                      Navigator.of(context).pushNamed("/checkout");

                      // Xử lý logic khi nhấn nút thanh toán
                      // checkSize(index);
                      // checkQuantity(index);
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
