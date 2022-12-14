import 'dart:developer' as dev;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:online_learning_app/Widgets/BackBtn.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../Repository/DBHelper.dart';

class ViewNotifications extends StatelessWidget {
  const ViewNotifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackBtn(),
        title: const Text(
          "Notifications",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: StreamBuilder(
        stream: DBHelper.db
            .collection("Notifications")
            .where("userkey", isEqualTo: DBHelper.auth.currentUser!.uid)
            .orderBy("key", descending: true)
            .snapshots(),
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          try {
            if (snapshot.hasData) {
              var arr = snapshot.data!.docs;
              if (arr.isEmpty) {
                return const Center(
                  child: Text(
                    "No Notifications to Show !",
                    style: TextStyle(fontSize: 20),
                  ),
                );
              }
              return ListView.builder(
                itemCount: arr.length,
                itemBuilder: (BuildContext context, int index) {
                  final df = DateFormat('dd-MM-yyyy hh:mm a');
                  var notedate = df.format(DateTime.fromMicrosecondsSinceEpoch(
                      arr[index].get("key")));
                  return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.blue.shade700,
                        child: const Icon(
                          Icons.check,
                          color: Colors.white,
                        ),
                      ),
                      title: Text(arr[index].get("text")),
                      subtitle: Text(notedate),
                    ),
                  );
                },
              );
            }
          } catch (e) {
            print(e);
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
