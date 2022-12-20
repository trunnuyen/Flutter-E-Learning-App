import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:online_learning_app/Controllers/UserController.dart';
import 'package:online_learning_app/ListItems/CourseItem.dart';
import 'package:online_learning_app/Repository/DBHelper.dart';
import 'package:online_learning_app/Widgets/BackBtn.dart';
import 'package:flutter/material.dart';

class wishListView extends StatelessWidget {
  wishListView({Key? key}) : super(key: key);
  UserController usercontroller = Get.find<UserController>();

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
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: Obx(
          () {
            if (usercontroller.isLoading.value) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (usercontroller.coursesWishlist.isEmpty) {
              return Image.asset("assets/images/notfound.png");
            }
            return ListView.builder(
              itemCount: usercontroller.coursesWishlist.length,
              itemBuilder: (BuildContext context, int index) {
                return CourseItem(
                  course: usercontroller.coursesWishlist.toList()[index],
                );
              },
            );
          },
        ),
      ),
    );
  }

  Future<void> _refresh() {
    usercontroller.fetchData();
    return Future.delayed(const Duration(seconds: 3));
  }
}
