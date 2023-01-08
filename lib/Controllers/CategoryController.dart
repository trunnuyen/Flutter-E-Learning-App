import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:online_learning_app/Controllers/CourseController.dart';
import 'package:online_learning_app/Provider/CategoryProvider.dart';
import 'package:online_learning_app/public/api.dart';

CourseController courseController = CourseController();

class CategoryController extends GetxController {
  var isLoading = false.obs;
  CategoryProvider? category;
  var currentIndex = 0.obs;
  var page = 1.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    fetchData();
  }

  fetchData() async {
    try {
      isLoading(true);
      http.Response response = await http.get(
          Uri.tryParse('$baseApi/online_learning_api/api/CategoryAPI.php')!);
      if (response.statusCode == 200) {
        ///data successfully
        var result = jsonDecode(response.body);

        category = CategoryProvider.fromJson(result);
        await courseController.fetchCourseSearch(
          categoryId: category!.category![currentIndex.value].id.toString(),
        );

        print(category!.category![currentIndex.value].id.toString());
        print(' fetching data category');
      } else {
        print('error fetching data category');
      }
    } catch (e) {
      print('Error while getting data category issd $e');
    } finally {
      isLoading(false);
    }
  }

  // fetchDataById() async {
  //   try {
  //     isLoading(true);
  //     http.Response response = await http.get(
  //         Uri.tryParse('$baseApi/online_learning_api/api/CategoryAPI.php')!);
  //     if (response.statusCode == 200) {
  //       ///data successfully
  //       await courseController.fetchCourseByID(
  //           categoryModel!.categories![currentIndex.value].id.toString());
  //       courseLenght.value = courseController.courseModel!.courses!.length;
  //       print(categoryModel!.categories![currentIndex.value].id.toString());
  //       print(' fetching data');
  //       print(courseController.courseModel!.courses!.length);
  //     } else {
  //       print('error fetching data');
  //     }
  //   } catch (e) {
  //     print('Error while getting data is $e');
  //   } finally {
  //     isLoading(false);
  //   }
  // }
}
