import 'package:online_learning_app/RegisterProcess/Login.dart';
import 'package:online_learning_app/RegisterProcess/Selector.dart';
import 'package:online_learning_app/Routes/AppRoutes.dart';
import 'package:online_learning_app/Views/HomePage.dart';
import 'package:online_learning_app/Views/ProfileView.dart';
import 'package:online_learning_app/Views/ViewNotifications.dart';
import 'package:online_learning_app/Views/wishListView.dart';
import 'package:get/get_navigation/get_navigation.dart';
import '../RegisterProcess/Signup.dart';

class AppPages {
  static var PagesList = <GetPage>[
    GetPage(name: AppRoutes.Selector, page: () => Selector()),
    GetPage(name: AppRoutes.Login, page: () => Login()),
    GetPage(name: AppRoutes.Register, page: () => Signup()),
    GetPage(name: AppRoutes.Home, page: () => HomePage()),
    GetPage(name: AppRoutes.WishList, page: () => wishListView()),
    GetPage(name: AppRoutes.ViewNotifications, page: () => ViewNotifications()),
    GetPage(name: AppRoutes.Profile, page: () => ProfileView()),
  ];
}
