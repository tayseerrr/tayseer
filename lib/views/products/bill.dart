import 'package:application/views/shared/button.dart';
import 'package:application/views/shared/data_item.dart';
import 'package:application/views/shared/header_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BillView extends StatelessWidget {
  Map<String, dynamic> bill={};
   BillView({super.key})
   {
    bill=Get.arguments;

  }

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
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "فاتورة الطلب",
          style: TextStyle(
            fontFamily: 'Tajawal',
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Get.theme.primaryColor,
      ),
      body: SingleChildScrollView(

        child: Center(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const HeaderCard(
                title: "فاتورة جديدة",
                height: 60,
                width: 300,
                textStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Tajawal',
                  color: Color(0xFF9E773A),
                ),
              ).paddingOnly( top:70,bottom: 60),
              DataItem(
                width: 330,
                height: 35,
                titleWidth: 140,
                title: 'الموظف المصدر',
                value: 'أحمد عبدالله الهاشم',
                titleStyle: titleStyle,
                valueStyle: valueStyle,
              ),
              Center(
                child: DataItem(
                  height: 60,
                  width: 330,
                  titleWidth: 140,
                  title: 'رقم الطلب',
                  value: bill['order_no'].toString(),
                  titleStyle: titleStyle,
                  valueStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'Tajawal',
                    color: Colors.black,
                  )

                ),
              ),
              DataItem(
                height: 35,
                width: 330,
                titleWidth: 140,
                title: 'التاريخ',
                value: bill['order_date'].toString().substring(0, 16).replaceAll("T", ' '),
                titleStyle: titleStyle,
                valueStyle: valueStyle,
              ),
              DataItem(
                height: 35,
                width: 330,
                titleWidth: 140,
                title: 'المبلغ',
                value: bill['price'].toString()+ ' ر.س',
                titleStyle: titleStyle,
                valueStyle: valueStyle,
              ),
              DataItem(
                height: 35,
                width: 330,
                titleWidth: 140,
                title: 'قيمة التوصيل',
                value: '40 ر.س',
                titleStyle: titleStyle,
                valueStyle: valueStyle,
              ),
              DataItem(
                height: 35,
                width: 330,
                titleWidth: 140,
                title: 'نوع الجهاز',
                value: bill['product_name'],
                titleStyle: titleStyle,
                valueStyle: valueStyle,
              ),
              DataItem(
                height: 35,
                width: 330,
                titleWidth: 140,
                title: 'إجمالي الفاتورة',
                value: (bill['price']+40).toString() + ' ر.س',
                titleStyle: titleStyle,
                valueStyle: valueStyle,
              ).paddingOnly(bottom: 40),
              Button(text: "متابعة", onPressed: () {})
            ],
          ),
        ),
      ),
    );
  }
}
