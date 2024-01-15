import 'package:flutter/material.dart';

class AnotherLogin extends StatelessWidget {
  const AnotherLogin(
      {super.key, required this.logoName, required this.thirdPlace});
  final String logoName;
  final void Function() thirdPlace;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black87,
            blurRadius: 2,
          ),
        ],
      ),
      child: Material(
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          onTap: thirdPlace,
          borderRadius: BorderRadius.circular(10),
          child: Center(
            child: Image.asset(
              "lib/data/images/logo/$logoName.png",
              height: 30,
            ),
          ),
        ),
      ),
    );
  }
}
