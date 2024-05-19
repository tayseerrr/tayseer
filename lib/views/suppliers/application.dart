import 'package:application/models/delivery_order.dart';
import 'package:application/views/shared/data_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApplicationInfoView extends StatelessWidget {
  const ApplicationInfoView({super.key, required this.deliveryRequest});

  final DeliveryOrder deliveryRequest;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "معلومات الطلب",
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
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DataItem(
              width: 330,
              titleWidth: 140,
              title: 'الإسم',
              value: deliveryRequest.name,
            ),
            DataItem(
              width: 330,
              titleWidth: 140,
              title: 'الإيميل',
              value: deliveryRequest.email,
            ),
            DataItem(
              title: 'طريقة التوصيل',
              value: deliveryRequest.receivingMethod=='التوصيل'?'توصيل للبيت':'من الفرع',
              width: 330,
              titleWidth: 140,
            ),
            if(deliveryRequest.receivingMethod=='التوصيل')

            Visibility(
              visible: deliveryRequest.address.isNotEmpty && deliveryRequest.address != 'null',
              child: DataItem(
                title: 'العنوان',
                value: deliveryRequest.address,
                width: 330,
                height: 200,
                titleWidth: 140,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
