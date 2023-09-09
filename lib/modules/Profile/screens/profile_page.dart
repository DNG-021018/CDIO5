import 'package:flutter/material.dart';

import '../widgets/oder_status_row.dart';
import 'account_setting.dart';
import 'order_list_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  late Size mediaSize;
  late int tabController;

  @override
  Widget build(BuildContext context) {
    mediaSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
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
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return ListTile(
                        leading: const Icon(Icons.settings),
                        title: const Text('Thiết lập tài khoản'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AccountSetting(),
                            ),
                          );
                        },
                      );
                    } else if (index == 1) {
                      return ListTile(
                        leading: const Icon(Icons.shopping_cart),
                        title: const Text('Đơn mua'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const OrderListPage(index: 0),
                            ),
                          );
                        },
                      );
                    } else if (index == 2) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: SizedBox(
                          height: mediaSize.height / 11,
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              OrderStatusRow(
                                icon: Icon(Icons.shopping_bag),
                                label: 'Chờ xác nhận',
                                index: 0,
                              ),
                              OrderStatusRow(
                                icon: Icon(Icons.shopping_bag),
                                label: 'Chờ lấy hàng',
                                index: 1,
                              ),
                              OrderStatusRow(
                                icon: Icon(Icons.local_shipping),
                                label: 'Giao hàng',
                                index: 2,
                              ),
                              OrderStatusRow(
                                icon: Icon(Icons.check_circle),
                                label: 'Đánh giá',
                                index: 3,
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                    return const SizedBox.shrink();
                  },
                  separatorBuilder: (context, index) => const Divider(
                    height: 2,
                    color: Colors.grey,
                  ),
                  itemCount: 3,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
