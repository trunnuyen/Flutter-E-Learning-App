import 'package:flutter/material.dart';
import 'package:online_learning_app/view/theme/color.dart';
import 'package:online_learning_app/view/widgets/bookmark_box.dart';
import 'package:online_learning_app/view/widgets/custom_image.dart';
import 'package:readmore/readmore.dart';

import '../../utils/data.dart';
import '../../utils/persistent_header.dart';
import '../../widgets/course_attributes.dart';
import 'components/rating.dart';
import '../../widgets/recommend_courses.dart';

class CourseDetailPage extends StatefulWidget {
  const CourseDetailPage({super.key, this.data});
  final data;

  @override
  State<CourseDetailPage> createState() => _CourseDetailPageState();
}

class _CourseDetailPageState extends State<CourseDetailPage>
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
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            backgroundColor: appBarColor,
            pinned: true,
            snap: true,
            floating: true,
            title: Text(
              'Course Detail',
              style: TextStyle(
                color: textColor,
              ),
            ),
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
            centerTitle: true,
          ),
          SliverToBoxAdapter(
            child: getThumbnail(),
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: PersistentHeader(widget: getHeader(), max: 30, min: 30),
          ),
          SliverToBoxAdapter(
            child: getAttributes(),
          ),
          SliverToBoxAdapter(
            child: aboutCourse(),
          ),
          SliverToBoxAdapter(
            child: getTabBar(),
          ),
          SliverToBoxAdapter(
            child: getTabBarView(),
          ),
          SliverToBoxAdapter(
            child: RecommendCourses(data: features),
          ),
          const SliverToBoxAdapter(
            child: CourseRating(),
          ),
        ],
      ),
      bottomNavigationBar: getFooter(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: const Text(
        'Course Detail',
        style: TextStyle(
          color: textColor,
        ),
      ),
      backgroundColor: appBarColor,
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
      centerTitle: true,
    );
  }

  Widget getThumbnail() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 20.0),
      child: CustomImage(
        widget.data["image"]!,
        width: double.infinity,
        height: 180,
        radius: 10,
      ),
    );
  }

  Widget getHeader() {
    return Container(
      decoration: BoxDecoration(
        color: appBarColor.withOpacity(.7),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
            ),
            child: Text(
              widget.data["name"],
              style: const TextStyle(
                color: textColor,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              right: 10,
            ),
            child: BookmarkBox(
                onTap: () {
                  onTapBookmark();
                },
                isBookmarked: widget.data["is_favorited"]),
          ),
        ],
      ),
    );
  }

  Widget getAttributes() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 20.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Attribute(
          icon: Icons.access_time,
          data: widget.data["duration"],
          color: labelColor,
        ),
        Attribute(
          icon: Icons.play_circle_outline_rounded,
          data: widget.data["session"],
          color: labelColor,
        ),
        Attribute(
          icon: Icons.star_outlined,
          data: widget.data["review"],
          color: yellow,
        ),
      ]),
    );
  }

  Widget aboutCourse() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 5.0),
          child: Text(
            'About Course',
            style: TextStyle(
              color: textColor,
              fontSize: 22,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 20.0),
          child: ReadMoreText(
            widget.data["description"],
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
      ],
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
              'Lessons',
              style: TextStyle(
                color: blue,
                fontSize: 16,
              ),
            ),
          ),
          Tab(
            child: Text(
              'Excercises',
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
      height: 350,
      width: double.infinity,
      child: TabBarView(
        controller: tabController,
        children: [
          Container(
            child: getLesson(),
          ),
          Container(
            child: Text('2'),
          ),
        ],
      ),
    );
  }

  Widget getLesson() {
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (context, index) => Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
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
              widget.data["image"],
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
                    widget.data["name"],
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
                    data: widget.data["duration"],
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

  Widget getFooter() {
    return Container(
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: shadowColor.withOpacity(.05),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'price',
                style: TextStyle(
                  color: labelColor,
                  fontSize: 16,
                ),
              ),
              Text(
                widget.data["price"],
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Container(
                padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                decoration: BoxDecoration(
                  color: primary,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Center(
                  child: Text(
                    'Buy now',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  onTapBookmark() {
    setState(() {
      widget.data["is_favorited"] = !widget.data["is_favorited"];
    });
  }
}
