import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:online_learning_app/Controllers/CourseController.dart';
import 'package:online_learning_app/Controllers/EnrollController.dart';
import 'package:online_learning_app/Controllers/LessonController.dart';
import 'package:online_learning_app/Controllers/UserController.dart';
import 'package:online_learning_app/ListItems/CourseCard.dart';
import 'package:online_learning_app/ListItems/CourseItem.dart';
import 'package:online_learning_app/ListItems/ProgressCourseItem.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Repository/DBHelper.dart';

CourseController courseController = Get.put(CourseController());
UserController usercontroller = Get.put(UserController());
LessonController lessonsController = Get.put(LessonController());
EnrollController enrollController = Get.put(EnrollController());

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

      case "Free":
        return Obx(() {
          if (courseController.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (courseController.freeCourse == null) {
            return Image.asset("assets/images/notfound.png");
          }
          return CarouselSlider(
            items: List.generate(
              courseController.freeCourse?.courses?.length ?? 0,
              (index) => CourseCard(
                course: courseController.freeCourse!.courses![index],
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
    }
  }

  dynamic getMyCoursesList(String selected) {
    switch (selected) {
      case "All Courses":
        return Obx(() {
          if (enrollController.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (enrollController.enrollProvider == null) {
            return Image.asset("assets/images/notfound.png");
          }
          return ListView.builder(
            itemCount: enrollController.enrollProvider!.enrolls!.length,
            itemBuilder: (BuildContext context, int index) {
              return EnrollCourseItem(
                course: courseController.courseProvider!.courses!
                    .where((course) =>
                        course.key ==
                        enrollController
                            .enrollProvider!.enrolls![index].coursekey)
                    .toList()[0],
              );
            },
          );
        });

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
                return const Center(
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
                        return SizedBox();
                      },
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              );
            }
            return const Center(
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
                return const Center(
                  child: Text(
                    "No Courses Completed !",
                    style: TextStyle(fontSize: 18),
                  ),
                );
              }
              return ListView.builder(
                itemCount: arr.length,
                itemBuilder: (BuildContext context, int index) {
                  return SizedBox();
                },
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        );
    }
  }
}
