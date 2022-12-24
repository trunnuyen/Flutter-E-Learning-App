import 'dart:convert';

import 'package:online_learning_app/Models/Course.dart';
import 'package:online_learning_app/Provider/CourseProvider.dart';
import 'package:online_learning_app/public/api.dart';
import 'package:get/get.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:online_learning_app/public/string.dart';

class CourseController extends GetxController {
  var isLoading = false.obs;

  CourseProvider? courseProvider, discountedcourses, courseSearch, freeCourse;
  CourseProvider? courseWishlist;

  var currentIndex = 0.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    fetchData();
    fetchDiscountedCourse();
    fetchFreeCourse();
  }

  fetchData() async {
    try {
      isLoading(true);
      http.Response response = await http.get(Uri.tryParse(
          '$baseApi/online_learning_api/api/CourseAPI.php?allcourses')!);
      if (response.statusCode == 200) {
        ///data successfully
        var result = jsonDecode(response.body);

        courseProvider = CourseProvider.fromJson(result);

        print(' fetching data');
      } else {
        print('error fetching data');
      }
    } catch (e) {
      print('Error while getting data is $e');
    } finally {
      isLoading(false);
    }
  }

  fetchDiscountedCourse() async {
    try {
      isLoading(true);
      http.Response response = await http.get(Uri.tryParse(
          '$baseApi/online_learning_api/api/CourseAPI.php?discountedcourses')!);
      if (response.statusCode == 200) {
        ///data successfully
        var result = jsonDecode(response.body);

        discountedcourses = CourseProvider.fromJson(result);
        print(' fetching data');
      } else {
        print('error fetching data');
      }
    } catch (e) {
      print('Error while getting data is $e');
    } finally {
      isLoading(false);
    }
  }

  fetchFreeCourse() async {
    try {
      isLoading(true);
      http.Response response = await http.get(Uri.tryParse(
          '$baseApi/online_learning_api/api/CourseAPI.php?freecourses')!);
      if (response.statusCode == 200) {
        ///data successfully
        var result = jsonDecode(response.body);

        freeCourse = CourseProvider.fromJson(result);
        print(' fetching data free course');
      } else {
        print('error fetching data free course');
      }
    } catch (e) {
      print('Error while getting data free course is $e');
    } finally {
      isLoading(false);
    }
  }

  fetchCourseByID(int id) async {
    try {
      isLoading(true);
      http.Response response = await http.get(Uri.tryParse(
          '$baseApi/online_learning_api/api/CourseByIdAPI.php?id=${id.toString()}')!);
      if (response.statusCode == 200) {
        ///data successfully
        var result = jsonDecode(response.body);
        update();

        courseWishlist = CourseProvider.fromJson(result);
        print(' fetching data 1 course');
      } else {
        print('error fetching data  1 course');
      }
    } catch (e) {
      print('Error while getting data is $e  1 course');
    } finally {
      isLoading(false);
    }
  }

  fetchCourseSearch({String? categoryId, String? key = ''}) async {
    try {
      isLoading(true);
      http.Response response = await http.get(Uri.tryParse(
          '$baseApi/online_learning_api/api/CourseSearchAPI.php?key=$key&sub_category=$categoryId')!);
      if (response.statusCode == 200) {
        ///data successfully
        var result = jsonDecode(response.body);
        courseSearch = CourseProvider.fromJson(result);
        print(' fetching data 1 course');
      } else {
        print('error fetching data  1 course');
      }
    } catch (e) {
      print('Error while getting data is $e  1 course');
    } finally {
      isLoading(false);
    }
  }
}
