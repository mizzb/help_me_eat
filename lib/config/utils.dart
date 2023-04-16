import 'package:feed_me/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Utils {
  SnackbarController showSnack(
      {required String title, required String subTitle}) {
    return Get.snackbar(
      title,
      subTitle,
      colorText: Colors.white,
      backgroundColor: kHighlight,
      icon: const Icon(
        Icons.warning,
        color: kSelected,
      ),
    );
  }
}
