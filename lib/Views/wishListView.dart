import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:online_learning_app/Controllers/HomeController.dart';
import 'package:online_learning_app/ListItems/CourseItem.dart';
import 'package:online_learning_app/Repository/DBHelper.dart';
import 'package:online_learning_app/Widgets/BackBtn.dart';
import 'package:flutter/material.dart';

var controller = Get.find<HomeController>();

class wishListView extends StatelessWidget {
  wishListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackBtn(),
        title: const Text(
          "Wishlist",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: StreamBuilder(
        stream: DBHelper.db
            .collection("Wishlist")
            .where("userkey", isEqualTo: DBHelper.auth.currentUser!.uid)
            .snapshots(),
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.hasData) {
            var arr = snapshot.data!.docs;
            if (arr.isEmpty) {
              return const Center(
                child: Text(
                  "No Favourites Yet !",
                  style: TextStyle(fontSize: 20),
                ),
              );
            }
            return ListView.builder(
              itemCount: arr.length,
              itemBuilder: (BuildContext context, int index) {
                return CourseItem(
                  course: courseController.courseProvider!.courses!
                      .where(
                          (course) => course.key == arr[index].get("coursekey"))
                      .toList()[0],
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
