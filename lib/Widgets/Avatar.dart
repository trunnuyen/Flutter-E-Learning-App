import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final String imgUrl;
  final double size;

  const Avatar({super.key, required this.imgUrl, required this.size});

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
          size: Size.fromRadius(size),
          child: Image.network(
            imgUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
