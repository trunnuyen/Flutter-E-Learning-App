import 'package:flutter/material.dart';
import 'package:online_learning_app/view/widgets/search_box.dart';

import '../theme/color.dart';
import '../utils/data.dart';
import '../utils/persistent_header.dart';
import '../widgets/category_box_explore.dart';

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
          SliverPersistentHeader(
            pinned: true,
            delegate: PersistentHeader(
              widget: getCategories(),
              max: 65.0,
              min: 65.0,
            ),
          ),
          SliverList(
            delegate: getCourses(),
          ),
        ],
      ),
    );
  }

  // Widget buildBody() {
  //   return SingleChildScrollView(
  //     child: Column(
  //       children: [
  //         const SearchBox(),
  //         getCategories(),
  //         getCourses(),
  //       ],
  //     ),
  //   );
  // }

  getCategories() {
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
    return SliverChildBuilderDelegate((context, index) {
      return Padding(
        padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
        child: Container(
          width: 200,
          height: 200,
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
              color: primary,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: shadowColor.withOpacity(.1),
                  blurRadius: 1,
                  spreadRadius: 1,
                  offset: const Offset(1, 1),
                ),
              ]),
        ),
      );
    });
  }

  onCategoryIndexChange(index) {
    setState(() {
      activeCategoryIndex = index;
    });
  }
}

