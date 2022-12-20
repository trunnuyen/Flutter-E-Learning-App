import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:online_learning_app/Repository/DBHelper.dart';
import 'package:online_learning_app/Routes/AppRoutes.dart';
import 'package:online_learning_app/Widgets/Icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainAppBar extends StatelessWidget with PreferredSizeWidget {
  const MainAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: online_learning_appIcon(
        myicon: Icons.library_books,
        background: Colors.blue.shade700,
        foreground: Colors.white,
      ),
      title: StreamBuilder(
        stream: DBHelper.db
            .collection("Users")
            .where("key", isEqualTo: DBHelper.auth.currentUser!.uid)
            .snapshots(),
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.hasData) {
            var username = snapshot.data!.docs[0].get("Name").toString();
            return Text(
              "Hello, " + username.split(" ").first + " !",
              style: TextStyle(fontWeight: FontWeight.bold),
            );
          }
          return Text("");
        },
      ),
      actions: [
        InkWell(
          onTap: () {
            Get.toNamed(AppRoutes.ViewNotifications);
          },
          child: online_learning_appIcon(
              myicon: Icons.notifications,
              background: Colors.grey.shade200,
              foreground: Colors.blue.shade700),
        ),
        InkWell(
            onTap: () {
              Get.toNamed(AppRoutes.WishList);
            },
            child: online_learning_appIcon(
                myicon: Icons.favorite,
                background: Colors.grey.shade200,
                foreground: Colors.blue.shade700))
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
