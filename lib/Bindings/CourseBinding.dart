
import 'package:get/get.dart';
import 'package:online_learning_app/Controllers/CourseController.dart';

class CourseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CourseController());
  }
}
