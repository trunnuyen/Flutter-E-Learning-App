import 'package:online_learning_app/Controllers/CategoryController.dart';
import 'package:online_learning_app/Controllers/HomeController.dart';
import 'package:online_learning_app/Controllers/UserController.dart';
import 'package:online_learning_app/Views/ExploreView.dart';
import 'package:online_learning_app/Views/MainView.dart';
import 'package:online_learning_app/Views/MyCourseView.dart';
import 'package:online_learning_app/Views/ProfileView.dart';
import 'package:online_learning_app/Views/SearchView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class HomePage extends GetView {
  @override
  Widget build(BuildContext context) {
    PersistentTabController navcontroller;
    navcontroller = PersistentTabController(initialIndex: 0);
    var _controller = Get.put(HomeController());
    CategoryController categoryController = Get.put(CategoryController());
    UserController usercontroller = Get.put(UserController());

    List<Widget> _buildScreens() {
      return [MainView(), ExploreView(), MyCourseView(), ProfileView()];
    }

    List<PersistentBottomNavBarItem> _navBarsItems() {
      return [
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.home),
          title: ("Home"),
          activeColorPrimary: CupertinoColors.activeBlue,
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(CupertinoIcons.search),
          title: ("Search"),
          activeColorPrimary: CupertinoColors.activeBlue,
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.list),
          title: ("Courses"),
          activeColorPrimary: CupertinoColors.activeBlue,
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.person),
          title: ("Profile"),
          activeColorPrimary: CupertinoColors.activeBlue,
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),
      ];
    }

    return Obx(() => PersistentTabView(
          context,
          controller: navcontroller,
          screens: _buildScreens(),
          items: _navBarsItems(),
          confineInSafeArea: true,
          hideNavigationBar: !_controller.showNavBar.value,
          decoration: NavBarDecoration(
            borderRadius: BorderRadius.circular(10.0),
            colorBehindNavBar: Colors.white,
          ),
          popAllScreensOnTapOfSelectedTab: true,
          popActionScreens: PopActionScreensType.all,
          itemAnimationProperties: const ItemAnimationProperties(
            // Navigation Bar's items animation properties.
            duration: Duration(milliseconds: 200),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: const ScreenTransitionAnimation(
            // Screen transition animation on change of selected tab.
            animateTabTransition: true,
            curve: Curves.ease,
            duration: Duration(milliseconds: 200),
          ),
          navBarStyle: NavBarStyle
              .style1, // Choose the nav bar style with this property.
        ));
  }
}
