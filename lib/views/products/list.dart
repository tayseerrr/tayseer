import 'package:application/controllers/products.dart';
import 'package:application/models/product.dart';
import 'package:application/utilities/text_helper.dart';
import 'package:application/views/shared/product_card.dart';
import 'package:application/views/shared/service_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DevicesListView extends StatefulWidget {
  const DevicesListView({super.key});

  @override
  State<DevicesListView> createState() => _DevicesListViewState();
}

class _DevicesListViewState extends State<DevicesListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "الأجهزة",
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
        backgroundColor: Get.theme.primaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                if (Get.arguments != null &&
                    Get.arguments['brand'] != null &&
                    Get.arguments['brand'] != '')
                  ServiceCard(
                      width: 130,
                      height: 130,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              getBrand(Get.arguments['brand'])!['image']!,
                              width: 40,
                              height: 40,
                            ).paddingOnly(bottom: 10),
                            Text(
                              getBrand(Get.arguments['brand'])!['brand']!,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Tajawal',
                                color: Get.theme.primaryColor,
                              ),
                            ).paddingOnly(top: 15),
                          ])).paddingOnly(bottom: 10, right: 10),
                if (Get.arguments != null &&
                    Get.arguments['category'] != null &&
                    Get.arguments['category'] != '')
                  ServiceCard(
                      width: 130,
                      height: 130,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              getCategory(Get.arguments['category'])!['image']!,
                              width: 40,
                              height: 40,
                            ).paddingOnly(bottom: 10),
                            Text(
                              getCategory(
                                  Get.arguments['category'])!['category']!,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Tajawal',
                                color: Get.theme.primaryColor,
                              ),
                            ).paddingOnly(top: 15),
                          ])).paddingOnly(bottom: 10, right: 10),
              ],
            ).paddingOnly(bottom: 40, top: 30),
            FutureBuilder<List<Product>>(
              future: ProductsController.instance.list(
                  category: Get.arguments['category'],
                  brand: Get.arguments['brand']),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.hasError) {
                  return const Center(
                    child: Text('حدث خطأ ما'),
                  );
                }
                if (snapshot.data!.isEmpty) {
                  return const Center(
                    child: Text('لا يوجد بيانات'),
                  );
                }

                return Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  alignment: WrapAlignment.center,
                  children: snapshot.data!
                      .map(
                        (Product product) => ProductCard(
                          onTap: () async {

                            Get.toNamed('/products/details',
                                arguments: {'id': product.id.toString()});
                          },
                          imageLink: product.image,
                            title: product.name.shorten(16),
                          price: product.price.toString(),
                          width: Get.width * 0.45,
                          height: Get.width * 0.6,
                          imageWidth: Get.width * 0.45,
                          imageHeight: Get.width * .35,
                        ),
                      )
                      .toList(),
                ).paddingOnly(
                  bottom: 50,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Map<String, String>? getBrand(String shortcut) {
    if (shortcut == 'HW') {
      return {
        'brand': 'HUAWEI',
        'image': 'assets/images/huawei.png',
      };
    } else if (shortcut == 'AD') {
      return {
        'brand': 'ANDROID',
        'image': 'assets/images/android.webp',
      };
    } else if (shortcut == 'AP') {
      return {
        'brand': 'APPLE',
        'image': 'assets/images/apple.png',
      };
    }
  }

  Map<String, String>? getCategory(String shortcut) {
    if (shortcut == 'TL') {
      return {
        'category': 'الكمبيوتر والتابلت',
        'image': 'assets/images/devices_3.webp',
      };
    } else if (shortcut == 'SP') {
      return {
        'category': 'الهواتف الذكية',
        'image': 'assets/images/iphone.webp',
      };
    } else if (shortcut == 'AC') {
      return {
        'category': 'مستلزمات الأجهزة',
        'image': 'assets/images/devices_3.webp',
      };
    }
  }
}
