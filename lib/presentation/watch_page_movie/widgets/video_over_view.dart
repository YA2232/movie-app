import 'package:flutter/material.dart';

class VideoOverView extends StatelessWidget {
  final String overView;
  const VideoOverView({required this.overView, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(overView);
  }
}
