import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_learning_app/Controllers/HomeController.dart';
import 'package:online_learning_app/Controllers/UserController.dart';
import 'package:online_learning_app/Models/Course.dart';
import 'package:online_learning_app/Models/Wishlist.dart';
import 'package:online_learning_app/Repository/DBHelper.dart';
import 'package:online_learning_app/public/color.dart';
import 'package:online_learning_app/public/default.dart';

var _controller = Get.find<HomeController>();

class CourseExploreCard extends StatelessWidget {
  final Course course;

  CourseExploreCard({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
      child: Container(
        width: 200,
        height: 308,
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
                  imageUrl: course.imageurl ?? defaultCourseThumbnail,
                ),
              ),
              Positioned(
                top: 150,
                right: 5,
                child: StreamBuilder(
                  stream: DBHelper.db
                      .collection("Wishlist")
                      .where("coursekey", isEqualTo: course.key)
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                          snapshot) {
                    if (snapshot.hasData) {
                      var arr = snapshot.data!.docs
                          .where((e) =>
                              e.get("userkey") ==
                              DBHelper.auth.currentUser!.uid)
                          .toList();
                      if (arr.isEmpty) {
                        return InkWell(
                          onTap: () async {
                            await DBHelper.db
                                .collection("Wishlist")
                                .add(Wishlist(coursekey: course.key!).toMap());
                            Get.snackbar(
                              "Success",
                              "Course ${course.name} Added to wishlist",
                              icon: const Icon(Icons.favorite,
                                  color: Colors.blue),
                              snackPosition: SnackPosition.BOTTOM,
                            );
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                                color: Colors.white, shape: BoxShape.circle),
                            child: const Center(
                              child: Icon(
                                Icons.favorite,
                              ),
                            ),
                          ),
                        );
                      } else {
                        return InkWell(
                          onTap: () async {
                            await arr[0].reference.delete();
                            Get.snackbar(
                              "Success",
                              "Course ${course.name} Removed from wishlist",
                              icon: const Icon(Icons.heart_broken,
                                  color: Colors.blue),
                              snackPosition: SnackPosition.BOTTOM,
                            );
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                                color: primary, shape: BoxShape.circle),
                            child: Center(
                              child: Icon(
                                Icons.favorite,
                                color: Colors.blue.shade700,
                              ),
                            ),
                          ),
                        );
                      }
                    }
                    return Container(
                      decoration: const BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: const Center(
                        child: Icon(
                          Icons.favorite,
                        ),
                      ),
                    );
                  },
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
            ]),
            const SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(left: 5),
              child: Flexible(
                child: Text(
                  course.name!,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: const TextStyle(
                      color: textColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
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
                          course.price == "0" ? 'Free' : course.price!,
                          style: TextStyle(
                              color: course.price == "0"
                                  ? Colors.green
                                  : Colors.grey),
                        ),
                      ],
                    ),
                    Row(
                      children: const [
                        Icon(Icons.access_time_outlined,
                            size: 15, color: Colors.grey),
                        Text(
                          "Lifetime",
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
