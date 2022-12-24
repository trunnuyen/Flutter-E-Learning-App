import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:online_learning_app/Provider/EnrollProvider.dart';
import 'package:online_learning_app/Repository/DBHelper.dart';
import 'package:online_learning_app/public/api.dart';

import '../Provider/LessonsProvider.dart';

class EnrollController extends GetxController {
  var isLoading = false.obs;
  EnrollProvider? enrollProvider, enrolTotal;

  @override
  Future<void> onInit() async {
    super.onInit();
    getEnroll();
  }

  getEnroll() async {
    try {
      isLoading(true);
      http.Response response = await http.get(Uri.tryParse(
          '$baseApi/online_learning_api/api/EnrolAPI.php?firebase_id=${DBHelper.auth.currentUser!.uid}')!);

      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        enrollProvider = EnrollProvider.fromJson(result);
        print(' fetching data enroll');
      } else {
        print('error fetching data enrol');
      }
    } catch (e) {
      print('Eeerror while posting data is $e');
    } finally {
      isLoading(false);
    }
  }

  getTotalEnroll(var courseId) async {
    try {
      isLoading(true);
      http.Response response = await http.get(Uri.tryParse(
          '$baseApi/online_learning_api/api/TotalEnrollAPI.php?course_id=$courseId')!);

      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        enrolTotal = EnrollProvider.fromJson(result);
        print(' fetching data enroll total');
        print(enrolTotal!.enrolls!.length);
      } else {
        print('error fetching dataa total enroll ');
      }
    } catch (e) {
      print('Eeerror while posting data is $e');
    } finally {
      isLoading(false);
    }
  }

  enroll(var userId, var courseId, var coursePrice, var firebaseId) async {
    try {
      http.Response response = await http.get(Uri.tryParse(
          '$baseApi/online_learning_api/api/Enroll.php?user_id=$userId&course_id=$courseId&course_price=$coursePrice&firebase_id=$firebaseId')!);

      if (response.statusCode == 200) {
        print(response);
      } else {
        print('error enrol');
      }
    } catch (e) {
      print('Eeerror while enrolling is $e');
    } finally {}
  }
}
