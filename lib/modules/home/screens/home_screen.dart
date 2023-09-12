import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shoes_shop_app/modules/home/widgets/brand.dart';
import 'package:shoes_shop_app/modules/home/widgets/gridview_item.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../Cart/screens/cart_page.dart';
import '../../Notifications/screens/notification_page.dart';
import '../../Profile/screens/profile_page.dart';
import '../models/product.dart';
import 'detail_product.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Size mediaSize;
  final pageController = PageController();

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    mediaSize = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade300,
        body: IndexedStack(
          index: currentIndex,
          children: [
            // Trang "Home"
            Home(mediaSize: mediaSize, pageController: pageController),
            // Trang "Giỏ hàng"
            const ShoppingCartPage(),
            // Trang "Thông báo"
            const NotificationsPage(),
            // Trang "Tôi"
            const ProfilePage(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          selectedItemColor: Colors.orange,
          unselectedItemColor: Colors.black,
          showUnselectedLabels: true,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.cartShopping),
              label: 'Giỏ hàng',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'Thông báo',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Tôi',
            ),
          ],
        ),
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({
    super.key,
    required this.mediaSize,
    required this.pageController,
  });

  final Size mediaSize;
  final PageController pageController;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Product> products = [
    Product(
      imageName: 'converse',
      imageChild: [
        'converse',
        'Nikey1',
        'adidas',
        'adidas1',
      ],
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
        'Nikey1',
        'adidas',
        'adidas1',
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
      imageName: 'adidas',
      imageChild: [
        'converse',
        'Nikey1',
        'adidas',
        'adidas1',
      ],
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
    Product(
      imageName: 'adidas1',
      imageChild: [
        'converse',
        'Nikey1',
        'adidas',
        'adidas1',
      ],
      productName: 'Adidas in your area',
      productPrice: 24.99,
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
      imageName: 'converse',
      imageChild: [
        'converse',
        'Nikey1',
        'adidas',
        'adidas1',
      ],
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
        'Nikey1',
        'adidas',
        'adidas1',
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
        'Nikey1',
        'adidas',
        'adidas1',
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
    Product(
      imageChild: [
        'converse',
        'Nikey1',
        'adidas',
        'adidas1',
      ],
      imageName: 'adidas1',
      productName: 'Adidas in your area',
      productPrice: 24.99,
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
        'Nikey1',
        'adidas',
        'adidas1',
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
      imageChild: [
        'converse',
        'Nikey1',
        'adidas',
        'adidas1',
      ],
      imageName: 'Nikey1',
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
        'Nikey1',
        'adidas',
        'adidas1',
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
    Product(
      imageChild: [
        'converse',
        'Nikey1',
        'adidas',
        'adidas1',
      ],
      imageName: 'adidas1',
      productName: 'Adidas in your area',
      productPrice: 24.99,
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
        'Nikey1',
        'adidas',
        'adidas1',
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
      imageChild: [
        'converse',
        'Nikey1',
        'adidas',
        'adidas1',
      ],
      imageName: 'Nikey1',
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
        'Nikey1',
        'adidas',
        'adidas1',
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
    Product(
      imageChild: [
        'converse',
        'Nikey1',
        'adidas',
        'adidas1',
      ],
      imageName: 'adidas1',
      productName: 'Adidas in your area',
      productPrice: 24.99,
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
        'Nikey1',
        'adidas',
        'adidas1',
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
      imageChild: [
        'converse',
        'Nikey1',
        'adidas',
        'adidas1',
      ],
      imageName: 'Nikey1',
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
        'Nikey1',
        'adidas',
        'adidas1',
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
    Product(
      imageChild: [
        'converse',
        'Nikey1',
        'adidas',
        'adidas1',
      ],
      imageName: 'adidas1',
      productName: 'Adidas in your area',
      productPrice: 24.99,
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
        '14',
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 18),
            // search + cart
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Center(
                child: Container(
                  color: Colors.white,
                  width: widget.mediaSize.width,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Looking for shoes',
                      hintStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                      // contentPadding: EdgeInsets.all(10),
                      isCollapsed: false,
                    ),
                  ),
                ),
              ),
            ),
          ),
          // TODO: SALES
          Stack(
            alignment: const AlignmentDirectional(0, 0),
            children: [
              SizedBox(
                height: widget.mediaSize.height / 3.9,
                width: widget.mediaSize.width,
                child: PageView(
                  controller: widget.pageController,
                  children: [
                    SizedBox(
                      height: widget.mediaSize.height / 3.9,
                      child: Image.asset(
                        "lib/data/images/sales images/1.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      height: widget.mediaSize.height / 3.9,
                      child: Image.asset(
                        "lib/data/images/sales images/2.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      height: widget.mediaSize.height / 3.9,
                      child: Image.asset(
                        "lib/data/images/sales images/3.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 10,
                child: SmoothPageIndicator(
                  effect: const ScrollingDotsEffect(
                    spacing: 20,
                    dotHeight: 8,
                    dotWidth: 12,
                    activeDotColor: Colors.orange,
                  ),
                  controller: widget.pageController,
                  count: 3,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          // TODO: BRAND
          Container(
            height: widget.mediaSize.height / 20,
            width: widget.mediaSize.width,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Text(
                    "Các hãng giày hàng đầu",
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

          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Brand(
                  brandName: "Nikey",
                  brandPage: () {},
                ),
                Brand(
                  brandName: "Puma",
                  brandPage: () {},
                ),
                Brand(
                  brandName: "Adidas",
                  brandPage: () {},
                ),
                Brand(
                  brandName: "Converse",
                  brandPage: () {},
                ),
                Brand(
                  brandName: "UnderArmour",
                  brandPage: () {},
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          // TODO: GỢI Ý CHO BẠN
          Container(
            height: widget.mediaSize.height / 20,
            width: widget.mediaSize.width,
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
          // TODO: SẢN PHẨM
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.8,
            ),
            itemCount: products.length,
            shrinkWrap: true, // Thêm dòng này
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              Product product = products[index];

              List<String> imageUrls = product.imageChild
                  .map((imageName) =>
                      "lib/data/images/shoes images/$imageName.png")
                  .toList();

              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetailPage(
                          product: product, imageUrls: imageUrls),
                    ),
                  );
                },
                child: CardItem(
                  imagesName: product.imageName,
                  productName: product.productName,
                  productPrice: product.productPrice.toString(),
                  mediaSize: widget.mediaSize,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
