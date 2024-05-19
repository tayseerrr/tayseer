import 'package:application/controllers/products.dart';
import 'package:application/models/product.dart';
import 'package:application/views/shared/button.dart';
import 'package:application/views/shared/data_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
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

  String id = '';
  String billId = '';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      //       load id from storage
      final box = GetStorage();
      try {
        id = await box.read('cart');
        setState(() {
          id = id;
        });
      } catch (e) {}
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "السلة",
          style: TextStyle(
            fontFamily: 'Tajawal',
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        leading: const SizedBox(),
        backgroundColor: Get.theme.primaryColor,
      ),
      body: SingleChildScrollView(
        child: id != ''
            ? FutureBuilder<Product?>(
                future: ProductsController.instance.details(id),
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
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                              image: NetworkImage(snapshot.data!.image),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      DataItem(
                        height: 35,
                        width: 330,
                        titleWidth: 140,
                        title: 'السعر الفرعي',
                        value: '${snapshot.data!.price} ر.س',
                        titleStyle: titleStyle,
                        valueStyle: valueStyle,
                      ),
                      DataItem(
                        height: 35,
                        width: 330,
                        titleWidth: 140,
                        title: 'رسوم التوصيل',
                        value: '50 ر.س',
                        titleStyle: titleStyle,
                        valueStyle: valueStyle,
                      ),
                      DataItem(
                        height: 35,
                        width: 330,
                        titleWidth: 140,
                        title: 'السعر الكلي',
                        value: '${snapshot.data!.price + 50} ر.س',
                        titleStyle: titleStyle,
                        valueStyle: valueStyle,
                      ),
                      CustomButton(
                        child: const Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Center(
                              child: SizedBox(
                                width: 150,
                                child: Text(
                                  'إتمام الطلب',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Tajawal',
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            Icon(
                              Icons.handshake_rounded,
                              color: Colors.white,
                            ),
                          ],
                        ).paddingOnly(right: 20, left: 20),
                        onPressed: () {
                          ProductsController.instance
                              .issueBill(snapshot.data!.id.toString());
                        },
                      ).paddingOnly(top: 50),
                      Visibility(
                        visible: billId != '',
                        child: CustomButton(
                          child: const Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Center(
                                child: SizedBox(
                                  width: 150,
                                  child: Text(
                                    ' إتمام الطلب السابق',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Tajawal',
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.shopping_cart,
                                color: Colors.white,
                              ),
                            ],
                          ).paddingOnly(right: 20, left: 20),
                          onPressed: () async {
                            await ProductsController.instance
                                .issueBill(snapshot.data!.id.toString());

                            await Get.toNamed('/product/delevery');
                          },
                        ).paddingOnly(bottom: 30, top: 10),
                      ),
                    ],
                  );
                })
            : Center(
                child: const Text(
                  'السلة فارغة',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Tajawal',
                    color: Colors.red,
                  ),
                ).paddingOnly(top: Get.height * .3),
              ),
      ),
    );
  }
}
