import 'package:application/views/polices/installment.dart';
import 'package:application/views/products/apply.dart';
import 'package:application/views/shared/bottom_navigation_bar.dart';
import 'package:application/views/shared/category_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
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
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "خدماتنا",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Tajawal',
                  color: Get.theme.primaryColor,
                ),
              ).paddingOnly(bottom: 50,),
               Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                verticalDirection: VerticalDirection.down,
                spacing: 20,
                runSpacing: 20,
                children: [
                  CategoryCard(
                    onTap: () {
                      Get.toNamed('/loans/apply');

                    },
                    title: 'القروض المالية',
                    image: const AssetImage('assets/images/loan.webp'),
                    size: 180,
                  ),
                  CategoryCard(
                    onTap: () {
                      Get.to(()=>const InstallmentApplyView());
                    },
                    title: 'تقسيط الأجهزة',
                    image: const AssetImage('assets/images/devices_2.png'),
                    size: 180,
                  ),
                  CategoryCard(
                    onTap: () {
                      Get.toNamed('/consultants');
                    },
                    title: 'الإستشارات المالية',
                    image: const AssetImage('assets/images/consulting.webp'),
                    size: 180,
                  ),
                  CategoryCard(
                    onTap: () {
                      Get.toNamed('/medicines/apply');
                    },
                    title: 'تخفيضات للمراكز الطبية',
                    image: const AssetImage('assets/images/medicine.png'),
                    size: 180,
                  ),
                  // const CategoryCard(
                  //     title: 'التوصيل',
                  //     image: AssetImage('assets/images/delivery.png'),
                  //     size: 180),
                  // const CategoryCard(
                  //     title: 'الدفع',
                  //     image: AssetImage('assets/images/payment.png'),
                  //     size: 180),
                ],
              ).paddingOnly(bottom: 100),

            ],
          ).paddingOnly(top: 20, left: 5, right: 5),
        ),
      ),
      // bottomNavigationBar: AppBottomNavigationBar(),
    );
  }
}
