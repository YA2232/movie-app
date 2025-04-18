import 'package:flutter/material.dart';

class VideoReleaseDataWidget extends StatelessWidget {
  final String releaseDate;
  const VideoReleaseDataWidget({required this.releaseDate, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.calendar_month,
          size: 17,
          color: Colors.grey,
        ),
        Text(' ' + releaseDate)
      ],
    );
  }
}
