import 'package:flutter/material.dart';

import '../theme/color.dart';

class Attribute extends StatelessWidget {
  Attribute({
    super.key,
    required this.icon,
    required this.data,
    this.color,
  });

  IconData icon;
  String data;
  Color? color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: color = color,
          size: 20,
        ),
        Text(
          data,
          style: const TextStyle(
            color: labelColor,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
