import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:online_learning_app/Bindings/HomeBinding.dart';
import 'package:online_learning_app/Models/Notifications.dart';
import 'package:online_learning_app/Routes/AppPages.dart';
import 'package:online_learning_app/Routes/AppRoutes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Repository/DBHelper.dart';

final navigatorKey = GlobalKey<NavigatorState>();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AwesomeNotifications().initialize('resource://drawable/notification_icon', [
    // notification icon
    NotificationChannel(
      channelGroupKey: 'basic_test',
      channelKey: 'basic',
      channelName: 'Basic notifications',
      channelDescription: 'Notification channel for basic tests',
      channelShowBadge: true,
      importance: NotificationImportance.High,
    ),
    //add more notification type with different configuration
  ]);

  //click listiner on local notification
  AwesomeNotifications()
      .actionStream
      .listen((ReceivedNotification receivedNotification) {
    print(receivedNotification.payload!['title']);
    //output from local notification click.
  });
  await Firebase.initializeApp();
  await FirebaseMessaging.instance.getToken();
  FirebaseFirestore.instance.settings = const Settings(
      persistenceEnabled: true, cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED);
  FirebaseMessaging.instance
      .subscribeToTopic("all"); //subscribe firebase message on topic

  FirebaseMessaging.onBackgroundMessage(firebaseBackgroundMessage);
  //background message listiner
  runApp(const MainApp());
}

// Declared as global, outside of any class
Future<void> firebaseBackgroundMessage(RemoteMessage message) async {
  AwesomeNotifications().createNotification(
      content: NotificationContent(
          //with image from URL
          id: 1,
          channelKey: 'basic', //channel configuration key
          title: message.data["title"],
          body: message.data["body"],
          bigPicture: message.data["image"],
          notificationLayout: NotificationLayout.BigPicture,
          payload: {"name": "flutter"}));
  DBHelper.db.collection("Notifications").add(Notifications(
          text: "Course Successfully Enrolled " "[${message.data["body"]}]")
      .toMap());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: navigatorKey,
      initialBinding: HomeBinding(),
      title: "online_learning_app",
      theme: ThemeData(
          backgroundColor: Colors.white,
          primarySwatch: Colors.blue,
          appBarTheme: const AppBarTheme(
              foregroundColor: Colors.black, backgroundColor: Colors.white),
          bottomAppBarColor: Colors.white,
          fontFamily: GoogleFonts.lato().fontFamily),
      darkTheme: ThemeData(
          backgroundColor: Colors.white,
          primarySwatch: Colors.blue,
          appBarTheme: const AppBarTheme(
              foregroundColor: Colors.black, backgroundColor: Colors.white),
          bottomAppBarColor: Colors.white,
          fontFamily: GoogleFonts.lato().fontFamily),
      debugShowCheckedModeBanner: false,
      getPages: AppPages.PagesList,
      initialRoute: AppRoutes.Splash,
    );
  }
}
