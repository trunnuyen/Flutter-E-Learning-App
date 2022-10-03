import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../theme/color.dart';

class BottomBarItem extends StatelessWidget {
  final String asset;
  final Color activeColor;
  final Color defaultColor;
  bool isActive;
  final GestureTapCallback? onTap;

  BottomBarItem(
      {Key? key,
      required this.asset,
      this.activeColor = primary,
      this.defaultColor = blue,
      this.isActive = false,
      this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(7),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: bottomBarColor,
          boxShadow: [
            if (isActive)
              BoxShadow(
                color: shadowColor.withOpacity(.1),
                spreadRadius: 2,
                blurRadius: 2,
                offset: const Offset(0, 0),
              ),
          ],
        ),
        child: SvgPicture.asset(asset,
            color: isActive ? activeColor : defaultColor),
      ),
    );
  }
}
