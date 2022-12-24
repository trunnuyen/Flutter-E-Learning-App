import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_learning_app/Controllers/HomeController.dart';
import 'package:online_learning_app/Controllers/LessonController.dart';
import 'package:online_learning_app/Repository/DBHelper.dart';
import 'package:online_learning_app/Views/ViewCourse.dart';
import 'package:online_learning_app/Models/Course.dart';
import 'package:online_learning_app/public/color.dart';
import 'package:online_learning_app/public/default.dart';

var lessonsController = Get.put(LessonController());

class CourseCard extends StatelessWidget {
  const CourseCard(
      {Key? key,
      required this.course,
      this.width = 280,
      this.height = 290,
      this.onTap})
      : super(key: key);
  final Course course;
  final double width;
  final double height;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    lessonsController.fetchData(course.key!);
    return InkWell(
      onTap: () {
        enrollController.getTotalEnroll(course.key!);
        Get.to(ViewCourse(course: course));
      },
      child: Container(
        width: 270,
        height: 290,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(bottom: 5, top: 5),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),
            boxShadow: [
              BoxShadow(
                color: shadowColor.withOpacity(.1),
                spreadRadius: 2,
                blurRadius: 2,
                offset: const Offset(0, 0),
              ),
            ]),
        child: Column(
          children: [
            Center(
              child: Stack(
                fit: StackFit.loose,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    // margin: const EdgeInsets.all(5),
                    height: 160,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: CachedNetworkImage(
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            image: DecorationImage(
                                image: imageProvider, fit: BoxFit.cover),
                          ),
                        ),
                        imageUrl: course.imageurl ?? defaultCourseThumbnail,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.fromLTRB(160, 145, 20, 10),
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: primary,
                    ),
                    child: Center(
                      child: Text(
                        course.price! == '0' ? 'Free' : '${course.price!}\$',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            decoration: course.discountedPrice == '0'
                                ? TextDecoration.none
                                : TextDecoration.lineThrough),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.fromLTRB(160, 10, 20, 145),
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: course.discountedPrice == '0'
                          ? Colors.transparent
                          : Colors.red,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          overflow: TextOverflow.ellipsis,
                          course.discountedPrice == '0'
                              ? ''
                              : '${course.discountedPrice}\$',
                          style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              child: Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(left: 5),
                child: Text(
                  overflow: TextOverflow.ellipsis,
                  course.name!,
                  style: const TextStyle(
                      color: textColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Container(
                margin: const EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [
                        Icon(Icons.timelapse, size: 15, color: Colors.grey),
                        Text(
                          'Lifetime',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.play_circle,
                            size: 15, color: Colors.grey),
                        Text(lessonsController.lessonsProvider == null
                            ? '0'
                            : lessonsController.lessonsProvider!.lessons!.length
                                .toString()),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.star, size: 15, color: Colors.yellow),
                        StreamBuilder(
                          stream: DBHelper.db
                              .collection("Rating")
                              .where("coursekey", isEqualTo: course.key!)
                              .snapshots(),
                          builder: (BuildContext context,
                              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                                  snapshot) {
                            if (snapshot.hasData) {
                              var arr = snapshot.data!.docs;
                              var avg = 0.0;
                              if (arr.isNotEmpty) {
                                avg = arr
                                        .map((e) => double.parse(
                                            e.get("rating").toString()))
                                        .reduce((a, b) => a + b) /
                                    arr.length;
                              }
                              return Text(
                                avg.toStringAsFixed(1),
                                style: TextStyle(color: Colors.blue.shade700),
                              );
                            }
                            return const SizedBox();
                          },
                        ),
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
