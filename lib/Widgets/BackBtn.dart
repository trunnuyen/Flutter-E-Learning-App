import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Icon.dart';

class BackBtn extends StatelessWidget {
  const BackBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.back();
      },
      child: online_learning_appIcon(
          myicon: Icons.arrow_back,
          background: Colors.grey.shade200,
          foreground: Colors.blue),
    );
  }
}
