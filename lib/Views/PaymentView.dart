import 'package:online_learning_app/Views/PaymentSuccess.dart';
import 'package:online_learning_app/Widgets/BackButton.dart';
import 'package:online_learning_app/Widgets/DefaultButton.dart';
import 'package:online_learning_app/public/color.dart';
import 'package:online_learning_app/public/default.dart';
import 'package:online_learning_app/widgets/headerLabel.dart';
import 'package:flutter/material.dart';

class Payment extends StatefulWidget {
  Payment({Key? key}) : super(key: key);

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  int value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Payment',
          style: TextStyle(
            color: primary,
          ),
        ),
        leading: const DefaultBackButton(),
      ),
      body: Column(
        children: [
          const HeaderLabel(
            headerText: 'Choose your payment method',
          ),
          Expanded(
            child: ListView.separated(
              itemCount: paymentLabels.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Radio(
                    activeColor: primary,
                    value: index,
                    groupValue: value,
                    onChanged: (i) => setState(() => value = i as int),
                  ),
                  title: Text(
                    paymentLabels[index],
                    style: const TextStyle(color: labelColor),
                  ),
                  trailing: Icon(paymentIcons[index], color: primary),
                );
              },
              separatorBuilder: (context, index) {
                return Divider();
              },
            ),
          ),
          DefaultButton(
            btnText: 'Pay',
            onPressed: () => Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => Success(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
