import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movie_app/core/config/theme/app_color.dart';

class SelectableOption extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback opTap;
  const SelectableOption(
      {super.key,
      required this.title,
      required this.isSelected,
      required this.opTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: opTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: isSelected ? AppColor.primary : AppColor.background),
        child: Text(
          title,
          style: TextStyle(color: Colors.white, fontSize: 17),
        ),
      ),
    );
  }
}
