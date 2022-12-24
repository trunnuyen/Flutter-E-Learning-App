import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:online_learning_app/Controllers/HomeController.dart';
import 'package:online_learning_app/Controllers/LessonController.dart';
import 'package:online_learning_app/Models/Course.dart';
import 'package:online_learning_app/Models/Enrolled.dart';
import 'package:online_learning_app/Models/Notifications.dart';
import 'package:online_learning_app/Views/FullCourse.dart';
import 'package:online_learning_app/Views/VideoViewer.dart';
import 'package:online_learning_app/Widgets/BackBtn.dart';
import 'package:online_learning_app/Widgets/PaymentCard.dart';
import 'package:online_learning_app/Widgets/RoundButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_learning_app/public/color.dart';
import 'package:online_learning_app/public/default.dart';
import 'package:readmore/readmore.dart';
import '../Repository/DBHelper.dart';

class ViewCourse extends GetView {
  Course course;

  ViewCourse({Key? key, required this.course}) : super(key: key);

  var lessonsController = Get.put(LessonController());

  @override
  Widget build(BuildContext context) {
    lessonsController.fetchData(course.key!);
    usercontroller.fetchData();
    return course == null
        ? SizedBox()
        : Scaffold(
            appBar: AppBar(
              leading: const BackBtn(),
              title: Text(
                course.name!,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            body: RefreshIndicator(
              onRefresh: _refresh,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)),
                        child: GestureDetector(
                          onTap: () {
                            Get.to(VideoViewer(vidlink: course.videoUrl!));
                          },
                          child: Stack(
                            children: [
                              Image.network(
                                course.imageurl ?? defaultCourseThumbnail,
                                fit: BoxFit.fill,
                              ),
                              const Center(
                                heightFactor: 4,
                                child: CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Colors.black45,
                                  child: Icon(
                                    Icons.play_arrow,
                                    size: 40,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.shade200,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.group,
                                    color: Colors.blue.shade700,
                                  ),
                                  const SizedBox(
                                    width: 7,
                                  ),
                                  Text(
                                    enrollController.enrolTotal == null ||
                                            enrollController
                                                .enrolTotal!.enrolls!.isEmpty
                                        ? '0'
                                        : enrollController
                                            .enrolTotal!.enrolls!.length
                                            .toString(),
                                    style:
                                        TextStyle(color: Colors.blue.shade700),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.shade200,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.blue.shade700,
                                  ),
                                  const SizedBox(
                                    width: 7,
                                  ),
                                  StreamBuilder(
                                    stream: DBHelper.db
                                        .collection("Rating")
                                        .where("coursekey",
                                            isEqualTo: course.key!)
                                        .snapshots(),
                                    builder: (BuildContext context,
                                        AsyncSnapshot<
                                                QuerySnapshot<
                                                    Map<String, dynamic>>>
                                            snapshot) {
                                      if (snapshot.hasData) {
                                        var arr = snapshot.data!.docs;
                                        var avg = 0.0;
                                        if (arr.isNotEmpty) {
                                          avg = arr
                                                  .map((e) => double.parse(e
                                                      .get("rating")
                                                      .toString()))
                                                  .reduce((a, b) => a + b) /
                                              arr.length;
                                        }
                                        return Text(
                                          avg.toStringAsFixed(1),
                                          style: TextStyle(
                                              color: Colors.blue.shade700),
                                        );
                                      }
                                      return const SizedBox();
                                    },
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            course.name!,
                            style: const TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Row(
                            children: [
                              Icon(
                                Icons.info,
                                color: Colors.blue.shade700,
                              ),
                              const Text(
                                'About',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: ReadMoreText(
                          '${course.desc!} ',
                          style:
                              const TextStyle(fontSize: 14, color: labelColor),
                          trimLines: 2,
                          trimMode: TrimMode.Line,
                          trimCollapsedText: 'Show more',
                          trimExpandedText: 'Show less',
                          moreStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: blue,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Row(
                            children: [
                              Icon(
                                Icons.ads_click_rounded,
                                color: Colors.blue.shade700,
                              ),
                              const Text(
                                'Outcomes',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      Align(
                          alignment: Alignment.topLeft,
                          child: getAllOutcomes(course.outcomes!)),
                      const SizedBox(
                        height: 20,
                      ),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Row(
                            children: [
                              Icon(
                                Icons.check_circle_outline_rounded,
                                color: Colors.blue.shade700,
                              ),
                              const Text(
                                'Requirement',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: getAllOutcomes(course.requirements!),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Row(
                            children: [
                              Icon(
                                Icons.play_lesson,
                                color: Colors.blue.shade700,
                              ),
                              Text(
                                '${lessonsController.lessonsProvider!.lessons!.length.toString()} Lesssons',
                                style: const TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          )),

                      Obx(() {
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
                            itemCount: lessonsController
                                .lessonsProvider!.lessons!.length,
                            itemBuilder: (context, index) => InkWell(
                              onTap: () => Get.snackbar(
                                "You want to view the lesson?",
                                "Please enroll the course first",
                                icon: const Icon(Icons.video_call,
                                    color: Colors.blue),
                                snackPosition: SnackPosition.BOTTOM,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            lessonsController.lessonsProvider!
                                                .lessons![index].title!,
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
                                                    .lessonsProvider!
                                                    .lessons![index]
                                                    .duration!,
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

                      // StreamBuilder(
                      //   stream: DBHelper.db
                      //       .collection("CourseLesson")
                      //       .where("coursekey", isEqualTo: snap.get("key"))
                      //       .snapshots(),
                      //   builder: (BuildContext context,
                      //       AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                      //           snapshot) {
                      //     if (snapshot.hasData) {
                      //       var arr = snapshot.data!.docs;
                      //       return Align(
                      //           alignment: Alignment.topLeft,
                      //           child: Text(
                      //             arr.length.toString() + " Lessons",
                      //             style: TextStyle(
                      //                 color: Colors.grey.shade800,
                      //                 fontWeight: FontWeight.bold,
                      //                 fontSize: 20),
                      //           ));
                      //     }
                      //     return const SizedBox();
                      //   },
                      // ),

                      // StreamBuilder(
                      //   stream: DBHelper.db
                      //       .collection("CourseLesson")
                      //       .where("coursekey", isEqualTo: snap.get("key"))
                      //       .snapshots(),
                      //   builder: (BuildContext context,
                      //       AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                      //           snapshot) {
                      //     if (snapshot.hasData) {
                      //       var arr = snapshot.data!.docs;
                      //       var keylist = arr.map((e) => e.get("lessonkey")).toList();
                      //       return ListView.builder(
                      //         shrinkWrap: true,
                      //         physics: const NeverScrollableScrollPhysics(),
                      //         itemCount: keylist.length,
                      //         itemBuilder: (BuildContext context, int index) {
                      //           return StreamBuilder(
                      //             stream: DBHelper.db
                      //                 .collection("Lessons")
                      //                 .where("key", isEqualTo: keylist[index])
                      //                 .snapshots(),
                      //             builder: (BuildContext context,
                      //                 AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                      //                     snapshot) {
                      //               if (snapshot.hasData) {
                      //                 var item = snapshot.data!.docs[0];
                      //                 return Card(
                      //                     elevation: 2,
                      //                     shape: RoundedRectangleBorder(
                      //                         borderRadius: BorderRadius.circular(20)),
                      //                     child: ListTile(
                      //                       trailing: Icon(
                      //                         Icons.slow_motion_video_sharp,
                      //                         color: Colors.blue.shade700,
                      //                       ),
                      //                       title: Text(
                      //                         item.get("name"),
                      //                         style: const TextStyle(
                      //                             fontWeight: FontWeight.bold),
                      //                       ),
                      //                     ));
                      //               }
                      //               return const SizedBox();
                      //             },
                      //           );
                      //         },
                      //       );
                      //     }
                      //     return const Center(
                      //       child: CircularProgressIndicator(),
                      //     );
                      //   },
                      // ),
                      const SizedBox(
                        height: 20,
                      ),
                      StreamBuilder(
                        stream: DBHelper.db
                            .collection("Enrolled")
                            .where("userkey",
                                isEqualTo: DBHelper.auth.currentUser!.uid)
                            .snapshots(),
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                                snapshot) {
                          if (snapshot.hasData) {
                            var arr = snapshot.data!.docs.where((element) =>
                                element.get("coursekey") == course.key);
                            var arr2 = enrollController.enrollProvider == null
                                ? []
                                : enrollController.enrollProvider!.enrolls!
                                    .where((enrol) =>
                                        enrol.coursekey == course.key)
                                    .toList();
                            if (arr.isEmpty && arr2.isEmpty) {
                              return RoundButton(
                                  text: "Enroll - \$${course.price}",
                                  bacground: Colors.blue.shade600,
                                  foreground: Colors.white,
                                  onPressed: () async {
                                    showDialog(
                                        context: context,
                                        builder: (c) {
                                          return AlertDialog(
                                            titleTextStyle: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 20),
                                            title: const Text("Enroll"),
                                            content: CreditCard(),
                                            actions: [
                                              ElevatedButton(
                                                  onPressed: () async {
                                                    Get.back();
                                                    await DBHelper.db
                                                        .collection("Enrolled")
                                                        .add(Enrolled(
                                                                coursekey:
                                                                    course.key!)
                                                            .toMap());
                                                    await DBHelper.db
                                                        .collection(
                                                            "Notifications")
                                                        .add(Notifications(
                                                                text: "Course Successfully Enrolled " +
                                                                    "[${course.name}]")
                                                            .toMap());
                                                    enrollController.enroll(
                                                        usercontroller
                                                            .userProvider!
                                                            .user![0]
                                                            .sqlId,
                                                        course.key,
                                                        course.price,
                                                        DBHelper.auth
                                                            .currentUser!.uid);

                                                    Get.showSnackbar(
                                                      GetSnackBar(
                                                          duration:
                                                              const Duration(
                                                                  seconds: 5),
                                                          message:
                                                              "Successfully Enrolled in ${course.name}"),
                                                    );
                                                  },
                                                  child: const Text("Pay")),
                                              ElevatedButton(
                                                  onPressed: () {
                                                    Get.back();
                                                  },
                                                  child: const Text("Cancel"))
                                            ],
                                          );
                                        });
                                  });
                            } else {
                              return RoundButton(
                                  text: "Go To Course",
                                  bacground: Colors.blue,
                                  foreground: Colors.white,
                                  onPressed: () {
                                    Get.to(FullCourse(
                                      course: course,
                                    ));
                                  });
                            }
                          }
                          return const SizedBox();
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
  }

  Future<void> _refresh() {
    lessonsController.fetchData(course.key!);
    enrollController.getTotalEnroll(course.key!);
    return Future.delayed(const Duration(seconds: 3));
  }

  Widget getAllOutcomes(List<dynamic> outcomes) {
    String outcome = '';
    int i = 0;
    if (outcomes.isEmpty) {
      outcome = 'No infomation';
    }
    for (i; i < outcomes.length; i++) {
      outcome = '•  ${outcomes[i]}\n$outcome';
    }
    return Flexible(
      child: Text(outcome,
          softWrap: true,
          maxLines: i > 1 ? i + 1 : 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 14, color: labelColor)),
    );
  }
}
