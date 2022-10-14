import 'package:flutter/material.dart';

import 'course_recommend_card.dart';
import '../theme/color.dart';

class RecommendCourses extends StatelessWidget {
  final data;
  const RecommendCourses({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(15, 15, 15, 10),
          child: Text(
            "Recommend",
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.w600,
              fontSize: 22,
            ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              data.length,
              (index) => CourseRecommend(data: data[index],),
            ),
          ),
        ),
      ],
    );
  }
}
