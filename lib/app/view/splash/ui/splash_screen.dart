import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:whether/utils/constants/images.dart';
import '../../../controller/splash_controller.dart';
import '../../../../utils/constants/colors.dart';


class SplashScreen extends GetView<SplashController> {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(width: 150, height: 150, weather),
            const HeightBox(20),
            "AccuWeather".text.fontFamily("poppins_bold").size(40).white.make(),
          ],
        ),
      ),
    );
  }
}
