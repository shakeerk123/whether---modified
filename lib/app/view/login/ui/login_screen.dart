import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/images.dart';
import 'components/squaretile.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 100),

                // logo
                Image.asset(width: 120, height: 120, weather),
                const HeightBox(10),
                "AccuWeather"
                    .text
                    .fontFamily("poppins_bold")
                    .size(30)
                    .white
                    .make(),

                const SizedBox(height: 150),

                "Welcome back! "
                    .text
                    .fontFamily("poppins")
                    .size(40)
                    .white
                    .make(),

                const SizedBox(height: 20),

                // ignore: prefer_const_constructors
                SquareTile(
                  imagePath: googlelogo,
                ),

                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
