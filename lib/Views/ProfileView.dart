import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:online_learning_app/RegisterProcess/Selector.dart';
import 'package:online_learning_app/Repository/DBHelper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:online_learning_app/Routes/AppRoutes.dart';
import 'package:online_learning_app/Widgets/Settingbox.dart';
import 'package:online_learning_app/Widgets/setting_item.dart';
import 'package:online_learning_app/public/color.dart';

import '../Widgets/Icon.dart';

class ProfileView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: online_learning_appIcon(
          myicon: Icons.library_books,
          background: Colors.blue.shade700,
          foreground: Colors.white,
        ),
        title: const Text(
          "Profile",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          InkWell(
            onTap: () async {
              await DBHelper.auth.signOut();
              Get.offAll(const Selector());
              Get.snackbar(
                "You are logged out",
                "Goodbye",
                icon: const Icon(Icons.logout, color: Colors.blue),
                snackPosition: SnackPosition.BOTTOM,
              );
            },
            child: online_learning_appIcon(
                myicon: Icons.logout,
                background: Colors.grey.shade200,
                foreground: Colors.blue.shade700),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          StreamBuilder(
            stream: DBHelper.db
                .collection("Users")
                .where("key", isEqualTo: DBHelper.auth.currentUser!.uid)
                .snapshots(),
            builder: (BuildContext context,
                AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
              if (snapshot.hasData) {
                var current = snapshot.data!.docs[0];
                return Column(
                  children: [
                    ListTile(
                      trailing: InkWell(
                        onTap: () async {
                          var picker = await ImagePicker().pickImage(
                              source: ImageSource.gallery,
                              maxWidth: 1800,
                              maxHeight: 1800);
                          if (picker != null) {
                            var imgdata = await picker.readAsBytes();
                            var myref = DBHelper.storage
                                .ref()
                                .child("Users")
                                .child(current.get("key"));
                            await myref.putData(imgdata);
                            var url = await myref.getDownloadURL();
                            await current.reference.update({"MyPICUrl": url});
                            Get.snackbar(
                              "Change profile image",
                              "Success",
                              icon: const Icon(Icons.image_outlined,
                                  color: Colors.blue),
                              snackPosition: SnackPosition.BOTTOM,
                            );
                          }
                        },
                        child: CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.blue.shade700,
                          child: const Icon(
                            Icons.edit,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                      title: Text(
                        current.get("Name"),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(current.get("Email")),
                      leading: CircleAvatar(
                          radius: 30,
                          backgroundImage: current.get("MyPICUrl") != ""
                              ? NetworkImage(current.get("MyPICUrl"))
                              : const AssetImage(
                                      "assets/images/placeholder.png")
                                  as ImageProvider),
                    ),
                    getBody(),
                  ],
                );
              }
              return const SizedBox();
            },
          )
        ],
      ),
    );
  }

  Widget getBody() {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: SettingBox(
                title: "12 courses",
                icon: Icons.book,
              )),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                  child: SettingBox(
                title: "55 hours",
                icon: Icons.timelapse,
              )),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                  child: SettingBox(
                title: "4.8",
                icon: Icons.star,
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
                leadingIcon: Icons.settings,
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
                leadingIcon: Icons.payment,
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
                leadingIcon: Icons.bookmark,
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
                leadingIcon: Icons.notifications,
                bgIconColor: purple,
                onTap: () {
                  Get.toNamed(AppRoutes.ViewNotifications);
                },
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
                leadingIcon: Icons.privacy_tip,
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
                leadingIcon: Icons.logout,
                bgIconColor: darker,
                onTap: () async {
                  await DBHelper.auth.signOut();
                  Get.offAll(const Selector());
                  Get.snackbar(
                    "You are logged out",
                    "Goodbye",
                    icon: const Icon(Icons.logout, color: Colors.blue),
                    snackPosition: SnackPosition.BOTTOM,
                  );
                },
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
