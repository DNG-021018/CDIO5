import 'package:flutter/material.dart';

class OrderListPage extends StatelessWidget {
  const OrderListPage({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: index,
      length: 4, // Số lượng tab
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Đơn hàng'),
          bottom: const TabBar(
            labelPadding: EdgeInsets.symmetric(horizontal: 8),
            tabs: [
              Tab(
                text: 'Chờ xác nhận',
              ),
              Tab(
                text: 'Chờ lấy hàng',
              ),
              Tab(
                text: 'Đang giao',
              ),
              Tab(
                text: 'Đánh giá',
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Text("OK1"),
            Text("OK2"),
            Text("OK3"),
            Text("OK4"),
          ],
        ),
      ),
    );
  }
}
