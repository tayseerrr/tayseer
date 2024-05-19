import 'package:application/controllers/commitments.dart';
import 'package:application/views/shared/bottom_navigation_bar.dart';
import 'package:application/views/shared/button.dart';
import 'package:application/views/shared/data_item.dart';
import 'package:application/views/shared/product_card.dart';
import 'package:application/views/shared/service_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommitmentsInfoView extends StatelessWidget {
  const CommitmentsInfoView({super.key});

  final TextStyle titleStyle = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    fontFamily: 'Tajawal',
    color: Colors.white,
  );
  final TextStyle titleStyle2 = const TextStyle(
    fontSize: 12,
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
  final TextStyle valueStyle2 = const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    fontFamily: 'Tajawal',
    color: Colors.black,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "دفعات الأقساط",
          style: TextStyle(
            fontFamily: 'Tajawal',
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Get.theme.primaryColor,
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: CommitmentsController.instance.commitments(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.data!['end_date'] == null) {
            return const Center(
              child: Text(
                'لا يوجد دفعات',
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Tajawal',
                ),
              ),
            );
          }
          return SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    if (snapshot.data!['type'] == 'order')
                      Container(
                        width: Get.width * 0.33,
                        height: Get.width * 0.33,
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: const Color(0xFF3ACAFF),
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image:
                                NetworkImage(snapshot.data!['product_image']),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    if (snapshot.data!['type'] == 'loan')
                      Image(
                        fit: BoxFit.cover,
                        image: const AssetImage('assets/images/loan.webp'),
                        width: Get.width * 0.3,
                        height: Get.width * 0.3,
                      ).paddingOnly(bottom: 30),
                    if (snapshot.data!['type'] == 'order')
                      Column(
                        children: [
                          DataItem(
                            height: 35,
                            width: Get.width * 0.5,
                            titleWidth: Get.width * 0.25,
                            title: 'البائع',
                            value: 'جرير',
                            titleStyle: titleStyle,
                            valueStyle: valueStyle,
                          ),
                          DataItem(
                            height: 35,
                            width: Get.width * 0.5,
                            titleWidth: Get.width * 0.25,
                            title: 'تاريخ الشراء',
                            value: snapshot.data!['start_date'],
                            titleStyle: titleStyle,
                            valueStyle: valueStyle,
                          ),
                        ],
                      ),
                    if (snapshot.data!['type'] == 'loan')
                      Column(
                        children: [
                          DataItem(
                            height: 35,
                            width: Get.width * 0.5,
                            titleWidth: Get.width * 0.28,
                            title: 'المبلغ',
                            value: snapshot.data!['amount'],
                            titleStyle: titleStyle,
                            valueStyle: valueStyle,
                          ),
                          DataItem(
                            height: 35,
                            width: Get.width * 0.5,
                            titleWidth: Get.width * 0.28,
                            title: 'تاريخ الإقتراض',
                            value: snapshot.data!['start_date'],
                            titleStyle: titleStyle,
                            valueStyle: valueStyle,
                          ),
                        ],
                      )
                  ],
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    ' جميع الدفعات القادمة',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Tajawal',
                      color: Get.theme.primaryColor,
                    ),
                  ).paddingOnly(top: 20, bottom: 10, right: 40),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: DataItem(
                    height: 35,
                    width: Get.width * 0.6,
                    titleWidth: Get.width * 0.3,
                    title: 'المبلغ المتبقي',
                    // amount
                    value: snapshot.data!['remaining_amount'].toString(),
                    titleStyle: titleStyle,
                    valueStyle: valueStyle,
                    mainColor: const Color(0xFF3ACAFF),
                  ).paddingOnly(right: 20),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    DataItem(
                      height: 35,
                      width: Get.width * 0.45,
                      titleWidth: Get.width * 0.22,
                      title: 'تاريخ البدء',
                      value:  snapshot.data!['start_date'],
                      titleStyle: titleStyle2,
                      valueStyle: valueStyle2,
                      mainColor: const Color(0xFFFF6F3A),
                    ),
                    DataItem(
                      height: 35,
                      width: Get.width * 0.45,
                      titleWidth: Get.width * 0.22,
                      title: 'تاريخ الإنتهاء',
                      value: snapshot.data!['end_date'],
                      titleStyle: titleStyle2,
                      valueStyle: valueStyle2,
                      mainColor: const Color(0xFF01AD9A),
                    ),
                  ],
                ).paddingOnly(
                  right: 20,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'الدفعات القادمة',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Tajawal',
                      color: Get.theme.primaryColor,
                    ),
                  ).paddingOnly(top: 20, bottom: 10, right: 40),
                ),
                Column(
                  children: [
                    for (int i = 0; i < snapshot.data!['month'] - 1; i++)
                      Align(
                        alignment: Alignment.centerRight,
                        child: DataItem(
                          height: 35,
                          width: Get.width * 0.5,
                          titleWidth: Get.width * 0.3,
                          title: 'الدفعة رقم ${i + 1}',
                          value: snapshot.data!['installment'].toString(),
                          titleStyle: titleStyle,
                          valueStyle: valueStyle,
                          mainColor: const Color(0xFF515E7D),
                        ).paddingOnly(right: 20),
                      ),
                    if (snapshot.data!['last_month'] != null)
                      Align(
                        alignment: Alignment.centerRight,
                        child: DataItem(
                          height: 35,
                          width: Get.width * 0.5,
                          titleWidth: Get.width * 0.3,
                          title: 'الدفعة الأخيرة',
                          value: snapshot.data!['installment'].toString(),
                          titleStyle: titleStyle,
                          valueStyle: valueStyle,
                          mainColor: const Color(0xFF515E7D),
                        ).paddingOnly(right: 20),
                      ),
                  ],
                ).paddingOnly(right: 20, bottom: 20),
              ],
            ),
          );
        },
      ),
    );
  }

  remainingAmount(dynamic data) {
    return data['amount'] - data['paid_amount'];
  }
}
