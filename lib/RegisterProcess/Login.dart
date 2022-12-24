import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:online_learning_app/public/color.dart';

import '../../Repository/AuthHelper.dart';
import '../../Repository/DBHelper.dart';
import '../../Widgets/RoundButton.dart';
import '../Routes/AppRoutes.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var email = "";
  var password = "";
  var showbar = false;
  var fkey = GlobalKey<FormState>();
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
          child: ModalProgressHUD(
            inAsyncCall: showbar,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Form(
                  key: fkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 100,
                      ),
                      const Text(
                        "Log In",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text("Welcome back to NT-Learning", style: TextStyle(fontSize: 20,color: Colors.white)),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        validator: (val) {
                          if (!AuthHelper.isValidEmail(val!)) {
                            return "Please enter a valid email";
                          }
                          return null;
                        },
                        onChanged: (val) {
                          email = val;
                        },
                        decoration: const InputDecoration(
                            hintText: "Enter Email", label: Text("Email")),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        validator: (val) {
                          if (val!.length < 6) {
                            return "Please enter a long password (atleast 6)";
                          }
                          return null;
                        },
                        onChanged: (val) {
                          password = val;
                        },
                        decoration: const InputDecoration(
                            hintText: "Enter Password",
                            label: Text("Password")),
                        obscureText: true,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      RoundButton(
                          text: "Log In",
                          bacground: primary,
                          foreground: Colors.white,
                          onPressed: () async {
                            if (fkey.currentState!.validate()) {
                              setState(() {
                                showbar = true;
                              });
                              try {
                                final res = await DBHelper.auth
                                    .signInWithEmailAndPassword(
                                        email: email, password: password);
                                if (res.user != null) {
                                  setState(() {
                                    showbar = false;
                                  });
                                  Get.toNamed(AppRoutes.Home);
                                } else {
                                  setState(() {
                                    showbar = false;
                                  });
                                }
                              } on FirebaseAuthException catch (e) {
                                setState(() {
                                  showbar = false;
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text(e.message!)));
                                });
                              }
                            }
                          }),
                      const SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Do not have an account? "),
                          InkWell(
                            onTap: () {
                              Get.toNamed(AppRoutes.Register);
                            },
                            child: const Text(
                              "Register",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Forgot password? "),
                          InkWell(
                            onTap: () {
                              Get.toNamed(AppRoutes.Register);
                            },
                            child: const Text(
                              "Reset",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
