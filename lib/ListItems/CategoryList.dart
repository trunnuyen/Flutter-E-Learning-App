import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:online_learning_app/Models/Category.dart';
import 'package:online_learning_app/public/color.dart';
import 'package:online_learning_app/public/default.dart';

class ExploreCategory extends StatelessWidget {
  final Category category;
  bool isActive = false;
  final GestureTapCallback? onTap;

  ExploreCategory(
      {super.key, required this.category, required this.isActive, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 100),
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
              CachedNetworkImage(
                imageUrl: category.thumbnail ?? defaultCategoryThumbnail,
                width: 15,
                height: 15,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                category.name!,
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
