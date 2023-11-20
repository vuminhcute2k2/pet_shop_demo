import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_shop_app/app.dart';
import 'package:pet_shop_app/controller/product_controller.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  //
  final Future<FirebaseApp> initialization = Firebase.initializeApp();
  await Firebase.initializeApp();
  // await initialization.then((value){
  //   // Get.put(ProductController());
  // });
  runApp(const PetShopApp());
}
void initFirebaseNotification() async{
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  NotificationSettings settings = await messaging.requestPermission(
  alert: true,
  announcement: false,
  badge: true,
  carPlay: false,
  criticalAlert: false,
  provisional: false,
  sound: true,
);
print('User granted permission: ${settings.authorizationStatus}');

FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  print('Got a message whilst in the foreground!');
  print('Message data: ${message.data}');

  if (message.notification != null) {
    print('Message also contained a notification: ${message.notification}');
  }
});
 }



