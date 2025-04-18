import 'package:flutter/material.dart';

class VideoVoateWidget extends StatelessWidget {
  final double voateAvreage;
  const VideoVoateWidget({required this.voateAvreage, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.star,
          color: Colors.amber,
          size: 17,
        ),
        SizedBox(
          width: 6,
        ),
        Text(voateAvreage.toStringAsFixed(1))
      ],
    );
  }
}
