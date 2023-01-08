import 'package:flutter/material.dart';
import 'package:online_learning_app/public/color.dart';

class HeaderLabel extends StatelessWidget {
  final String headerText;
  const HeaderLabel({
    Key? key,
    required this.headerText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Text(
        headerText,
        style: const TextStyle(color: primary, fontSize: 28.0),
      ),
    );
  }
}
