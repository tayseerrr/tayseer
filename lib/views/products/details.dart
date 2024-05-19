import 'package:application/controllers/products.dart';
import 'package:application/models/product.dart';
import 'package:application/views/shared/button.dart';
import 'package:application/views/shared/data_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProductDetailsView extends StatefulWidget {
  ProductDetailsView({super.key}) {
    id = Get.arguments['id'];
  }

  late final String id;

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
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
        title: const Text(
          "تفاصيل المنتج",
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
      body: SingleChildScrollView(
        child: FutureBuilder<Product?>(
          future: ProductsController.instance.details(widget.id),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return const Center(
                child: Text(
                  'حدث خطأ ما',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Tajawal',
                    color: Colors.red,
                  ),
                ),
              );
            }
            Product? product = snapshot.data;
            if (product == null) {
              return const Center(
                child: Text(
                  'لا يوجد منتج بهذا الرقم',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Tajawal',
                    color: Colors.red,
                  ),
                ),
              );
            }
            List<Widget> detailWidgets = product.details
                .map((e) => DataItem(
                      height: 35,
                      width: 330,
                      titleWidth: 140,
                      title: e['title']!,
                      value: e['value']!,
                      titleStyle: titleStyle,
                      valueStyle: valueStyle,
                    ))
                .toList();
            return Column(
              children: [
                Center(
                  child: Container(
                    width: Get.width - (Get.width * .1),
                    height: Get.width - (Get.width * .1),
                    margin: const EdgeInsets.only(top: 30, bottom: 30),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(product.image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                DataItem(
                  height: 35,
                  width: 330,
                  titleWidth: 140,
                  title: 'الإسم',
                  value: product.name,
                  titleStyle: titleStyle,
                  valueStyle: valueStyle,
                ),
                DataItem(
                  height: 35,
                  width: 330,
                  titleWidth: 140,
                  title: 'السعر',
                  value: '${product.price}'
                      ' ر.س',
                  titleStyle: titleStyle,
                  valueStyle: valueStyle,
                ),
                ...detailWidgets,
                CustomButton(
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'أضف إلى السلة',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Tajawal',
                          color: Colors.white,
                        ),
                      ),
                      Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                      ),
                    ],
                  ).paddingOnly(right: 20, left: 20),
                  onPressed: () async {
                    GetStorage().write('cart', product.id.toString());
                    await Get.snackbar(
                      'تمت الإضافة',
                      'تمت إضافة المنتج إلى السلة',
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.green,
                      colorText: Colors.white,
                      duration: const Duration(seconds: 3),
                      titleText: const Text(
                        'تمت الإضافة',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Tajawal',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      messageText: const Text(
                        'تمت إضافة المنتج إلى السلة',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Tajawal',
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    );
                  },
                ).paddingOnly(
                  bottom: 30,
                  top: 50,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
