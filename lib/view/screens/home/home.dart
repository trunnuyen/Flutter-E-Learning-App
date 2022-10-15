import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:online_learning_app/view/theme/color.dart';
import 'package:online_learning_app/view/utils/data.dart';
import 'package:online_learning_app/view/screens/home/components/course_featured_card.dart';
import 'package:online_learning_app/view/widgets/course_recommend_card.dart';
import 'package:online_learning_app/view/screens/home/components/greeting_icon_box.dart';
import 'package:online_learning_app/view/widgets/notification_box.dart';

import '../../widgets/circle_avatar.dart';
import '../../widgets/recommend_courses.dart';
import 'components/category_box.dart';
import '../course_detail/course_detail.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _greetingText = 'Hello';

  @override
  void initState() {
    super.initState();
    getGreetingText();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBgColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: appBarColor,
            pinned: true,
            snap: true,
            floating: true,
            title: getAppBar(),
            actions: [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
                child: NotificationBox(
                  notifiedNumber: 1,
                ),
              ),
            ],
            automaticallyImplyLeading: false,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => buildBody(),
              childCount: 1,
            ),
          )
        ],
      ),
    );
  }

  Widget buildBody() {
    return SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        getCategories(),
        const Padding(
          padding: EdgeInsets.fromLTRB(15, 0, 15, 10),
          child: Text(
            "Featured",
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.w600,
              fontSize: 22,
            ),
          ),
        ),
        getFeatured(),
        RecommendCourses(data: features),
      ]),
    );
  }

  Widget getAppBar() {
    return Container(
      padding: const EdgeInsets.only(left: 5),
      height: 50,
      decoration: BoxDecoration(
        color: appBarColor,
        borderRadius: const BorderRadius.all(Radius.circular(25)),
        boxShadow: [
          BoxShadow(
            color: shadowColor.withOpacity(.1),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(1, 1),
          ),
        ],
      ),
      child: Row(children: [
        Flexible(
          child: Avatar(imgUrl: 'assets/images/cat.jpg'),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          flex: 3,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Your Name",
                  style: TextStyle(color: labelColor, fontSize: 14),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "$_greetingText!",
                  style: const TextStyle(
                      color: textColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ]),
        ),
        Flexible(
          child: Align(
            alignment: const Alignment(1.5, 0),
            child: GreetingBoxIcon(
              grettingText: getGreetingText(),
            ),
          ),
        ),
      ]),
    );
  }

  Widget getCategories() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: List.generate(
            categories.length,
            (index) => CategoryBox(data: categories[index]),
          ),
        ),
      ),
    );
  }

  Widget getFeatured() {
    return CarouselSlider(
      items: List.generate(
        features.length,
        (index) => GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => CourseDetailPage(data: courses[index])));
            },
            child: FeatureCard(data: features[index])),
      ),
      options: CarouselOptions(
        height: 290,
        enlargeCenterPage: true,
        disableCenter: true,
        autoPlay: true,
      ),
    );
  }

  String getGreetingText() {
    TimeOfDay morningTime =
        TimeOfDay(hour: int.parse('10'), minute: int.parse('0'));

    double doubleMorningTime =
        morningTime.hour.toDouble() + (morningTime.minute.toDouble() / 60);

    TimeOfDay afternoonTime =
        TimeOfDay(hour: int.parse('17'), minute: int.parse('0'));

    double doubleAfternoonTime =
        afternoonTime.hour.toDouble() + (afternoonTime.minute.toDouble() / 60);

    TimeOfDay eveningTime =
        TimeOfDay(hour: int.parse('21'), minute: int.parse('0'));

    double doubleEveningTime =
        eveningTime.hour.toDouble() + (eveningTime.minute.toDouble() / 60);

    TimeOfDay now = TimeOfDay.now();

    double doubleNowTime = now.hour.toDouble() + (now.minute.toDouble() / 60);

    print(doubleEveningTime);
    print(doubleNowTime);

    if (doubleNowTime <= doubleMorningTime) {
      setState(() {
        _greetingText = 'Good Morning';
        print(_greetingText);
      });
    }
    if (doubleNowTime > doubleMorningTime &&
        doubleNowTime <= doubleAfternoonTime) {
      setState(() {
        _greetingText = 'Good Afternoon';
        print(_greetingText);
      });
    }
    if (doubleNowTime > doubleAfternoonTime &&
        doubleNowTime <= doubleEveningTime) {
      setState(() {
        _greetingText = 'Good Evening';
        print(_greetingText);
      });
    }
    if (doubleNowTime > doubleEveningTime) {
      setState(() {
        _greetingText = 'Good Night';
        print(_greetingText);
      });
    }

    return _greetingText;
  }
}
