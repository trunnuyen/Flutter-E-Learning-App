// import 'dart:convert';

// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:online_learning_app/Models/LessonsList.dart';
// import 'package:online_learning_app/Views/utils/api.dart';

// import '../Models/CoursesList.dart';

// class LessonController extends GetxController {
//   var isLoading = false.obs;
//   LessonsModel? lessonModel;

//   @override
//   Future<void> onInit() async {
//     super.onInit();
//   }

//   fetchData(String course_id) async {
//     try {
//       isLoading(true);
//       http.Response response = await http.get(Uri.tryParse(
//           '$baseApi/online_learning_api/api/LessonAPI.php?course_id=$course_id')!);
//       print(
//           '$baseApi/online_learning_api/api/LessonAPI.php?course_id=$course_id');
//       if (response.statusCode == 200) {
//         ///data successfully
//         var result = jsonDecode(response.body);

//         lessonModel = LessonsModel.fromJson(result);
//         print(' fetching data                    $result');
//       } else {
//         lessonModel = [] as LessonsModel?;
//         print(
//             'error fetching dataaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa ${lessonModel!.lesson!.length}');
//       }
//     } catch (e) {
//       print('Error while getting data is $e');
//     } finally {
//       print(
//           '$baseApi/online_learning_api/api/LessonAPI.php?course_id=$course_id');
//       isLoading(false);
//     }
//   }
// }
