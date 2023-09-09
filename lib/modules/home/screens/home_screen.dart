// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:badges/badges.dart' as badges;
import 'package:shoes_shop_app/modules/home/widgets/brand.dart';
import 'package:shoes_shop_app/modules/home/widgets/gridview_item.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../Cart/screens/cart_page.dart';
import '../../Notifications/screens/notification_page.dart';
import '../../Profile/screens/profile_page.dart';
import '../models/product.dart';

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
          items: [
            const BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: badges.Badge(
                showBadge: true,
                ignorePointer: false,
                badgeContent: const Text("3"),
                onTap: () {},
                child: const Icon(FontAwesomeIcons.cartShopping),
              ),
              label: 'Giỏ hàng',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'Thông báo',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Tôi',
            ),
          ],
        ),
      ),
    );
  }
}

class Home extends StatelessWidget {
  Home({
    super.key,
    required this.mediaSize,
    required this.pageController,
  });

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
    Product(
      imageName: 'adidas1',
      productName: 'Adidas in your area',
      productPrice: 24.99,
    ),
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
    Product(
      imageName: 'adidas1',
      productName: 'Adidas in your area',
      productPrice: 24.99,
    ),
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
    Product(
      imageName: 'adidas1',
      productName: 'Adidas in your area',
      productPrice: 24.99,
    ),
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
    Product(
      imageName: 'adidas1',
      productName: 'Adidas in your area',
      productPrice: 24.99,
    ),
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
    Product(
      imageName: 'adidas1',
      productName: 'Adidas in your area',
      productPrice: 24.99,
    ),
  ];
  final Size mediaSize;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 18),
            // search + cart
            child: Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                // TODO: search bar
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Center(
                    child: Container(
                      color: Colors.white,
                      width: mediaSize.width / 1.3,
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
                const Spacer(),
                // TODO: cart
                badges.Badge(
                  showBadge: true,
                  ignorePointer: false,
                  badgeContent: const Text("3"),
                  onTap: () {},
                  child: const Icon(FontAwesomeIcons.cartShopping),
                ),
              ],
            ),
          ),
          // TODO: SALES
          Stack(
            alignment: const AlignmentDirectional(0, 0),
            children: [
              SizedBox(
                height: mediaSize.height / 3.9,
                width: mediaSize.width,
                child: PageView(
                  controller: pageController,
                  children: [
                    SizedBox(
                      height: mediaSize.height / 3.9,
                      child: Image.asset(
                        "lib/data/images/sales images/1.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      height: mediaSize.height / 3.9,
                      child: Image.asset(
                        "lib/data/images/sales images/2.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      height: mediaSize.height / 3.9,
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
                  controller: pageController,
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
            height: mediaSize.height / 20,
            width: mediaSize.width,
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
              return CardItem(
                imagesName: product.imageName,
                productName: product.productName,
                productPrice: product.productPrice.toString(),
                mediaSize: mediaSize,
              );
            },
          ),
        ],
      ),
    );
  }
}
