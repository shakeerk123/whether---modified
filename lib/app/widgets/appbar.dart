import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controller/main_controller.dart';

AppBar buildAppBar() {
  var date = DateFormat("yMMMMd").format(DateTime.now());
  var controller = Get.put(MainController());
    return AppBar(
      title: Text(
        "$date",
        style: const TextStyle(
          fontFamily: "poppins",
          fontSize: 10,
        ),
      ),
      actions: [
        Obx(
          () => IconButton(
            onPressed: () {
              Get.changeThemeMode(controller.changeTheme());
            },
            icon: Icon(
              controller.themeMode.value == ThemeMode.light
                  ? Icons.dark_mode
                  : Icons.light_mode,
            ),
          ),
        ),
      ],
    );
  }
