import 'package:application/controllers/products.dart';
import 'package:application/views/services/delivery/addres.dart';
import 'package:application/views/services/delivery/seller_branchs.dart';
import 'package:application/views/shared/button.dart';
import 'package:application/views/shared/header_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DeliveryOptionsView extends StatelessWidget {
  const DeliveryOptionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "طريقة التسليم",
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
        )
      ),
      body: Center(
        child: Column(
          children: [
            const HeaderCard(
              title: 'طريقة تسلم المنتج',
              height: 60,
              width: 300,
              textStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                fontFamily: 'Tajawal',
                color: Color(0xFF9E773A),
              ),
            ).paddingOnly(top: 100, bottom: 100),
            Button(
              text: 'أختر المعرض',
              onPressed: () async {
                // setDelivery
                Get.to(()=>const SellerBranchView());
              },
            ).paddingOnly(bottom: 10),
            Button(
              text: 'توصيل للمنزل',
              onPressed: () async {
                Get.to(()=> DeliveryAddressView());
              },
            ),
          ],
        ),
      ),
    );
  }
}
