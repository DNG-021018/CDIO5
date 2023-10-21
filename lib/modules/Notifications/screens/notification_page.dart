import 'package:flutter/material.dart';

import '../model/item.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  List<Item> items = [
    Item(
      headerValue: 'Header 1',
      expandedValue: 'Expanded 1',
      isExpanded: false,
    ),
    Item(
      headerValue: 'Header 2',
      expandedValue: 'Expanded 2',
      isExpanded: false,
    ),
    Item(
      headerValue: 'Header 3',
      expandedValue: 'Expanded 3',
      isExpanded: false,
    ),
  ];
  late Size mediaSize;

  @override
  Widget build(BuildContext context) {
    mediaSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('Thông báo'),
        automaticallyImplyLeading: false,
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
                "Bạn không có thông báo nào",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
      // body: ListView.builder(
      //   itemCount: items.length,
      //   itemBuilder: (BuildContext context, int index) {
      //     return Padding(
      //       padding: const EdgeInsets.symmetric(vertical: 3),
      //       child: ExpansionPanelList(
      //         elevation: 1,
      //         expandedHeaderPadding: EdgeInsets.zero,
      //         expansionCallback: (int itemIndex, bool isExpanded) {
      //           setState(() {
      //             items[itemIndex].isExpanded = !isExpanded;
      //           });
      //         },
      //         children: [
      //           ExpansionPanel(
      //             headerBuilder: (BuildContext context, bool isExpanded) {
      //               return ListTile(
      //                 title: Text(items[index].headerValue.toString()),
      //               );
      //             },
      //             body: ListTile(
      //               title: Text(items[index].expandedValue.toString()),
      //             ),
      //             isExpanded: items[index].isExpanded,
      //           ),
      //         ],
      //       ),
      //     );
      //   },
      // ),
    );
  }
}
