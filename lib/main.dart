import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whether/app/services/firebase_notification.dart';
import 'package:whether/utils/constants/themes.dart';


import 'app/view/splash/ui/splash_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseApi().initNotifications();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: CustomThemes.lightTheme,
      darkTheme:CustomThemes.darkTheme ,
      themeMode: ThemeMode.light,
      title: 'Flutter Demo',
      home:const SplashScreen(),
    );
  }
}

