import 'package:flutter/material.dart';
import '../Screens/Profile/order_list_page.dart';

class OrderStatusRow extends StatelessWidget {
  final Icon icon;
  final int index;
  final String label;

  const OrderStatusRow({
    super.key,
    required this.icon,
    required this.label,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          splashColor: Colors.transparent,
          splashRadius: 25,
          icon: icon,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OrderListPage(index: index),
              ),
            );
          },
        ),
        Text(
          label,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
