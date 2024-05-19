import 'package:application/views/shared/button.dart';
import 'package:application/views/shared/data_item.dart';
import 'package:application/views/shared/header_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StudentInfoView extends StatelessWidget {
  const StudentInfoView({super.key});
  final TextStyle titleStyle = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    fontFamily: 'Tajawal',
    color: Colors.white,
  );
  final TextStyle valueStyle = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    fontFamily: 'Tajawal',
    color: Colors.black,
  );
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:  SingleChildScrollView(

        child: Center(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const HeaderCard(
                title: "معلومات الطالب",
                height: 60,
                width: 300,
                textStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Tajawal',
                  color: Color(0xFF9E773A),
                ),
              ).paddingOnly( top:100,bottom: 60),
              DataItem(
                width: 330,
                height: 35,
                titleWidth: 140,
                title: 'الإسم',
                value: 'أحمد عبدالله الهاشم',
                titleStyle: titleStyle,
                valueStyle: valueStyle,
              ),
              DataItem(
                height: 35,
                width: 330,
                titleWidth: 140,
                title: 'التخصص',
                value: 'محاسبة',
                titleStyle: titleStyle,
                valueStyle: valueStyle,
              ),
              DataItem(
                height: 35,
                width: 330,
                titleWidth: 140,
                title: 'الكلية',
                value: 'إدارة أعمال',
                titleStyle: titleStyle,
                valueStyle: valueStyle,
              ),
              DataItem(
                height: 35,
                width: 330,
                titleWidth: 140,
                title: 'المستشفى',
                value: 'عواض البشري',
                titleStyle: titleStyle,
                valueStyle: valueStyle,
              ),
              DataItem(
                height: 35,
                width: 330,
                titleWidth: 140,
                title: 'نسبة الخصم',
                value: '%20',
                titleStyle: titleStyle,
                valueStyle: valueStyle,
              ),
              DataItem(
                height: 35,
                width: 330,
                titleWidth: 140,
                title: 'الخدمة',
                value: 'تقويم أسنان ',
                titleStyle: titleStyle,
                valueStyle: valueStyle,
              ),
              DataItem(
                height: 35,
                width: 330,
                titleWidth: 140,
                title: 'تاريخ إنتهاء الخصم',
                value: '2024-12-12',
                titleStyle: titleStyle,
                valueStyle: valueStyle,
              ).paddingOnly(bottom: 40),
              Button(text: "طباعة", onPressed: () {})
            ],
          ),
        ),
      ),
    );
  }
}
