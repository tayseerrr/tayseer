import 'package:application/views/shared/category_card.dart';
import 'package:application/views/suppliers/add_product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuppliersHomeView extends StatelessWidget {
  const SuppliersHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'الرئيسية',
          style: TextStyle(
            fontFamily: 'Tajawal',
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Get.theme.primaryColor,
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              "خدماتنا",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'Tajawal',
                color: Get.theme.primaryColor,
              ),
            ).paddingOnly(bottom: 50, top: 40),
             Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              verticalDirection: VerticalDirection.down,
              spacing: 20,
              runSpacing: 20,
              children: [

                CategoryCard(
                  title: 'الأجهزة',
                  image: const AssetImage('assets/images/devices_2.png'),
                  size: 180,
                  onTap: () {
                    Get.to(()=>const AddProduct());
                  },
                ),

                 CategoryCard(
                  onTap: () {
                    Get.toNamed('/suppliers/delivery');
                  },
                    title: 'التوصيل',
                    image: const AssetImage('assets/images/delivery.png'),
                    size: 180),

              ],
            ).paddingOnly(bottom: 100),

          ],
        ).paddingOnly(top: 20, left: 5, right: 5),
      ),
    );
  }
}
