import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

import '../../../theme/color.dart';

class CourseRating extends StatelessWidget {
  const CourseRating({super.key});

  @override
  Widget build(BuildContext context) {
    List<double> ratings = [0.1, 0.3, 0.5, 0.7, 0.9];
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: "4.5",
                              style: TextStyle(fontSize: 30.0),
                            ),
                            TextSpan(
                              text: "/5",
                              style: TextStyle(
                                fontSize: 20.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SmoothStarRating(
                        starCount: 5,
                        rating: 4.5,
                        size: 28.0,
                        color: Colors.orange,
                        borderColor: Colors.orange,
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        "16 Reviews",
                        style: TextStyle(
                          fontSize: 16.0,
                          color: labelColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width:5),
                  Container(
                    width: 185.0,
                    child: ListView.builder(
                      shrinkWrap: true,
                      reverse: true,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            Text(
                              "${index + 1}",
                              style: TextStyle(fontSize: 18.0),
                            ),
                            SizedBox(width: 4.0),
                            Icon(Icons.star, color: Colors.orange),
                            SizedBox(width: 8.0),
                            LinearPercentIndicator(
                              lineHeight: 6.0,
                              // linearStrokeCap: LinearStrokeCap.roundAll,
                              width: MediaQuery.of(context).size.width / 2.8,
                              animation: true,
                              animationDuration: 2500,
                              percent: ratings[index],
                              progressColor: Colors.orange,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}