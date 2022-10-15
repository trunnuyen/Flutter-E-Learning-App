import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final String imgUrl;

  const Avatar({super.key, required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.blue.withOpacity(.3),
        ),
      ),
      child: ClipOval(
        child: SizedBox.fromSize(
          size: const Size.fromRadius(20),
          child: Image.network(
            imgUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
