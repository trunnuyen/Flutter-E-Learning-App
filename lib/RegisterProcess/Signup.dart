import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:http/http.dart' as http;
import 'package:online_learning_app/public/api.dart';
import 'package:online_learning_app/public/color.dart';

import '../Models/User.dart';
import '../Repository/AuthHelper.dart';
import '../Repository/DBHelper.dart';
import '../Routes/AppRoutes.dart';
import '../Widgets/RoundButton.dart';

class Signup extends StatefulWidget {
  Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  var name = "";
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
                        "Sign Up",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text("Create an account. It's free",
                          style: TextStyle(fontSize: 20, color: Colors.white)),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        validator: (val) {
                          if (val!.length < 6) {
                            return "Please enter a long name (atleast 6 chars)";
                          }
                          return null;
                        },
                        onChanged: (val) {
                          name = val;
                        },
                        decoration: const InputDecoration(
                            hintText: "Enter Name", label: Text("Name")),
                      ),
                      const SizedBox(
                        height: 5,
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
                          text: "Register",
                          bacground: primary,
                          foreground: Colors.white,
                          onPressed: () async {
                            if (fkey.currentState!.validate()) {
                              setState(() {
                                showbar = true;
                              });
                              try {
                                final res = await DBHelper.auth
                                    .createUserWithEmailAndPassword(
                                        email: email, password: password);
                                if (res.user != null) {
                                  var newuser = Users(
                                      key: res.user!.uid,
                                      Name: name,
                                      Email: email,
                                      Password: password);
                                  await DBHelper.db
                                      .collection("Users")
                                      .add(newuser.toMap());
                                  setState(() {
                                    showbar = false;
                                  });
                                  signUpDatabase(res.user!.uid);
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
                          const Text("Already have an account? "),
                          InkWell(
                            onTap: () {
                              Get.toNamed(AppRoutes.Login);
                            },
                            child: const Text(
                              "Log In",
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

  Future signUpDatabase(var key) async {
    var url = "$baseApi/online_learning_api/register.php";
    var token = await FirebaseMessaging.instance.getToken();
    print(token);
    var response = await http.post(Uri.parse(url), body: {
      "first_name": name,
      "last_name": '',
      "email": email,
      "password": password,
      "firebase_id": key,
      "firebase_token": token,
    });
    var data = json.decode(response.body);
    if (data == "Success") {
      Get.snackbar(
        "Success",
        "Welcome",
        icon: const Icon(Icons.person, color: Colors.blue),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
