import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:online_learning_app/Models/Course.dart';
import 'package:online_learning_app/Models/Enrolled.dart';
import 'package:online_learning_app/Models/Notifications.dart';
import 'package:online_learning_app/Views/FullCourse.dart';
import 'package:online_learning_app/Views/VideoViewer.dart';
import 'package:online_learning_app/Widgets/BackBtn.dart';
import 'package:online_learning_app/Widgets/RoundButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_learning_app/public/color.dart';
import 'package:online_learning_app/public/default.dart';
import 'package:readmore/readmore.dart';
import '../Repository/DBHelper.dart';

class ViewCourse extends StatelessWidget {
  Course course;

  ViewCourse({Key? key, required this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackBtn(),
        title: Text(
          course.name!,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                clipBehavior: Clip.hardEdge,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
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
                          // Text(
                          //   snap.get("totalEnrollments").toString(),
                          //   style: TextStyle(color: Colors.blue.shade700),
                          // )
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
                          // StreamBuilder(
                          //   stream: DBHelper.db
                          //       .collection("Rating")
                          //       .where("coursekey", isEqualTo: snap.get("key"))
                          //       .snapshots(),
                          //   builder: (BuildContext context,
                          //       AsyncSnapshot<
                          //               QuerySnapshot<Map<String, dynamic>>>
                          //           snapshot) {
                          //     if (snapshot.hasData) {
                          //       var arr = snapshot.data!.docs;
                          //       var avg = 0.0;
                          //       if (arr.length > 0)
                          //         avg = arr
                          //             .map((e) => double.parse(
                          //                 e.get("rating").toString()))
                          //             .average;
                          //       return Text(
                          //         avg.toStringAsFixed(1),
                          //         style: TextStyle(color: Colors.blue.shade700),
                          //       );
                          //     }
                          //     return const SizedBox();
                          //   },
                          // ),
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
                  style: const TextStyle(fontSize: 14, color: labelColor),
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
              // StreamBuilder(
              //   stream: DBHelper.db
              //       .collection("Enrolled")
              //       .where("userkey", isEqualTo: DBHelper.auth.currentUser!.uid)
              //       .snapshots(),
              //   builder: (BuildContext context,
              //       AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
              //           snapshot) {
              //     if (snapshot.hasData) {
              //       var arr = snapshot.data!.docs.where((element) =>
              //           element.get("coursekey") == snap.get("key"));
              //       if (arr.isEmpty) {
              //         return RoundButton(
              //             text: "Enroll - \$" + snap.get("price").toString(),
              //             bacground: Colors.blue.shade600,
              //             foreground: Colors.white,
              //             onPressed: () async {
              //               await DBHelper.db.collection("Enrolled").add(
              //                   Enrolled(coursekey: snap.get("key")).toMap());
              //               await DBHelper.db.collection("Notifications").add(
              //                   Notifications(
              //                           text: "Course Successfully Enrolled " +
              //                               "[${snap.get("name")}]")
              //                       .toMap());
              //               await snap.reference.update({
              //                 "totalEnrollments":
              //                     snap.get("totalEnrollments") + 1
              //               });
              //               Get.showSnackbar(
              //                 GetSnackBar(
              //                     duration: const Duration(seconds: 5),
              //                     message: "Successfully Enrolled in " +
              //                         snap.get("name").toString()),
              //               );
              //             });
              //       } else {
              //         return RoundButton(
              //             text: "Go To Course",
              //             bacground: Colors.blue,
              //             foreground: Colors.white,
              //             onPressed: () {
              //               Get.to(FullCourse(
              //                 coursekey: snap.get("key"),
              //               ));
              //             });
              //       }
              //     }
              //     return const SizedBox();
              //   },
              // )
            ],
          ),
        ),
      ),
    );
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
