import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initializeNotifications() async {
    _firebaseMessaging.requestPermission().whenComplete(() async {
      final FCMToken = await _firebaseMessaging.getToken();
      log('inside Firebase API ==========');
      log('Token : $FCMToken');
      FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
    });
  }
}

Future<void> handleBackgroundMessage(RemoteMessage message) async {
  print("-----msg content------");
  print('Title : ${message.notification?.title}');
  print('Title : ${message.notification?.body}');
  print('Title : ${message.data}');
}
