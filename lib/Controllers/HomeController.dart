import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:online_learning_app/Controllers/CategoryController.dart';
import 'package:online_learning_app/Controllers/CourseController.dart';
import 'package:online_learning_app/Controllers/UserController.dart';
import 'package:online_learning_app/ListItems/CourseCard.dart';
import 'package:online_learning_app/ListItems/CourseItem.dart';
import 'package:online_learning_app/ListItems/ProgressCourseItem.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Repository/DBHelper.dart';

CourseController courseController = Get.put(CourseController());


class HomeController extends GetxController {
  var selectedButton = "All Courses".obs;
  var selectedCourseButton = "All Courses".obs;
  var searchTerm = "".obs;
  var showNavBar = true.obs;
  var barrating = 1.0.obs;

  // CourseController openseaController = Get.put(CourseController());
  //Get List Streams
  dynamic getCourseList(String selectedButton) {
    switch (selectedButton) {
      case "All Courses":
        return Obx(
          () {
            if (courseController.isLoading.value) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (courseController.courseProvider == null) {
              return Image.asset("assets/images/notfound.png");
            }
            return CarouselSlider(
              items: List.generate(
                courseController.courseProvider?.courses?.length ?? 0,
                (index) => CourseCard(
                  course: courseController.courseProvider!.courses![index],
                ),
              ),
              options: CarouselOptions(
                height: 290,
                enlargeCenterPage: true,
                disableCenter: true,
                autoPlay: true,
              ),
            );
          },
        );

      case "Popular":
        return Obx(() {
          if (courseController.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (courseController.discountedcourses == null) {
            return Image.asset("assets/images/notfound.png");
          }
          return CarouselSlider(
            items: List.generate(
              courseController.discountedcourses?.courses?.length ?? 0,
              (index) => CourseCard(
                course: courseController.discountedcourses!.courses![index],
              ),
            ),
            options: CarouselOptions(
              height: 290,
              enlargeCenterPage: true,
              disableCenter: true,
              autoPlay: true,
            ),
          );
        });

      // default:
      //   return StreamBuilder(
      //     stream: DBHelper.db
      //         .collection("Course")
      //         .orderBy("key", descending: true)
      //         .snapshots(),
      //     builder: (BuildContext context,
      //         AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
      //       if (snapshot.hasData) {
      //         var arr = snapshot.data!.docs;
      //         print(arr[1]);
      //         return ListView.builder(
      //           itemCount: arr.length,
      //           itemBuilder: (BuildContext context, int index) {
      //             return CourseItem(snap: arr[index]);
      //           },
      //         );
      //       }
      //       return Center(child: CircularProgressIndicator());
      //     },
      //   );
    }
  }

  dynamic getMyCoursesList(String selected) {
    switch (selected) {
      case "All Courses":
        return StreamBuilder(
          stream: DBHelper.db
              .collection("Enrolled")
              .where("userkey", isEqualTo: DBHelper.auth.currentUser!.uid)
              .snapshots(),
          builder: (BuildContext context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if (snapshot.hasData) {
              var arr = snapshot.data!.docs;
              if (arr.isEmpty) {
                return Center(
                  child: Text("No Courses Enrolled"),
                );
              }
              return ListView.builder(
                itemCount: arr.length,
                itemBuilder: (BuildContext context, int index) {
                  return ProgressCourseItem(
                      coursekey: arr[index].get("coursekey"));
                },
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        );
      case "On Progress":
        return StreamBuilder(
          stream: DBHelper.db
              .collection("Enrolled")
              .where("userkey", isEqualTo: DBHelper.auth.currentUser!.uid)
              .snapshots(),
          builder: (BuildContext context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if (snapshot.hasData) {
              var arr = snapshot.data!.docs;
              if (arr.isEmpty) {
                return Center(
                  child: Text("No Courses in Progress"),
                );
              }
              var enrolledlist = arr.map((e) => e.get("coursekey")).toList();
              return StreamBuilder(
                stream: DBHelper.db
                    .collection("CompletedCourses")
                    .where("userkey", isEqualTo: DBHelper.auth.currentUser!.uid)
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                        snapshot) {
                  if (snapshot.hasData) {
                    var arr = snapshot.data!.docs;
                    var completedlist =
                        arr.map((e) => e.get("coursekey")).toList();
                    var items = enrolledlist
                        .where((element) => !completedlist.contains(element))
                        .toList();
                    return ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ProgressCourseItem(coursekey: items[index]);
                      },
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        );
      case "Completed":
        return StreamBuilder(
          stream: DBHelper.db
              .collection("CompletedCourses")
              .where("userkey", isEqualTo: DBHelper.auth.currentUser!.uid)
              .snapshots(),
          builder: (BuildContext context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if (snapshot.hasData) {
              var arr = snapshot.data!.docs;
              if (arr.isEmpty) {
                return Center(
                  child: Text(
                    "No Courses Completed !",
                    style: TextStyle(fontSize: 18),
                  ),
                );
              }
              return ListView.builder(
                itemCount: arr.length,
                itemBuilder: (BuildContext context, int index) {
                  return ProgressCourseItem(
                      coursekey: arr[index].get("coursekey"));
                },
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        );
    }
  }
}
