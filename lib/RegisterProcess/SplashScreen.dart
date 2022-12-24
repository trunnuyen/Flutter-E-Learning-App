import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:online_learning_app/Repository/DBHelper.dart';
import 'package:online_learning_app/Routes/AppRoutes.dart';
import 'package:online_learning_app/public/color.dart';
import 'package:online_learning_app/public/default.dart';

class SplashScreen extends GetView {
  SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (DBHelper.auth.currentUser != null) {
      Future.delayed(const Duration(milliseconds: 4000), () {
        Get.toNamed(AppRoutes.Home);
      });
    } else {
      Future.delayed(const Duration(milliseconds: 4000), () {
        Get.toNamed(AppRoutes.Selector);
      });
    }
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Lottie.asset(
              defaultSplashAnimated,
            ),
            const Text(
              'NT-Learning',
              style: TextStyle(
                fontSize: 50,
                color: primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
