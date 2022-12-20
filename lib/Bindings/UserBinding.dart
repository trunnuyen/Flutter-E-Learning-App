import 'package:get/get.dart';
import 'package:online_learning_app/Controllers/UserController.dart';

class UserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserController());
  }
}
