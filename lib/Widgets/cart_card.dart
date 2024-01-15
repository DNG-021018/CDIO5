import 'package:flutter/material.dart';

import '../Models/product.dart';

class CartCard extends StatelessWidget {
  const CartCard({
    super.key,
    required this.shoe,
  });

  final Shoes shoe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
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
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.transparent,
            backgroundImage: AssetImage("lib/data/imgs/${shoe.img}"),
            radius: 30,
          ),
          title: Text(shoe.name),
          subtitle: const Text("Size 36"),
          trailing: Text(shoe.price.toString()),
        ),
      ),
    );
  }
}
