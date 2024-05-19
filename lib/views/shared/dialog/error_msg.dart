import 'package:flutter/material.dart';
import 'package:get/get.dart';

showErrorSnackbar({ required String message, required String title, }) {
  Get.snackbar(
    title,
    message,
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: Colors.red,
    colorText: Colors.white,
    duration: const Duration(seconds: 5),
    titleText: Text(
      title,
      style: const TextStyle(
        color: Colors.white,
        fontFamily: 'Tajawal',
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    messageText: Text(
      message,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 15,
        fontFamily: 'Tajawal',
      ),
    ),
  );
}