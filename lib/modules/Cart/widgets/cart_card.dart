import 'package:flutter/material.dart';

import '../../home/models/product.dart';

class CartCard extends StatelessWidget {
  const CartCard({
    super.key,
    required this.product,
  });

  final Product product;

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
            backgroundImage: AssetImage(
                "lib/data/images/shoes images/${product.imageName}.png"),
            radius: 30,
          ),
          title: Text(product.productName),
          subtitle: const Text("Size 36"),
          trailing: Text(product.productPrice.toString()),
        ),
      ),
    );
  }
}
