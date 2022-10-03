import 'package:flutter/material.dart';
import 'package:online_learning_app/view/screens/profile.dart';
import 'package:online_learning_app/view/theme/color.dart';
import '../widgets/bottom_bar_item.dart';
import 'explore.dart';
import 'home.dart';

class RootApp extends StatefulWidget {
  const RootApp({super.key});

  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int activePageIndex = 0;

  final PageController _pageController = PageController();

  List tabItems = [
    {"icon": "assets/icons/home.svg", "page": const HomePage()},
    {"icon": "assets/icons/search.svg", "page": const ExplorePage()},
    {
      "icon": "assets/icons/play.svg",
      "page": Container(child: Center(child: Text("Play")))
    },
    {
      "icon": "assets/icons/chat.svg",
      "page": Container(child: Center(child: Text("Chat")))
    },
    {
      "icon": "assets/icons/profile.svg",
      "page": const ProfilePage(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  Widget buildBody() {
    return PageView(
      controller: _pageController,
      children:
          List.generate(tabItems.length, (index) => tabItems[index]["page"]),
      onPageChanged: (page) {
        onPageIndexChange(page);
      },
    );
  }

  Widget buildBottomNavigationBar() {
    return Container(
      width: double.infinity,
      height: 75,
      padding: const EdgeInsets.fromLTRB(25, 0, 25, 15),
      decoration: BoxDecoration(
          color: bottomBarColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
          boxShadow: [
            BoxShadow(
              color: shadowColor.withOpacity(.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(1, 1),
            ),
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          tabItems.length,
          (index) => BottomBarItem(
              asset: tabItems[index]["icon"],
              isActive: activePageIndex == index,
              activeColor: primary,
              onTap: () {
                onPageIndexChange(index);
                _pageController.animateToPage(activePageIndex,
                    curve: Curves.easeInOut,
                    duration: const Duration(milliseconds: 400));
              }),
        ),
      ),
    );
  }

  onPageIndexChange(index) {
    setState(() {
      activePageIndex = index;
    });
  }
}
