import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:online_learning_app/public/api.dart';

import '../Provider/LessonsProvider.dart';

class LessonController extends GetxController {
  var isLoading = false.obs;
  LessonsProvider? lessonsProvider;

  @override
  Future<void> onInit() async {
    super.onInit();
  }

  fetchData(String courseId) async {
    try {
      isLoading(true);
      http.Response response = await http.get(Uri.tryParse(
          '$baseApi/online_learning_api/api/LessonAPI.php?course_id=$courseId')!);
      if (response.statusCode == 200) {
        ///data successfully
        var result = jsonDecode(response.body);

        lessonsProvider = LessonsProvider.fromJson(result);
        print(' fetching data lesson $result');
      } else {
        print('error fetching data lesson');
      }
    } catch (e) {
      print('Error while getting data lesson is $e');
    } finally {
      isLoading(false);
    }
  }
}
