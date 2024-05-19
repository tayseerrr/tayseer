import 'package:application/controllers/products.dart';
import 'package:application/views/shared/button.dart';
import 'package:application/views/shared/header_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DeliveryAddressView extends StatelessWidget {
   DeliveryAddressView({super.key});
  final TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text(
          "عنوان التوصيل",
          style: TextStyle(
            fontFamily: 'Tajawal',
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor:Get.theme.primaryColor,
      ),
      body:SingleChildScrollView(
        child:  Wrap(
          children: [
            Center(
              child: const HeaderCard(
                title: ' تسلم المنتج للمنزل',
                height: 60,
                width: 300,
                textStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'Tajawal',
                  color: Color(0xFF9E773A),
                ),
              ).paddingOnly(top: 50, bottom: 50),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.transparent,
                ),
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 5.0,
                  ),
                ],
              ),
              child: TextFormField(
                controller: addressController,
                maxLines: 6,
                minLines: 6,
                maxLength: 200,
                inputFormatters: [LengthLimitingTextInputFormatter(200),
                  FilteringTextInputFormatter.deny(RegExp(r'[0-9]'))],

                style:  TextStyle(
                  fontSize: 16,

                  fontWeight: FontWeight.normal,
                  fontFamily: 'Tajawal',
                  color: Get.theme.primaryColor,
                ),
                decoration: const InputDecoration(
                  suffixIcon: Icon(
                    Icons.location_on,
                    color: Color(0xFF9E773A),
                  ),

                  labelText: 'العنوان',
                  labelStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'Tajawal',
                    color: Color(0xFF9E773A),
                  ),
                  border: OutlineInputBorder(
                  //   none
                    borderSide: BorderSide.none,
                  ),

                ),
              ),
            ),

            Center(
              child: Button(
                text: 'رفع الطلب',
                onPressed: () async{
                  if (addressController.text.isEmpty) {
                    Get.snackbar('خطأ', 'الرجاء ادخال العنوان',backgroundColor: Colors.red,colorText: Colors.white,
                      snackPosition: SnackPosition.BOTTOM,snackStyle: SnackStyle.FLOATING,
                      duration: const Duration(seconds: 3),
                      titleText: const Text(
                        'خطأ',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Tajawal',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      messageText: const Text(
                        'الرجاء ادخال العنوان',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Tajawal',
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),


                    );
                    return;
                  }
                  String billId = await GetStorage().read('bill_id');

                  await ProductsController.instance.setDelivery(billId, 'D',address: addressController.text);
                //   remove it from cart
                  Get.snackbar(
                    'تم رفع الطلب',
                    'تم رفع الطلب بنجاح',
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Colors.green,
                    colorText: Colors.white,
                    titleText: const Text(
                      'تم رفع الطلب',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Tajawal',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    messageText: const Text(
                      'تم رفع الطلب بنجاح',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Tajawal',
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  );
                  GetStorage().remove('cart');
                  GetStorage().remove('bill_id');
                  Get.toNamed('/home');


                },
              ).paddingOnly(top: 40),
            ),
          ],
        ),
      ),
    );

  }
}
