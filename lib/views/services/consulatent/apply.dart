import 'package:application/views/shared/button.dart';
import 'package:application/views/shared/data_item.dart';
import 'package:application/views/shared/header_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConsultingApplyView extends StatelessWidget {
  const ConsultingApplyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "خدمة الإستشارات",
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
              textAlign: TextAlign.right,
              title: 'هذه الخدمة متاحة لجميع طلبة ام القرى(انتظام، تأهيلي) مجانا. حيث يمكنهم مناقشة الوضع المالي ووضع خطط لتحسين ذلك.',
              height: 100,
              width: Get.width * 0.85,
              textStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                fontFamily: 'Tajawal',
                color: Color(0xFF9E773A),
              ),
            ).paddingOnly(top: 100, bottom: 40),
          ),
          Button(
            text: 'التقديم على الخدمة',
            onPressed: () {
              Get.toNamed('/consultants');
            },
          )
        ],
      ),
    );
  }
}
