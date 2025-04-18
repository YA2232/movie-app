import 'package:flutter/material.dart';

class CategoryText extends StatelessWidget {
  final String text;
  CategoryText({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 15),
      child: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
      ),
    );
  }
}
