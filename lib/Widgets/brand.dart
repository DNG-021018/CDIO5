import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Brand extends StatelessWidget {
  const Brand({super.key, required this.brandName, required this.brandPage});
  final String brandName;
  final void Function() brandPage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          border: Border.all(width: 1),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: brandPage,
            child: SvgPicture.asset(
              "lib/data/SVG/$brandName.svg",
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
