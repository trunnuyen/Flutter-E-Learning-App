// ignore_for_file: unnecessary_string_escapes

import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:online_learning_app/Bindings/UserBinding.dart';
import 'package:online_learning_app/Controllers/UserController.dart';
import 'package:online_learning_app/Models/Course.dart';
import 'package:online_learning_app/Models/Wishlist.dart';
import 'package:online_learning_app/Views/FullCourse.dart';
import 'package:online_learning_app/Views/ViewCourse.dart';
import 'package:online_learning_app/public/default.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Repository/DBHelper.dart';

class EnrollCourseItem extends StatelessWidget {
  Course course;

  EnrollCourseItem({Key? key, required this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(FullCourse(course: course), binding: UserBinding());
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
          child: ListTile(
            leading: Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
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
          ),
        ),
      ),
    );
  }
}
