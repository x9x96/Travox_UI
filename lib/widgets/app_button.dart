import 'package:flutter/material.dart';

import '../utils/colors.dart';
import 'app_text.dart';

class AppButton extends StatelessWidget {
  final Color icon_text_Color;
  final Color backgroundColor;
  double size;
  final Color borderColor;
  String? text;
  IconData? icon;
  bool? isIcon;

  AppButton({
    Key? key,
    required this.size,
    required this.icon_text_Color,
    required this.backgroundColor,
    required this.borderColor,
    this.text = "",
    this.icon,
    this.isIcon = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: 3),
        borderRadius: BorderRadius.circular(10),
        color: backgroundColor,
      ),
      child: isIcon==false?Center(child: PrimaryText(text: text!, color: icon_text_Color,)):
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),

          child: Center(child: Icon(icon, color: icon_text_Color,))),
    );
  }
}
