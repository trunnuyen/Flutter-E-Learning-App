import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online_learning_app/view/theme/color.dart';

class CategoryBox extends StatelessWidget {
  final data;
  CategoryBox({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: shadowColor.withOpacity(.1),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: const Offset(1, 1),
                ),
              ],
            ),
            child: SvgPicture.asset(data["icon"], width: 30, height: 30, color: blue),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            data["name"],
            maxLines: 1,
            overflow: TextOverflow.fade,
            style: const TextStyle(
              color: textColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
