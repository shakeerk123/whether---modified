// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whether/app/services/googleSignin_auth.dart';
import 'package:whether/app/view/home/ui/home_page.dart';

class SquareTile extends StatelessWidget {
  final String imagePath;

  const SquareTile({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
        ),
        child: FloatingActionButton.extended(
            onPressed: () async {
              await FirebaseServices().signInWithGoolge();
              Get.off( HomePage());
            },
            icon: Image.asset(
              imagePath,
              height: 30,
            ),
            label: const Text("Sign in with Google")));
  }
}
