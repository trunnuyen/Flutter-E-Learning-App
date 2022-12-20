import 'package:get/get.dart';
import 'package:online_learning_app/Controllers/CategoryController.dart';

class CategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CategoryController());
  }
}
