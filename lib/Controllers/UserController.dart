import 'dart:convert';

import 'package:online_learning_app/Controllers/CourseController.dart';
import 'package:online_learning_app/Models/Course.dart';
import 'package:online_learning_app/Provider/UserProvider.dart';
import 'package:online_learning_app/Repository/DBHelper.dart';
import 'package:online_learning_app/public/api.dart';
import 'package:get/get.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

CourseController courseController = Get.find<CourseController>();

class UserController extends GetxController {
  var isLoading = false.obs;

  UserProvider? userProvider;

  var coursesWishlist = <dynamic>{}.obs;
  var coursesWishlistId = [].obs.cast<int>();
  var decode;

  @override
  Future<void> onInit() async {
    super.onInit();
    fetchData();
  }

  fetchData() async {
    try {
      isLoading(true);
      http.Response response = await http.get(Uri.tryParse(
          '$baseApi/online_learning_api/api/UserAPI.php?firebase_id=${DBHelper.auth.currentUser!.uid}')!);
      if (response.statusCode == 200) {
        ///data successfully
        var result = jsonDecode(response.body);

        userProvider = UserProvider.fromJson(result);
        decode = json.decode(userProvider!.user![0].wishlist);
        if (decode != null) {
          coursesWishlistId = decode.cast<int>().toList();
        } else {
          coursesWishlistId.toList();
        }

        // int index_a = 0, index_b = 0;
        // while (index_a < coursesWishlistId.length &&
        //     index_b < courseController.courseProvider!.courses!.length) {
        //   if (coursesWishlistId[index_a].toString() ==
        //       courseController.courseProvider!.courses![index_b].key) {
        //     coursesWishlist
        //         .add(courseController.courseProvider!.courses![index_b]);
        //     coursesWishlist.toList().sort();
        //     index_a++;
        //     index_b++;
        //   } else if (coursesWishlistId[index_a] > coursesWishlistId[index_b]) {
        //     index_b++;
        //   } else {
        //     index_a++;
        //   }
        // }

        for (int i = 0; i < coursesWishlistId.length; i++) {
          // courseController
          //     .fetchCourseByID(int.parse(userProvider!.user![0].wishlist[i]));
          for (int j = 0;
              j < courseController.courseProvider!.courses!.length;
              j++) {
            if (courseController.courseProvider!.courses![j].key ==
                coursesWishlistId[i].toString()) {
              coursesWishlist.add(courseController.courseProvider!.courses![j]);
              coursesWishlist.toList();
            } else {
              coursesWishlist.toList();
            }
          }

          print(userProvider!.user![0].wishlist[i]);
        }

        print(' fetching data');
        print(coursesWishlistId.toString());
        print(coursesWishlist.toString());
      } else {
        print('error fetching data');
        print(coursesWishlistId.toString());
        print(coursesWishlist.toString());
      }
    } catch (e) {
      print('Eeerror while getting data is $e');
      print(coursesWishlistId.toString());
      print(coursesWishlist.toString());
    } finally {
      isLoading(false);
      print(coursesWishlistId.toString());
      print(coursesWishlist.toString());
    }
  }

  saveToWishlist(List<dynamic> coursesWishlist) async {
    try {
      isLoading(true);
      http.Response response = await http.post(Uri.tryParse(
          '$baseApi/online_learning_api/api/SaveWishlist.php?firebase_id=${DBHelper.auth.currentUser!.uid}&wishlist=${coursesWishlist.toString()}')!);

      if (response.statusCode == 200) {
        print(' fetching data');
      } else {
        print('error fetching data');
      }
    } catch (e) {
      print('Eeerror while posting data is $e');
    } finally {
      isLoading(false);
    }
  }
}
