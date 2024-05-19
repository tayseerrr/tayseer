import 'package:application/views/shared/button.dart';
import 'package:application/views/shared/header_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoanApplyView extends StatelessWidget {
  const LoanApplyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text(
          "طلب قرض",
          style: TextStyle(
            fontFamily: 'Tajawal',
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),

        backgroundColor: Get.theme.primaryColor,
      ),
      body: Column(
        children: [
          Center(
            child: HeaderCard(
              title: 'القروض المالية',
              height: 50,
              width: Get.width * 0.75,
              textStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'Tajawal',
                color: Color(0xFF9E773A),
              ),
            ).paddingOnly(top: 100, bottom: 40),
          ),
          Button(
            text: 'التقدم بالطلب الأن',
            onPressed: () {
              Get.toNamed('/loans/policy');
            },
          )
        ],
      ),
    );
  }
}
