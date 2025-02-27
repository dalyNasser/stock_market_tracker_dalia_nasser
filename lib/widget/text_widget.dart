import 'package:flutter/material.dart';


class TextWidget extends StatelessWidget {
  const TextWidget(
      {super.key,
      required this.text,
      this.txt_size = 14,
      this.font_color = Colors.black});

  final String text;
  final double txt_size;
  final Color font_color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: font_color,
        fontSize: txt_size,
      ),
    );
  }
}
