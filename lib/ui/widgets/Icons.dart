import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  final IconData iconD;
  final Color iconColor;
  final double tam;
  AppIcon(
      {Key? key, required this.iconD, required this.iconColor, this.tam = 40})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: tam,
      height: tam,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(tam / 2)
          // BoxDecoration
          ),
      child: Icon(iconD, color: iconColor, size: 20),
    );
  }
}
