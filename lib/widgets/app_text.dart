import 'package:flutter/material.dart';

class BoldLargeText extends StatelessWidget {
  double size;
  final String text;
  final Color color;

  BoldLargeText({
    Key? key,
    this.size = 27,
    required this.text,
    this.color = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      softWrap: true,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class PrimaryText extends StatelessWidget {
  double size;
  final String text;
  final Color color;

  PrimaryText({
    Key? key,
    this.size = 15,
    required this.text,
    this.color = Colors.black54,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      softWrap: true,
      style: TextStyle(
        color: color,
        fontSize: size,
        overflow: TextOverflow.fade,
      ),
    );
  }
}