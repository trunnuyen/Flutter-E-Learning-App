import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:online_learning_app/view/auth/register.dart';
import 'package:online_learning_app/view/screens/root_app.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LoginState();
  }
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

  bool _passVisibility = true;

  Future login(BuildContext context) async {
    var url = "http://10.0.158.27/online_learning_api/login.php";
    var response = await http.post(Uri.parse(url), body: {
      "email": email.text,
      "password": pass.text,
    });
    var data = json.decode(response.body);
    print('$data');
    print(email.text + pass.text);
    if (data == "Success") {
      Fluttertoast.showToast(msg: 'Success');
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => RootApp()),
      );
    } else {
      Fluttertoast.showToast(msg: 'Error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          constraints: const BoxConstraints.expand(),
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 40, 0, 40),
                  child: Container(
                      width: 70,
                      height: 70,
                      padding: const EdgeInsets.all(15),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: FlutterLogo()),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 60),
                  child: Text(
                    "Hello \nWelcome back",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 30,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                  child: TextField(
                      controller: email,
                      style: const TextStyle(fontSize: 18, color: Colors.black),
                      decoration: const InputDecoration(
                        labelText: 'EMAIL',
                        labelStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                  child: Stack(
                      alignment: AlignmentDirectional.centerEnd,
                      children: <Widget>[
                        TextField(
                            controller: pass,
                            obscureText: _passVisibility,
                            style: const TextStyle(
                                fontSize: 18, color: Colors.black),
                            decoration: const InputDecoration(
                              labelText: 'PASSWORD',
                              labelStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                              ),
                            )),
                        InkWell(
                          onTap: () {
                            setState(() {
                              _passVisibility = !_passVisibility;
                            });
                          },
                          child: Text(
                            _passVisibility ? 'SHOW' : 'HIDE',
                            style: const TextStyle(
                                color: Colors.blueAccent,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ]),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.resolveWith<
                                OutlinedBorder>((_) {
                              return RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20));
                            }),
                            backgroundColor:
                                MaterialStateProperty.resolveWith<Color>(
                                    (states) => Colors.blueAccent),
                          ),
                          child: const Text(
                            'SIGN IN',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          onPressed: () {
                            login(context);
                          })),
                ),
                Container(
                    height: 200,
                    width: double.infinity,
                    alignment: Alignment.bottomCenter,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          InkWell(
                              child: const Text(
                                'NEW USER? SIGN UP',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.blueAccent),
                              ),
                              onTap: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const SignUp()),
                                );
                              }),
                          const Text(
                            'FORGOT PASSWORD',
                            style: TextStyle(
                                fontSize: 15, color: Colors.blueAccent),
                          ),
                        ]))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
