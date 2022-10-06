import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../theme/color.dart';

class BookmarkBox extends StatelessWidget {
  final GestureTapCallback? onTap;
  final bool isBookmarked;
  const BookmarkBox({super.key, required this.onTap, required this.isBookmarked});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isBookmarked ? primary : Colors.white,
          border: Border.all(color: isBookmarked ? Colors.white : blue),
        ),
        child: Center(
            child: SvgPicture.asset(
          "assets/icons/bookmark.svg",
          height: 25,
          width: 25,
          color: isBookmarked ? Colors.white : blue,
        )),
      ),
    );
  }
}
