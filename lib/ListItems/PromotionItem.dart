import 'package:cached_network_image/cached_network_image.dart';
import 'package:online_learning_app/Models/Course.dart';
import 'package:online_learning_app/public/default.dart';
import 'package:flutter/material.dart';

class PromotionItem extends StatelessWidget {
  Course course;
  PromotionItem({Key? key, required this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.loose,
      children: [
        Card(
          clipBehavior: Clip.hardEdge,
          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: SizedBox(
            width: 300,
            height: 200,
            child: CachedNetworkImage(
              imageUrl: course.imageurl ?? defaultCourseThumbnail,
              fit: BoxFit.fill,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.fromLTRB(160, 10, 20, 145),
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.red,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.sell_rounded, color: Colors.white),
              Text(
                overflow: TextOverflow.ellipsis,
                '${course.discountedPercent}%',
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
