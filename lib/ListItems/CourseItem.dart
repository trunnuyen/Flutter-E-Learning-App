// ignore_for_file: unnecessary_string_escapes

import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:online_learning_app/Controllers/UserController.dart';
import 'package:online_learning_app/Models/Course.dart';
import 'package:online_learning_app/Models/Wishlist.dart';
import 'package:online_learning_app/Views/ViewCourse.dart';
import 'package:online_learning_app/public/default.dart';
import 'package:online_learning_app/public/string.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:get/get.dart';
import '../Repository/DBHelper.dart';

class CourseItem extends StatelessWidget {
  Course course;

  CourseItem({Key? key, required this.course}) : super(key: key);

  UserController usercontroller = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(ViewCourse(course: course));
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              clipBehavior: Clip.hardEdge,
              child: Image.network(
                course.imageurl ?? defaultCourseThumbnail,
                height: 60,
                width: 60,
                fit: BoxFit.fill,
              ),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  course.name!,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5,
                )
              ],
            ),
            // subtitle: Column(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     StreamBuilder(
            //       stream: DBHelper.db
            //           .collection("CourseLesson")
            //           .where("coursekey", isEqualTo: snap.get("key"))
            //           .snapshots(),
            //       builder: (BuildContext context,
            //           AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            //         if (snapshot.hasData) {
            //           var arr = snapshot.data!.docs;
            //           return Text(arr.length.toString() + " lessons",style: TextStyle(color: Colors.black),);
            //         }
            //         return SizedBox();
            //       },
            //     ),
            //     SizedBox(height: 5,),
            //     Row(
            //       mainAxisSize: MainAxisSize.min,
            //       children: [
            //         Icon(
            //           Icons.star,
            //           color: Colors.orange,
            //         ),
            //         SizedBox(width: 3,),
            //         Expanded(
            //           child: StreamBuilder(
            //             stream: DBHelper.db
            //                 .collection("Rating")
            //                 .where("coursekey", isEqualTo: snap.get("key"))
            //                 .snapshots(),
            //             builder: (BuildContext context,
            //                 AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
            //                 snapshot) {
            //               if (snapshot.hasData) {
            //                 var arr = snapshot.data!.docs;
            //                 var avg = 0.0;
            //                 if (arr.length > 0)
            //                   avg = arr
            //                       .map((e) =>
            //                       double.parse(e.get("rating").toString()))
            //                       .average;
            //                 return Text(avg.toStringAsFixed(1));
            //               }
            //               return SizedBox();
            //             },
            //           ),
            //         )
            //       ],
            //     )
            //   ],
            // ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Obx(() {
                  usercontroller.fetchData();

                  if (!usercontroller.coursesWishlistId
                      .contains(int.parse(course.key!))) {
                    return InkWell(
                        onTap: () async {
                          // wishlist = list.map((id) => '\"$id\"').toList();
                          // wishlist.add('\"${course.key}\"');
                          usercontroller.coursesWishlistId
                              .add(int.parse(course.key!));
                          usercontroller
                              .saveToWishlist(usercontroller.coursesWishlistId);

                          print(usercontroller.coursesWishlistId.toString());
                          print(usercontroller.coursesWishlistId.length);
                        },
                        child: const Icon(Icons.favorite));
                  } else {
                    return InkWell(
                      onTap: () async {
                        usercontroller.coursesWishlistId
                            .remove(int.parse(course.key!));
                        usercontroller.coursesWishlist.remove(course);
                        // wishlist = list.map((id) => '\"$id\"').toList();
                        usercontroller
                            .saveToWishlist(usercontroller.coursesWishlistId);
                      },
                      child: Icon(
                        Icons.favorite,
                        color: Colors.blue.shade700,
                      ),
                    );
                  }
                }),
                Text(
                  course.price == '0' ? freeCourse : "\$${course.price!}",
                  style: TextStyle(
                    color: course.price == "0"
                        ? Colors.green
                        : Colors.blue.shade700,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    decoration: course.discountedPrice == "0"
                        ? TextDecoration.none
                        : TextDecoration.lineThrough,
                  ),
                ),
                Text(
                  course.discountedPrice == "0"
                      ? ''
                      : "\$${course.discountedPrice!}",
                  style: TextStyle(
                      color: Colors.red.shade700,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
