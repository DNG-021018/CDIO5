import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../Models/product.dart';
import '../../Services/home_service.dart';
import '../../Widgets/brand.dart';
import '../../Widgets/gridview_item.dart';
import '../Cart/cart_page.dart';
import '../Notifications/notification_page.dart';
import '../Profile/profile_page.dart';
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
            // Trang "profile"
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
                  brandPage: () {
                    // Navigator.of(context).pushNamed('/brand');
                  },
                ),
                Brand(
                  brandName: "Puma",
                  brandPage: () {
                    // Navigator.of(context).pushNamed('/brand');
                  },
                ),
                Brand(
                  brandName: "Adidas",
                  brandPage: () {
                    // Navigator.of(context).pushNamed('/brand');
                  },
                ),
                Brand(
                  brandName: "Converse",
                  brandPage: () {
                    // Navigator.of(context).pushNamed('/brand');
                  },
                ),
                Brand(
                  brandName: "UnderArmour",
                  brandPage: () {
                    // Navigator.of(context).pushNamed('/brand');
                  },
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
              itemCount: shoe?.length,
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
                    imagesName: shoe![index].img.toString(),
                    productName: shoe![index].name.toString(),
                    productPrice: shoe![index].price.toString(),
                    mediaSize: widget.mediaSize,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
