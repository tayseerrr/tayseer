import 'package:application/views/shared/bottom_navigation_bar.dart';
import 'package:application/views/shared/button.dart';
import 'package:application/views/shared/header_card.dart';
import 'package:application/views/shared/service_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DevicesMenuView extends StatefulWidget {
   DevicesMenuView({super.key});
   String category = '';

   String brand = '';

  @override
  State<DevicesMenuView> createState() => _DevicesMenuViewState();
}

class _DevicesMenuViewState extends State<DevicesMenuView> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AppBottomNavigationBar(),
      appBar: AppBar(
        title: const Text(
          "قائمة الأجهزة",
          style: TextStyle(
            fontFamily: 'Tajawal',
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),

        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        leading: IconButton(
          icon: const Center(child: Icon(Icons.arrow_back_ios)),
          onPressed: () {

           Get.offAllNamed('/home');
          },
        ),
        backgroundColor: Get.theme.primaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderCard(
              title: 'تسوق حسب القسم',
              height: 50,
              width: Get.width * 0.75,
              textStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'Tajawal',
                color: Color(0xFF9E773A),

              ),
            ).paddingOnly(top: 50, bottom: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ServiceCard(
                  showBorder: widget.category=='TL',
                  onTap: (){
                   setState(() {
                     if (widget.category=='TL'){
                       widget.category='';}
                     else{
                       widget.category='TL';
                     }
                   });
                  },

                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      Image.asset(
                        'assets/images/devices.webp',
                        width: 85,
                      ).paddingOnly(bottom: 10),
                      Text(
                        'الكمبيوتر والتابلت',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Tajawal',
                          color: Get.theme.primaryColor,
                        ),
                      ).paddingOnly(top: 15),
                    ])).paddingOnly(bottom: 4),
                ServiceCard(
                  showBorder: widget.category=='SP',
                    onTap: (){
                     setState(() {
                       if (widget.category=='SP'){
                         widget.category='';}
                       else{
                         widget.category='SP';
                       }
                     });
                    },
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      Image.asset(
                        'assets/images/iphone.webp',
                        width: 85,
                      ).paddingOnly(bottom: 10),
                      Text(
                        'الهواتف الذكية',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Tajawal',
                          color: Get.theme.primaryColor,
                        ),
                      ).paddingOnly(top: 15),
                    ])).paddingOnly(bottom: 4),
                ServiceCard(
                  showBorder: widget.category=='AC',
                    onTap: (){
                      setState(() {
                        if (widget.category=='AC'){
                          widget.category='';}
                        else{
                          widget.category='AC';
                        }
                      });
                    },
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      Image.asset(
                        'assets/images/devices_3.webp',
                        width: 85,
                      ).paddingOnly(bottom: 10),
                      Text(
                        'مستلزمات الأجهزة',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Tajawal',
                          color: Get.theme.primaryColor,
                        ),
                      ).paddingOnly(top: 15),
                    ])).paddingOnly(bottom: 4),
              ],
            ).paddingOnly(top: 20, left: 20, right: 20, bottom: 60),
            HeaderCard(
              title: 'تسوق حسب الماركة',
              height: 50,
              width: Get.width * 0.75,
              textStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'Tajawal',
                color: Color(0xFF9E773A),

              ),
            ).paddingOnly(top: 50, bottom: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ServiceCard(
                  showBorder: widget.brand=='HW',
                    onTap: (){
                      setState(() {
                        if (widget.brand=='HW'){
                          widget.brand='';}
                        else{
                          widget.brand='HW';
                        }
                      });
                    },
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/huawei.png',
                            width: 70,
                          ).paddingOnly(bottom: 10),
                          Text(
                            'HUAWEI',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Tajawal',
                              color: Get.theme.primaryColor,
                            ),
                          ).paddingOnly(top: 15),
                        ])).paddingOnly(bottom: 4),
                ServiceCard(
                  showBorder: widget.brand=='AD',
                    onTap: (){
                      setState(() {
                        if (widget.brand=='AD'){
                          widget.brand='';}
                        else{
                          widget.brand='AD';
                        }
                      });
                    },


                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/android.webp',
                            width: 70,
                          ).paddingOnly(bottom: 10),
                          Text(
                            'ANDROID',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Tajawal',
                              color: Get.theme.primaryColor,
                            ),
                          ).paddingOnly(top: 15),
                        ])).paddingOnly(bottom: 4),
                ServiceCard(
                  showBorder: widget.brand=='AP',
                    onTap: (){
                      setState(() {
                        if (widget.brand=='AP'){
                          widget.brand='';}
                        else{
                          widget.brand='AP';
                        }
                      });
                    },
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/apple.png',
                            width: 70,
                            height: 70,
                          ).paddingOnly(bottom: 10),
                          Text(
                            'APPLE',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Tajawal',
                              color: Get.theme.primaryColor,
                            ),
                          ).paddingOnly(top: 15),
                        ])).paddingOnly(bottom: 4),

              ],
            ).paddingOnly(top: 20, left: 20, right: 20, bottom: 40),
            Button(
              text: 'عرض النتائج',
              onPressed: () {
                // Get.toNamed('/devices/products?category=${widget.category}&brand=${widget.brand}');
                Get.toNamed('/products/list', arguments: {
                  'category': widget.category,
                  'brand': widget.brand,
                });
              },
            ).paddingOnly(bottom: 80),

          ],
        ),
      ),
    );
  }
}
