import 'package:flutter/material.dart';

class OrderListPage extends StatefulWidget {
  const OrderListPage({super.key, required this.index});
  final int index;

  @override
  State<OrderListPage> createState() => _OrderListPageState();
}

class _OrderListPageState extends State<OrderListPage> {
  late Size mediaSize;

  @override
  Widget build(BuildContext context) {
    mediaSize = MediaQuery.of(context).size;
    return DefaultTabController(
      initialIndex: widget.index,
      length: 4, // Số lượng tab
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Đơn hàng'),
          backgroundColor: Colors.orange,
          bottom: const TabBar(
            labelPadding: EdgeInsets.symmetric(horizontal: 8),
            labelStyle: TextStyle(
              fontWeight: FontWeight.bold,
            ),
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
        body: Container(
          width: mediaSize.width,
          height: mediaSize.height,
          decoration: BoxDecoration(
            color: Colors.grey[300],
          ),
          child: Stack(
            alignment: const Alignment(0, 0),
            children: [
              Positioned(
                top: 50,
                child: Image.asset(
                  "lib/data/images/logo/brandShop.png",
                ),
              ),
              const Positioned(
                top: 450,
                child: Text(
                  "Bạn không có đơn hàng nào",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
        // body: Center(
        //   child: Container(
        //     width: mediaSize.width,
        //     decoration: BoxDecoration(
        //       color: Colors.grey[300],
        //     ),
        //     child: Column(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: [
        //         Image.asset("lib/data/images/logo/order_status.png"),
        //         const Text("Chưa có đơn hàng"),
        //       ],
        //     ),
        //     // child: const TabBarView(
        //     //   children: [
        //     //     Text("OK1"),
        //     //     Text("OK2"),
        //     //     Text("OK3"),
        //     //     Text("OK4"),
        //     //   ],
        //     // ),
        //   ),
        // ),
      ),
    );
  }
}
