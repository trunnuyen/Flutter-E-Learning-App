import 'package:flutter/material.dart';
import 'package:online_learning_app/view/theme/color.dart';
import 'package:online_learning_app/view/utils/data.dart';
import 'package:online_learning_app/view/widgets/custom_image.dart';
import 'package:online_learning_app/view/widgets/setting_box.dart';
import 'package:online_learning_app/view/widgets/setting_item.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePage createState() => _ProfilePage();
}

class _ProfilePage extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
            backgroundColor: appBgColor,
            pinned: true,
            snap: true,
            floating: true,
            title: getHeader()),
        SliverToBoxAdapter(child: getBody())
      ],
    );
  }

  getHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Text(
          "Account",
          style: TextStyle(
              color: textColor, fontSize: 24, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }

  Widget getBody() {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Column(
        children: [
          Column(
            children: [
              CustomImage(
                profile["image"]!,
                width: 70,
                height: 70,
                radius: 20,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                profile["name"]!,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: SettingBox(
                title: "12 courses",
                icon: "assets/icons/work.svg",
              )),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                  child: SettingBox(
                title: "55 hours",
                icon: "assets/icons/time.svg",
              )),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                  child: SettingBox(
                title: "4.8",
                icon: "assets/icons/star.svg",
              )),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.only(left: 15, right: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: cardColor,
              boxShadow: [
                BoxShadow(
                  color: shadowColor.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: const Offset(0, 1), // changes position of shadow
                ),
              ],
            ),
            child: Column(children: [
              SettingItem(
                title: "Setting",
                leadingIcon: "assets/icons/setting.svg",
                bgIconColor: blue,
                onTap: () {},
              ),
              Padding(
                padding: const EdgeInsets.only(left: 45),
                child: Divider(
                  height: 0,
                  color: Colors.grey.withOpacity(0.8),
                ),
              ),
              SettingItem(
                title: "Payment",
                leadingIcon: "assets/icons/wallet.svg",
                bgIconColor: green,
                onTap: () {},
              ),
              Padding(
                padding: const EdgeInsets.only(left: 45),
                child: Divider(
                  height: 0,
                  color: Colors.grey.withOpacity(0.8),
                ),
              ),
              SettingItem(
                title: "Bookmark",
                leadingIcon: "assets/icons/bookmark.svg",
                bgIconColor: primary,
                onTap: () {},
              ),
            ]),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.only(left: 15, right: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: cardColor,
              boxShadow: [
                BoxShadow(
                  color: shadowColor.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: const Offset(0, 1), // changes position of shadow
                ),
              ],
            ),
            child: Column(children: [
              SettingItem(
                title: "Notification",
                leadingIcon: "assets/icons/bell.svg",
                bgIconColor: purple,
                onTap: () {},
              ),
              Padding(
                padding: const EdgeInsets.only(left: 45),
                child: Divider(
                  height: 0,
                  color: Colors.grey.withOpacity(0.8),
                ),
              ),
              SettingItem(
                title: "Privacy",
                leadingIcon: "assets/icons/shield.svg",
                bgIconColor: orange,
                onTap: () {},
              ),
            ]),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.only(left: 15, right: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: cardColor,
              boxShadow: [
                BoxShadow(
                  color: shadowColor.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: const Offset(0, 1), // changes position of shadow
                ),
              ],
            ),
            child: Column(children: [
              SettingItem(
                title: "Log Out",
                leadingIcon: "assets/icons/logout.svg",
                bgIconColor: darker,
                onTap: () {},
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
