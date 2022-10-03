import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:badges/badges.dart';

import '../theme/color.dart';

class NotificationBox extends StatelessWidget {
  final int notifiedNumber;
  final GestureTapCallback? onTap;

  const NotificationBox({super.key, this.notifiedNumber = 0, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: appBarColor,
            border: Border.all(
              color: primary.withOpacity(.3),
            ),
          ),
          child: notifiedNumber > 0
              ? Badge(
                  badgeColor: actionColor,
                  position: BadgePosition.topEnd(top: 1, end: -2),
                  badgeContent: Text(
                    '',
                    style: TextStyle(color: Colors.white),
                  ),
                  child: SvgPicture.asset(
                    "assets/icons/notification.svg",
                    width: 30,
                    height: 30,
                    color: yellow,
                  ),
                )
              : SvgPicture.asset(
                  "assets/icons/bell.svg",
                  width: 25,
                  height: 25,
                  color: yellow,
                )),
    );
  }
}
