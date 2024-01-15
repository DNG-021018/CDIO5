// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../../../core/constants/palette.dart';

class InformationBox extends StatelessWidget {
  const InformationBox({super.key, required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(),
        const SizedBox(height: 20),
        TextField(
          cursorColor: brandColorSecondary,
          decoration: InputDecoration(
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            hintText: label,
            hintStyle: const TextStyle(
              fontSize: 12,
              color: Colors.black,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ],
    );
  }
}
