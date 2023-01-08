import 'package:online_learning_app/Controllers/HomeController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_learning_app/public/color.dart';

import '../Widgets/Icon.dart';
import '../Widgets/SelectionButton.dart';
import '../Widgets/SelectionButtonCourse.dart';

var _controller = Get.find<HomeController>();

class MyCourseView extends GetView {
  @override
  Widget build(BuildContext context) {
    enrollController.getEnroll();
    return RefreshIndicator(
      onRefresh: _refresh,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'My Courses',
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.w600,
              fontSize: 24,
            ),
          ),
        ),
        body: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Obx(
                        () => SelectionButtonCourse(
                            content: "All Courses",
                            selectedButton:
                                _controller.selectedCourseButton.value),
                      ),
                      // const SizedBox(
                      //   width: 10,
                      // ),
                      // Obx(() => SelectionButtonCourse(
                      //     content: "On Progress",
                      //     selectedButton:
                      //         _controller.selectedCourseButton.value)),
                      // const SizedBox(
                      //   width: 10,
                      // ),
                      // Obx(() => SelectionButtonCourse(
                      //     content: "Completed",
                      //     selectedButton:
                      //         _controller.selectedCourseButton.value)),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: Obx(
                      () => _controller.getMyCoursesList(
                          _controller.selectedCourseButton.value),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _refresh() {
    enrollController.getEnroll();
    return Future.delayed(const Duration(seconds: 3));
  }
}
