import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_learning_app/Controllers/UserController.dart';
import 'package:online_learning_app/Models/Course.dart';
import 'package:online_learning_app/public/color.dart';
import 'package:online_learning_app/public/default.dart';

class CourseExploreCard extends StatelessWidget {
  final Course course;

  CourseExploreCard({super.key, required this.course});

  UserController usercontroller = Get.find<UserController>();

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
                child: Obx(
                  () => usercontroller.coursesWishlistId
                          .contains(int.parse(course.key!))
                      ? InkWell(
                          onTap: () async {
                            // wishlist = list.map((id) => '\"$id\"').toList();
                            // wishlist.add('\"${course.key}\"');
                            usercontroller.coursesWishlistId
                                .add(int.parse(course.key!));
                            usercontroller.saveToWishlist(
                                usercontroller.coursesWishlistId);

                            print(usercontroller.coursesWishlistId.toString());
                            print(usercontroller.coursesWishlistId.length);
                          },
                          child: const Icon(Icons.favorite))
                      : InkWell(
                          onTap: () async {
                            usercontroller.coursesWishlistId
                                .remove(int.parse(course.key!));
                            usercontroller.coursesWishlist.remove(course);
                            // wishlist = list.map((id) => '\"$id\"').toList();
                            usercontroller.saveToWishlist(
                                usercontroller.coursesWishlistId);
                          },
                          child: Icon(
                            Icons.favorite,
                            color: Colors.blue.shade700,
                          ),
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
                      children: [
                        const Icon(Icons.access_time_outlined,
                            size: 15, color: Colors.grey),
                        Text(
                          "duration",
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.play_circle,
                            size: 15, color: Colors.grey),
                        Text("session"),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.star, size: 15, color: Colors.yellow),
                        Text("review"),
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
