import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../theme/color.dart';

class CourseRecommend extends StatelessWidget {
  final data;
  const CourseRecommend({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, bottom: 10, right: 5,),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: shadowColor.withOpacity(.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(1, 1),
            ),
          ],
        ),
        child: Row(
          children: [
            SizedBox(
              width: 80,
              height: 80,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  data["image"],
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data["name"],
                  style: const TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  data["price"],
                  style: const TextStyle(
                    color: primary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.star, size: 15, color: Colors.yellow),
                        Text(data["review"]),
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Row(
                      children: [
                        const Icon(Icons.access_time_outlined,
                            size: 15, color: Colors.grey),
                        Text(
                          data["duration"],
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}