import 'package:flutter/material.dart';

import '../../theme/color.dart';
import '../../utils/data.dart';
import '../../widgets/category_box_explore.dart';

class ForumPage extends StatefulWidget {
  const ForumPage({super.key});

  @override
  State<ForumPage> createState() => _ForumPageState();
}

class _ForumPageState extends State<ForumPage> {
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
              'Forum',
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.w600,
                fontSize: 24,
              ),
            ),
            automaticallyImplyLeading: false,
          ),
          SliverToBoxAdapter(
            child: getCategories(),
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

  onCategoryIndexChange(index) {
    setState(() {
      activeCategoryIndex = index;
    });
  }
}
