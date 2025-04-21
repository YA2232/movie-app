import 'package:flutter/material.dart';
import 'package:movie_app/core/config/theme/app_color.dart';
import 'package:movie_app/core/extensions/extensions.dart';

class BasicAppbar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final Widget? action;
  final Color? backgroundColor;
  final bool hideBack;
  final bool centerTitle;
  final double? height;
  const BasicAppbar(
      {this.title,
      this.hideBack = false,
      this.centerTitle = false,
      this.action,
      this.backgroundColor,
      this.height,
      super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? Colors.transparent,
      elevation: 0,
      centerTitle: centerTitle,
      automaticallyImplyLeading: false,
      toolbarHeight: height ?? 80,
      title: title ?? const Text(''),
      titleSpacing: 0,
      actions: [action ?? Container()],
      leading: hideBack
          ? null
          : IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    color: context.isDarkMode
                        ? AppColor.secondaryBackGround
                        : Colors.grey,
                    shape: BoxShape.circle),
                child: const Icon(Icons.arrow_back_ios_new,
                    size: 15, color: Colors.white),
              ),
            ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height ?? 80);
}
