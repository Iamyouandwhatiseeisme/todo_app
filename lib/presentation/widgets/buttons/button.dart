import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Function onPressed;
  final double width;
  final double height;
  final Color color;
  final String title;
  const Button({
    super.key,
    required this.onPressed,
    required this.width,
    required this.height,
    required this.color,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed(),
      child: Container(
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(4)),
          height: height,
          width: width,
          child: Center(
              child: Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ))),
    );
  }
}
