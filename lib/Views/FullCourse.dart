import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:online_learning_app/Controllers/HomeController.dart';
import 'package:online_learning_app/Models/Course.dart';
import 'package:online_learning_app/Views/VideoViewer.dart';
import 'package:online_learning_app/Widgets/BackBtn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:online_learning_app/public/color.dart';

import '../Models/Rating.dart';
import '../Repository/DBHelper.dart';
import '../Widgets/Icon.dart';

class FullCourse extends GetView {
  Course course;

  FullCourse({Key? key, required this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    lessonsController.fetchData(course.key!);
    var _controller = Get.find<HomeController>();
    return Scaffold(
      appBar: AppBar(
        leading: const BackBtn(),
        title: Text(
          '${lessonsController.lessonsProvider!.lessons!.length.toString()} Lesssons',
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
        actions: [
          StreamBuilder(
            stream: DBHelper.db
                .collection("Rating")
                .where("userkey", isEqualTo: DBHelper.auth.currentUser!.uid)
                .snapshots(),
            builder: (BuildContext context,
                AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
              if (snapshot.hasData) {
                var arr = snapshot.data!.docs.where(
                    (element) => element.get("coursekey") == course.key!);
                if (arr.isEmpty) {
                  return InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (c) {
                              return AlertDialog(
                                titleTextStyle: const TextStyle(
                                    color: Colors.black, fontSize: 20),
                                title: const Text("Rate It"),
                                content: Obx(() => RatingBar.builder(
                                      itemSize: 30,
                                      initialRating:
                                          _controller.barrating.value,
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      itemPadding: const EdgeInsets.symmetric(
                                          horizontal: 4.0),
                                      itemBuilder: (context, _) => const Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      onRatingUpdate: (rating) {
                                        _controller.barrating.value = rating;
                                      },
                                    )),
                                actions: [
                                  ElevatedButton(
                                      onPressed: () async {
                                        await DBHelper.db
                                            .collection("Rating")
                                            .add(Rating(
                                                    coursekey: course.key!,
                                                    rating: _controller
                                                        .barrating.value)
                                                .toMap());
                                        Get.back();
                                        Get.snackbar('Thank you',
                                            'You rate the course ${_controller.barrating.value.toString()}',
                                            icon: const Icon(
                                              Icons.star,
                                              color: Colors.yellow,
                                            ),
                                            snackPosition:
                                                SnackPosition.BOTTOM);
                                      },
                                      child: const Text("Rate")),
                                  ElevatedButton(
                                      onPressed: () {
                                        Get.back();
                                      },
                                      child: const Text("Cancel"))
                                ],
                              );
                            });
                      },
                      child: online_learning_appIcon(
                        myicon: Icons.star,
                        background: Colors.grey.shade200,
                        foreground: Colors.blue.shade700,
                      ));
                }
                return const SizedBox();
              }
              return const SizedBox();
            },
          ),
        ],
      ),
      body: Obx(() {
        if (lessonsController.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (lessonsController.lessonsProvider == null) {
          return Image.asset("assets/images/notfound.png");
        }
        return SizedBox(
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: lessonsController.lessonsProvider!.lessons!.length,
            itemBuilder: (context, index) => InkWell(
              onTap: () => Get.to(
                VideoViewer(
                    vidlink: lessonsController
                        .lessonsProvider!.lessons![index].videoUrl!),
              ),
              child: Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                    boxShadow: [
                      BoxShadow(
                        color: shadowColor.withOpacity(.07),
                        blurRadius: .1,
                        spreadRadius: .1,
                        offset: const Offset(1, 1),
                      ),
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CachedNetworkImage(
                      width: 70,
                      height: 70,
                      imageUrl: course.imageurl!,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            lessonsController
                                .lessonsProvider!.lessons![index].title!,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.access_time,
                                color: labelColor,
                                size: 20,
                              ),
                              Text(
                                lessonsController
                                    .lessonsProvider!.lessons![index].duration!,
                                style: const TextStyle(
                                  color: labelColor,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Icon(Icons.arrow_forward_ios_rounded),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
