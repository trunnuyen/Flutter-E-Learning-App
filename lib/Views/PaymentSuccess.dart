import 'package:flutter/material.dart';
import 'package:online_learning_app/Widgets/DefaultButton.dart';
import 'package:online_learning_app/Widgets/EmptySection.dart';
import 'package:online_learning_app/Widgets/SubTitle.dart';
import 'package:online_learning_app/public/default.dart';

class Success extends StatefulWidget {
  Success({Key? key}) : super(key: key);

  @override
  _SuccessState createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const EmptySection(
            emptyImg: success,
            emptyMsg: 'Successful !!',
          ),
          const SubTitle(
            subTitleText: 'Your payment was done successfully',
          ),
          DefaultButton(
            btnText: 'Ok',
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }
}
