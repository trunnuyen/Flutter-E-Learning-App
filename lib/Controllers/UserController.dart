import 'dart:convert';

import 'package:online_learning_app/Provider/UserProvider.dart';
import 'package:online_learning_app/Repository/DBHelper.dart';
import 'package:online_learning_app/public/api.dart';
import 'package:get/get.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

class UserController extends GetxController {
  var isLoading = false.obs;

  UserProvider? userProvider;

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

        print(' fetching data user');
      } else {
        print('error fetching data user');
      }
    } catch (e) {
      print('Eeerror while getting data is $e');

      isLoading(false);
    }
  }

}
