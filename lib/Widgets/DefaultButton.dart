import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final String btnText;
  final Function onPressed;
  const DefaultButton({
    Key? key,
    required this.btnText,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: TextButton(
        onPressed: onPressed(),
        child: Text(btnText.toUpperCase()),
      ),
    );
  }
}
