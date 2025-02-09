import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String data;
  final Color? color;
  final double size;
  final FontWeight? weight;
  final TextDecoration? decoration;
  const CustomText({
    super.key,
    required this.data,
    this.color,
    required this.size,
    this.weight, this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(
          color: color,
          fontSize: size,
          fontWeight: weight,
          overflow: TextOverflow.clip,
          decoration: decoration),
    );
  }
}
