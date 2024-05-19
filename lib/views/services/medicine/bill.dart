import 'package:application/controllers/account.dart';
import 'package:application/controllers/medical.dart';
import 'package:application/views/shared/button.dart';
import 'package:application/views/shared/header_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../shared/data_item.dart';

class MedicalBillView extends StatelessWidget {
  const MedicalBillView({super.key});

  final titleStyle = const TextStyle(
    color: Colors.white,
    fontSize: 12,
    fontFamily: 'Tajawal',
    fontWeight: FontWeight.bold,
  );
  final valueStyle = const TextStyle(
    color: Colors.black54,
    fontSize: 14,
    fontFamily: 'Tajawal',
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    String expireData = DateTime.now().add(const Duration(days: 60)).toString();
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            "فاتورة طلب الطالب",
            style: TextStyle(
              fontFamily: 'Tajawal',
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          backgroundColor: Get.theme.primaryColor,
          iconTheme: const IconThemeData(
            color: Colors.white,
          )),
      body: Center(
        child: FutureBuilder(
          future: AccountController.instance.getAccount(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }


              if (snapshot.data == null) {
                return const Center(
                  child: Text('No Data'),
                );
              }
            return Column(
              children: [
                const HeaderCard(
                  title: 'فاتورة طلب الطالب',
                  height: 55,
                  width: 230,
                  textStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Tajawal',
                    color: Color(0xFF9E773A),
                  ),
                ).paddingOnly(top: 40, bottom: 40),
                DataItem(
                  title: 'الإسم',
                  value: snapshot.data!['full_name'],
                  width: 280,
                  titleWidth: 130,
                  valueStyle: valueStyle,
                  titleStyle: titleStyle,
                ),
                DataItem(
                  title: 'التخصص',
                  value: snapshot.data!['specialization'],
                  width: 280,
                  titleWidth: 130,
                  titleStyle: titleStyle,
                  valueStyle: valueStyle,
                ),
                DataItem(
                  title: 'الكلية',
                  titleStyle: titleStyle,
                  value: snapshot.data!['collage'],
                  width: 280,
                  titleWidth: 130,
                  valueStyle: valueStyle,
                ),
                DataItem(
                  titleStyle: titleStyle,
                  title: 'المستشفى',
                  value: Get.arguments['hospital'],
                  width: 280,
                  titleWidth: 130,
                  valueStyle: valueStyle,
                ),
                DataItem(
                  titleStyle: titleStyle,
                  title: 'نسبة الخصم',
                  value: '20%',
                  width: 280,
                  titleWidth: 130,
                  valueStyle: valueStyle,
                ),
                DataItem(
                  titleStyle: titleStyle,
                  title: 'الخدمة',
                  value: Get.arguments['service'],
                  width: 280,
                  titleWidth: 130,
                  valueStyle: valueStyle,
                ),
                DataItem(
                  titleStyle: titleStyle,
                  title: 'تاريخ إنتهاء الخصم',
                  // today + 2 months
                  value: expireData.substring(0, 10) + ' ',
                  width: 280,
                  titleWidth: 130,
                  valueStyle: valueStyle,
                ),
                Button(
                    text: 'إتمام الطلب',
                    onPressed: () async{
                     await MedicalController.instance.submitApplication(

                        Get.arguments['offer_id']
                      );
                    }).paddingOnly(top: 50),
              ],
            ).paddingOnly(top: 40, bottom: 40);
          },
        ),
      ),
    );
  }
}
