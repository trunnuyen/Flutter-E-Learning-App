import 'package:flutter/material.dart';

import '../../theme/color.dart';
import '../../utils/data.dart';
import '../../widgets/course_attributes.dart';
import '../../widgets/custom_image.dart';

class MyCoursesPage extends StatefulWidget {
  const MyCoursesPage({super.key});

  @override
  State<MyCoursesPage> createState() => _MyCoursesPageState();
}

class _MyCoursesPageState extends State<MyCoursesPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBgColor,
      appBar: AppBar(
        backgroundColor: appBarColor,
        shadowColor: appBarColor.withOpacity(0),
        title: const Text(
          'My Courses',
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.w600,
            fontSize: 24,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            getTabBar(),
            getTabBarView(),
          ],
        ),
      ),
    );
  }

  Widget getTabBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TabBar(
        controller: tabController,
        tabs: const [
          Tab(
            child: Text(
              'Enrolled',
              style: TextStyle(
                color: blue,
                fontSize: 16,
              ),
            ),
          ),
          Tab(
            child: Text(
              'Bookmarked',
              style: TextStyle(
                color: blue,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getTabBarView() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 655,
      width: double.infinity,
      child: TabBarView(
        controller: tabController,
        children: [
          Container(
            child: getMyCourse(),
          ),
          Container(
            child: Text('2'),
          ),
        ],
      ),
    );
  }

  Widget getMyCourse(){
    return ListView.builder(
      itemCount: courses.length,
      itemBuilder: (context, index) => Container(
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
            CustomImage(
              courses[index]["image"],
              radius: 10,
              width: 70,
              height: 70,
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    courses[index]["name"],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Attribute(
                    icon: Icons.access_time,
                    data: courses[index]["duration"],
                    color: labelColor,
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios_rounded),
          ],
        ),
      ),
    );
  }
}
