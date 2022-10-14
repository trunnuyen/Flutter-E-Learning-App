import 'package:flutter/material.dart';
import 'package:online_learning_app/view/screens/explore/components/course_explore_card.dart';
import 'package:online_learning_app/view/widgets/search_box.dart';

import '../../theme/color.dart';
import '../../utils/data.dart';
import '../../widgets/category_box_explore.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  int activeCategoryIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBgColor,
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            backgroundColor: appBarColor,
            pinned: true,
            snap: true,
            floating: true,
            title: Text(
              'Explore',
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.w600,
                fontSize: 24,
              ),
            ),
            automaticallyImplyLeading: false,
          ),
          const SliverToBoxAdapter(
            child: SearchBox(),
          ),
          SliverToBoxAdapter(
            child: getCategories(),
          ),
          SliverList(
            delegate: getCourses(),
          ),
        ],
      ),
    );
  }

  Widget getCategories() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: List.generate(
            categories.length,
            (index) => ExploreCategory(
              data: categories[index],
              isActive: activeCategoryIndex == index,
              onTap: (() => onCategoryIndexChange(index)),
            ),
          ),
        ),
      ),
    );
  }

  getCourses() {
    return SliverChildBuilderDelegate(
      (
        context,
        index,
      ) {
        return CourseExploreCard(
            data: courses[index],
            onTap: () {
              onTapBookmark(index);
            });
      },
      childCount: courses.length,
    );
  }

  onCategoryIndexChange(index) {
    setState(() {
      activeCategoryIndex = index;
    });
  }

  onTapBookmark(index) {
    setState(() {
      courses[index]["is_favorited"] = !courses[index]["is_favorited"];
    });
  }
}
