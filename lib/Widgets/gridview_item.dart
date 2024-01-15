import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CardItem extends StatelessWidget {
  const CardItem(
      {super.key,
      required this.imagesName,
      required this.productName,
      required this.productPrice,
      required this.mediaSize});
  final String imagesName;
  final String productName;
  final String productPrice;
  final Size mediaSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(
            Radius.circular(12),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5), // Màu của bóng đổ
              spreadRadius: 2, // Bán kính bóng đổ
              blurRadius: 5, // Độ mờ của bóng đổ
              offset: const Offset(
                  0, 3), // Độ dịch chuyển của bóng đổ (ngang và dọc)
            ),
          ],
        ),
        // TODO: images product
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: mediaSize.height / 6.5,
              width: mediaSize.width,
              child: Image.asset(
                "lib/data/imgs/$imagesName",
                fit: BoxFit.contain,
              ),
            ),
            // TODO: product name
            Padding(
              padding: const EdgeInsets.only(left: 8, top: 10),
              child: Text(
                productName,
                style: const TextStyle(
                  fontSize: 18,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                softWrap: false,
              ),
            ),
            const Spacer(),
            // TODO: product price
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8, bottom: 10),
                  child: Text(
                    "$productPrice\$",
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.orange,
                    ),
                  ),
                ),
                const Spacer(),
                // TODO: add to cart
                InkWell(
                  onTap: () {
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
                  child: Container(
                    height: mediaSize.width / 9,
                    width: mediaSize.width / 9,
                    decoration: const BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(12),
                        topLeft: Radius.circular(12),
                      ),
                    ),
                    child: const Center(
                      child: Icon(
                        FontAwesomeIcons.cartShopping,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
