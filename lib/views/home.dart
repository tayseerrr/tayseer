import 'package:application/views/admission/installments.dart';
import 'package:application/views/admission/loans.dart';
import 'package:application/views/services/consulatent/apply.dart';
import 'package:application/views/shared/category_card.dart';
import 'package:application/views/suppliers/add_product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AdmissionHomeView extends StatelessWidget {
  const AdmissionHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       leading: IconButton(
         icon: const Icon(Icons.logout,color: Colors.white,),
         onPressed: () async{
           await GetStorage().remove('access');
           await GetStorage().remove('refresh');
           await GetStorage().remove('account_type');

           Get.offAllNamed('/login');
         },
       ),
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
            ).paddingOnly(bottom: 50),
            Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              verticalDirection: VerticalDirection.down,
              spacing: 20,
              runSpacing: 20,
              children: [
                CategoryCard(
                  onTap: () {

                    Get.to(()=>const LoansListView());

                  },
                  title: 'القروض المالية',
                  image: const AssetImage('assets/images/loan.webp'),
                  size: 180,
                ),
                CategoryCard(
                  onTap: () {
                    Get.to(()=>const InstallmentListView());
                  },
                  title: 'تقسيط الأجهزة',
                  image: const AssetImage('assets/images/devices_2.png'),
                  size: 180,
                ),

                CategoryCard(
                  onTap: () {
                    Get.to(()=>const ConsultingApplyView());
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

              ],
            ).paddingOnly(bottom: 100),

          ],
        ).paddingOnly(top: 20, left: 5, right: 5),
      ),
    );
  }
}
