import 'package:flutter/material.dart';
import 'package:online_learning_app/view/screens/root_app.dart';
import 'view/auth/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: RootApp());
  }
}
