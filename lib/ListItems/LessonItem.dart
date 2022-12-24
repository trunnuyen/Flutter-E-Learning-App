import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:online_learning_app/Models/CompletedCourses.dart';
import 'package:online_learning_app/Models/CompletedLessons.dart';
import 'package:online_learning_app/Models/Course.dart';
import 'package:online_learning_app/Models/Lessons.dart';
import 'package:online_learning_app/Repository/DBHelper.dart';
import 'package:online_learning_app/Views/VideoViewer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LessonItem extends StatelessWidget {
  Lessons lesson;
  Course course;

  LessonItem({Key? key, required this.lesson, required this.course})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
      child: InkWell(
        onTap: () async {
          Get.to(VideoViewer(vidlink: lesson.videoUrl!));
          //Add Lesson
          var check = await DBHelper.db
              .collection("CompletedLessons")
              .where("userkey", isEqualTo: DBHelper.auth.currentUser!.uid)
              .get();
          var checklesson = check.docs
              .where((element) => element.get("lessonkey") == lesson.key)
              .toList();
          if (checklesson.isEmpty) {
            await DBHelper.db
                .collection("CompletedLessons")
                .add(CompletedLessons(lessonkey: lesson.key).toMap());
          }
          //Add Complete
          var courseitem = await DBHelper.db
              .collection("CourseLesson")
              .where("lessonkey", isEqualTo: lesson.key)
              .get();
          var coursekey = await courseitem.docs[0].get("coursekey");
          var courselessons = await DBHelper.db
              .collection("CourseLesson")
              .where("coursekey", isEqualTo: coursekey)
              .get();
          var arrcourse = courselessons.docs;
          var totallessons = arrcourse.length;
          var lessonkeys = arrcourse.map((e) => e.get("lessonkey")).toList();
          var completedlessons = await DBHelper.db
              .collection("CompletedLessons")
              .where("lessonkey", whereIn: lessonkeys)
              .get();
          var completedlist = completedlessons.docs
              .where((e) => e.get("userkey") == DBHelper.auth.currentUser!.uid);
          if (completedlist.length == totallessons) {
            var check = await DBHelper.db
                .collection("CompletedCourses")
                .where("userkey", isEqualTo: DBHelper.auth.currentUser!.uid)
                .get();
            var checkcourse = check.docs
                .where((element) => element.get("coursekey") == course.key)
                .toList();
            if (checkcourse.isEmpty) {
              await DBHelper.db
                  .collection("CompletedCourses")
                  .add(CompletedCourses(coursekey: course.key!).toMap());
            }
          }
        },
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: ListTile(
            leading: Icon(
              Icons.play_circle_outlined,
              color: Colors.blue.shade700,
              size: 35,
            ),
            title: Text(
              lesson.title!,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: StreamBuilder(
              stream: DBHelper.db
                  .collection("CompletedLessons")
                  .where("userkey", isEqualTo: DBHelper.auth.currentUser!.uid)
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                if (snapshot.hasData) {
                  var arr = snapshot.data!.docs
                      .where((e) => e.get("lessonkey") == lesson.key);
                  if (arr.isNotEmpty) {
                    return Icon(
                      Icons.check_circle_outline,
                      color: Colors.blue.shade700,
                    );
                  }
                }
                return const SizedBox();
              },
            ),
          ),
        ),
      ),
    );
  }
}
