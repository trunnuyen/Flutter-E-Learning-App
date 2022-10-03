import 'package:flutter/material.dart';

class GreetingBoxIcon extends StatelessWidget {
  final String grettingText;
  const GreetingBoxIcon({super.key, required this.grettingText});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.yellow.withOpacity(.3),
        ),
      ),
      child: ClipOval(
        child: SizedBox.fromSize(
          size: const Size.fromRadius(15),
          child: getGreetingIcon(grettingText),
        ),
      ),
    );
  }

  Widget getGreetingIcon(String greetingText) {
    return Image.asset(
      (() {
        if (greetingText == 'Good Morning') {
          return "assets/images/sunrise.png";
        }
        if (greetingText == 'Good Afternoon') {
          return "assets/images/sunsets.png";
        }
        if (greetingText == 'Good Evening') {
          return "assets/images/evening.png";
        }
        if (greetingText == 'Good Night') {
          return "assets/images/night.png";
        }
        return "assets/images/smile.png";
      })(),
      fit: BoxFit.cover,
    );
  }
}
