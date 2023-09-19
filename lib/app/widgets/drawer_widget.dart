import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:whether/app/view/login/ui/login_screen.dart';

import '../services/googleSignin_auth.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        height: double.infinity,
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.25,
              child: DrawerHeader(
                decoration: const BoxDecoration(
                  color: Colors.teal,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.pink,
                      backgroundImage: NetworkImage(
                          // ignore: unnecessary_string_interpolations
                          '${FirebaseAuth.instance.currentUser!.photoURL!}'), // Use NetworkImage to fetch the image
                    ),
                    const SizedBox(height: 5),
                    Text(
                      '${FirebaseAuth.instance.currentUser!.displayName}',
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      '${FirebaseAuth.instance.currentUser!.email}',
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: IconButton(
                onPressed: () async {
              await FirebaseServices().signOut();
              Get.off( LoginPage());
            },
                icon: Icon(Icons.logout),
              ),
              title: "Logout".text.make(),
            )
          ],
        ),
      ),
    );
  }
}
