import 'package:online_learning_app/Routes/AppRoutes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_learning_app/public/color.dart';
import '../Widgets/RoundButton.dart';

class Selector extends StatelessWidget {
  const Selector({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "NT-Learning",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Your learning is our earning",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                const SizedBox(
                  height: 300,
                ),
                RoundButton(
                  text: "Login",
                  bacground: Colors.white,
                  foreground: primary,
                  onPressed: () {
                    Get.toNamed(AppRoutes.Login);
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                RoundButton(
                  text: "Sign Up",
                  bacground: primary,
                  foreground: Colors.white,
                  onPressed: () {
                    Get.toNamed(AppRoutes.Register);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
