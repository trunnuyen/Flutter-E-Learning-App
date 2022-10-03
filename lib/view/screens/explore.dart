import 'package:cached_network_image/cached_network_image.dart';
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
    return SliverChildBuilderDelegate((context, index) {
      return Padding(
        padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
        child: Container(
          width: 200,
          height: 290,
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: shadowColor.withOpacity(.1),
                  blurRadius: 1,
                  spreadRadius: 1,
                  offset: const Offset(1, 1),
                ),
              ]),
          child: Stack(children: [
            Container(
              width: double.infinity,
              height: 190,
              child: CachedNetworkImage(
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: imageProvider, fit: BoxFit.cover),
                  ),
                ),
                imageUrl: features[0]["image"],
              ),
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
