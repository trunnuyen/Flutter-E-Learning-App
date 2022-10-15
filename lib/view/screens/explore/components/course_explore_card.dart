import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../theme/color.dart';
import '../../../widgets/bookmark_box.dart';

class CourseExploreCard extends StatelessWidget {
  final data;
  final GestureTapCallback? onTap;
  const CourseExploreCard({super.key, required this.data, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
      child: Container(
        width: 200,
        height: 290,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),
            boxShadow: [
              BoxShadow(
                color: shadowColor.withOpacity(.1),
                blurRadius: 1,
                spreadRadius: 1,
                offset: const Offset(1, 1),
              ),
            ]),
        child: Column(
          children: [
            Stack(children: [
              SizedBox(
                width: double.infinity,
                height: 190,
                child: CachedNetworkImage(
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      image: DecorationImage(
                          image: imageProvider, fit: BoxFit.cover),
                    ),
                  ),
                  imageUrl: data["image"],
                ),
              ),
              Positioned(
                top: 150,
                right: 5,
                child: BookmarkBox(
                    isBookmarked: data["is_favorited"], onTap: onTap),
              ),
            ]),
            const SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(left: 5),
              child: Text(
                data["name"],
                style: const TextStyle(
                    color: textColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
              child: Container(
                margin: const EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.monetization_on_outlined,
                            size: 15, color: Colors.grey),
                        Text(
                          data["price"],
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ],
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
                    Row(
                      children: [
                        const Icon(Icons.play_circle,
                            size: 15, color: Colors.grey),
                        Text(data["session"]),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.star, size: 15, color: Colors.yellow),
                        Text(data["review"]),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
