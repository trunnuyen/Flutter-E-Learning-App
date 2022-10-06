import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';

import '../theme/color.dart';

class ExploreCategory extends StatelessWidget {
  final data;
  bool isActive = false;
  final GestureTapCallback? onTap;

  ExploreCategory(
      {super.key, required this.data, required this.isActive, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: AnimatedContainer(
          duration: const Duration(milliseconds:100),
          curve: Curves.linear,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: isActive ? primary : Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: shadowColor.withOpacity(.1),
                blurRadius: .5,
                spreadRadius: .5,
                offset: const Offset(1, 1),
              ),
            ],
          ),
          child: Row(
            children: [
              SvgPicture.asset(data["icon"],
                  width: 20,
                  height: 20,
                  color: isActive ? Colors.white : blue),
              const SizedBox(
                width: 5,
              ),
              Text(
                data["name"],
                maxLines: 1,
                overflow: TextOverflow.fade,
                style: TextStyle(
                  color: isActive ? Colors.white : blue,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
