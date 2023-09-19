import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseApi{
  //create an instance of firebase 
  final _firebaseMessaging = FirebaseMessaging.instance;


  static Future _backgroundHandler(RemoteMessage message)async{
    print("background Handler ${message.messageId}");
  }
  static Future _onMessageHandler(RemoteMessage message)async{
    print("onMessgae Handler ${message.messageId}");
  }
  static Future _onMessageOpenApp(RemoteMessage message)async{
    print("onMessageOpenApp Handler ${message.messageId}");
  }

  //function to initialize notification
  Future<void> initNotifications()async{

    //req permission from user
    await _firebaseMessaging.requestPermission();

    //fetch theFCM token for this device
    final fCMToken = await _firebaseMessaging.getToken();

    //print token
    print("Token : $fCMToken");

    FirebaseMessaging.onBackgroundMessage(_backgroundHandler);
    FirebaseMessaging.onMessage.listen(_onMessageHandler);
    FirebaseMessaging.onMessage.listen(_onMessageOpenApp);

  }
}