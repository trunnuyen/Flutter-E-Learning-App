import 'package:online_learning_app/Controllers/EnrollController.dart';
import 'package:get/get.dart';

class EnrollBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EnrollController());
  }
}
