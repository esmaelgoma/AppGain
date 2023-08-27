// import 'package:firebase_messaging/firebase_messaging.dart';
//
// class PushNotificationsManager{
//   PushNotificationsManager._();
//   factory PushNotificationsManager()=> _instance;
//   static final PushNotificationsManager _instance = PushNotificationsManager._();
//   final  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
//
//    bool _initialized = false;
//
//   Future<void>init() async {
//
//     if(!_initialized){
//       //ios
//       _firebaseMessaging.requestPermission();
//       _firebaseMessaging.configure();
//
//       String? token = await _firebaseMessaging.getToken();
//       print("my new  token = $token");
//       _initialized =true;
//     }
//   }
// }


import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> handlerBackgroundMessage(RemoteMessage message ) async{
  print('Title: ${message.notification?.title}');
  print('Body: ${message.notification?.body}');
  print('PayLoad: ${message.data}');



}

class FirebaseApi{
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void>initNotifications() async{
    await _firebaseMessaging.requestPermission();
    final fCMToken = await _firebaseMessaging.getToken();
    print("Token : $fCMToken");
    FirebaseMessaging.onBackgroundMessage( handlerBackgroundMessage);
  }
}