import 'package:flutter/material.dart';
import 'package:get/get.dart';

String determineAccountType(String email) {

  if (!email.contains('uqu.edu.sa') &&
      !(email.contains('st.uqu.edu.sa')) &&
      !email.contains('jarirbookstore.com')) {
    Get.snackbar(
      'خطأ',
      ''
          ' البريد الإلكتروني غير مقبول على تيسير',
      backgroundColor: Colors.red,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 5),
      margin: const EdgeInsets.all(10),
      borderRadius: 10,
      isDismissible: true,
      titleText: const Text(
        'خطأ',
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'Tajawal',
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      messageText: const Text(
        ' البريد الإلكتروني غير مقبول على تيسير',
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'Tajawal',
          fontSize: 14,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
    return "error";
  }
  return "";
}
