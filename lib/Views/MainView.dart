import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:online_learning_app/Controllers/HomeController.dart';
import 'package:online_learning_app/ListItems/PromotionItem.dart';
import 'package:online_learning_app/Repository/DBHelper.dart';
import 'package:online_learning_app/Routes/AppRoutes.dart';
import 'package:online_learning_app/Views/ViewCourse.dart';
import 'package:online_learning_app/Widgets/Avatar.dart';
import 'package:online_learning_app/Widgets/GreetingBox.dart';
import 'package:online_learning_app/Widgets/Icon.dart';
import 'package:online_learning_app/Widgets/MainAppBar.dart';
import 'package:online_learning_app/Widgets/SelectionButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:online_learning_app/public/color.dart';

class MainView extends GetView {
  var _greetingText = 'Hello';
  var _controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBgColor,
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: appBarColor,
              pinned: true,
              snap: true,
              floating: true,
              title: getAppBar(),
              actions: [
                InkWell(
                  onTap: () {
                    Get.toNamed(AppRoutes.ViewNotifications);
                  },
                  child: online_learning_appIcon(
                      myicon: Icons.notifications,
                      background: Colors.grey.shade200,
                      foreground: Colors.yellow),
                ),
              ],
              automaticallyImplyLeading: false,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => buildBody(),
                childCount: 1,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildBody() {
    return SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(15, 15, 15, 10),
          child: Text(
            "Promotions",
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.w600,
              fontSize: 22,
            ),
          ),
        ),
        getTopCourse(),
        const Padding(
          padding: EdgeInsets.fromLTRB(15, 20, 15, 10),
          child: Text(
            "Featured",
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.w600,
              fontSize: 22,
            ),
          ),
        ),
        getFeatured(),
        // RecommendCourses(data: features),
      ]),
    );
  }

  Widget getAppBar() {
    return Container(
      padding: const EdgeInsets.only(left: 5),
      height: 50,
      decoration: BoxDecoration(
        color: appBarColor,
        borderRadius: const BorderRadius.all(Radius.circular(25)),
        boxShadow: [
          BoxShadow(
            color: shadowColor.withOpacity(.1),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(1, 1),
          ),
        ],
      ),
      child: StreamBuilder(
        stream: DBHelper.db
            .collection("Users")
            .where("key", isEqualTo: DBHelper.auth.currentUser!.uid)
            .snapshots(),
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.hasData) {
            var current = snapshot.data!.docs[0];
            return Row(
              children: [
                Flexible(
                    child: CircleAvatar(
                        radius: 20,
                        backgroundImage: current.get("MyPICUrl") != ""
                            ? NetworkImage(current.get("MyPICUrl"))
                            : const AssetImage("assets/images/placeholder.png")
                                as ImageProvider)),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          current.get("Name"),
                          style: TextStyle(color: labelColor, fontSize: 14),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "$_greetingText!",
                          style: const TextStyle(
                              color: textColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ]),
                ),
                Flexible(
                  child: Align(
                    alignment: const Alignment(1.5, 0),
                    child: GreetingBoxIcon(
                      grettingText: getGreetingText(),
                    ),
                  ),
                ),
              ],
            );
          }
          return Image.asset("assets/images/notfound.png");
        },
      ),
    );
  }

  Widget getTopCourse() {
    return Obx(() {
      if (courseController.isLoading.value) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (courseController.discountedcourses == null) {
        return Image.asset("assets/images/notfound.png");
      }
      return CarouselSlider.builder(
          itemCount: courseController.discountedcourses!.courses!.length,
          itemBuilder: (c, i, p) {
            return InkWell(
                onTap: () {
                  Get.to(ViewCourse(
                      course: courseController.discountedcourses!.courses![i]));
                },
                child: PromotionItem(
                    course: courseController.discountedcourses!.courses![i]));
          },
          options: CarouselOptions(autoPlay: true));
    });
  }

  Widget getFeatured() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Obx(() => SelectionButton(
                      content: "All Courses",
                      selectedButton: _controller.selectedButton.value,
                      icon: Icons.book_rounded)),
                  const SizedBox(
                    width: 10,
                  ),
                  Obx(() => SelectionButton(
                      content: "Popular",
                      selectedButton: _controller.selectedButton.value,
                      icon: Icons.fireplace)),
                  const SizedBox(
                    width: 10,
                  ),
                  Obx(() => SelectionButton(
                      content: "Newest",
                      selectedButton: _controller.selectedButton.value,
                      icon: Icons.free_breakfast)),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            child: Obx(
              () => _controller.getCourseList(_controller.selectedButton.value),
            ),
          ),
        ],
      ),
    );
  }

  String getGreetingText() {
    TimeOfDay morningTime =
        TimeOfDay(hour: int.parse('10'), minute: int.parse('0'));

    double doubleMorningTime =
        morningTime.hour.toDouble() + (morningTime.minute.toDouble() / 60);

    TimeOfDay afternoonTime =
        TimeOfDay(hour: int.parse('17'), minute: int.parse('0'));

    double doubleAfternoonTime =
        afternoonTime.hour.toDouble() + (afternoonTime.minute.toDouble() / 60);

    TimeOfDay eveningTime =
        TimeOfDay(hour: int.parse('21'), minute: int.parse('0'));

    double doubleEveningTime =
        eveningTime.hour.toDouble() + (eveningTime.minute.toDouble() / 60);

    TimeOfDay now = TimeOfDay.now();

    double doubleNowTime = now.hour.toDouble() + (now.minute.toDouble() / 60);

    print(doubleEveningTime);
    print(doubleNowTime);

    if (doubleNowTime <= doubleMorningTime) {
      _greetingText = 'Good Morning';
      print(_greetingText);
    }
    if (doubleNowTime > doubleMorningTime &&
        doubleNowTime <= doubleAfternoonTime) {
      _greetingText = 'Good Afternoon';
      print(_greetingText);
    }
    if (doubleNowTime > doubleAfternoonTime &&
        doubleNowTime <= doubleEveningTime) {
      _greetingText = 'Good Evening';
      print(_greetingText);
    }
    if (doubleNowTime > doubleEveningTime) {
      _greetingText = 'Good Night';
      print(_greetingText);
    }

    return _greetingText;
  }

  Future<void> _refresh() {
    courseController.fetchData();
    courseController.fetchDiscountedCourse();
    return Future.delayed(const Duration(seconds: 3));
  }
}
// class MainView extends GetView {
//   @override
//   Widget build(BuildContext context) {
//     var _controller = Get.find<HomeController>();
//     return Scaffold(
//       appBar: MainAppBar(),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             const SizedBox(
//               height: 5,
//             ),
//             const Text(
//               "Promotion",
//               style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             Obx(() {
//               if (courseController.isLoading.value) {
//                 return const Center(
//                   child: CircularProgressIndicator(),
//                 );
//               }
//               if (courseController.discountedcourses == null) {
//                 return Image.asset("assets/images/notfound.png");
//               }
//               return CarouselSlider.builder(
//                   itemCount:
//                       courseController.discountedcourses!.courses!.length,
//                   itemBuilder: (c, i, p) {
//                     return InkWell(
//                         onTap: () {
//                           Get.to(ViewCourse(
//                               course: courseController
//                                   .discountedcourses!.courses![i]));
//                         },
//                         child: PromotionItem(
//                             course: courseController
//                                 .discountedcourses!.courses![i]));
//                   },
//                   options: CarouselOptions(autoPlay: true));
//             }),
//             const SizedBox(
//               height: 10,
//             ),
//             const Text(
//               "Awesome Courses",
//               style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Row(
//                 children: [
//                   Obx(() => SelectionButton(
//                       content: "All Courses",
//                       selectedButton: _controller.selectedButton.value,
//                       icon: Icons.book_rounded)),
//                   const SizedBox(
//                     width: 10,
//                   ),
//                   Obx(() => SelectionButton(
//                       content: "Popular",
//                       selectedButton: _controller.selectedButton.value,
//                       icon: Icons.fireplace)),
//                   const SizedBox(
//                     width: 10,
//                   ),
//                   Obx(() => SelectionButton(
//                       content: "Newest",
//                       selectedButton: _controller.selectedButton.value,
//                       icon: Icons.free_breakfast)),
//                 ],
//               ),
//             ),
//             const SizedBox(
//               height: 5,
//             ),
//             Expanded(
//               child: Obx(
//                 () =>
//                     _controller.getCourseList(_controller.selectedButton.value),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
