import 'dart:io';

import 'package:application/controllers/products.dart';
import 'package:application/views/shared/button.dart';
import 'package:application/views/shared/data_item.dart';
import 'package:application/views/shared/textfield.dart';
import 'package:application/views/suppliers/widgets/show_brands.dart';
import 'package:application/views/suppliers/widgets/show_categories.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  XFile? image;
  final ImagePicker _picker = ImagePicker();
  bool showDetailsInput = false;
  List<Widget> details = [];
  List<Map<String, String>> detailsData = [];
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController valueController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController brandController = TextEditingController();
  String categoryID = '';
  String brandID = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "إضافة منتج",
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
      body: SafeArea(
        child: Container(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  AppTextField(
                    controller: nameController,
                    hintText: 'اسم المنتج',
                    width: Get.width * 0.9,
                    height: 60,
                    prefixIcon: const Icon(Icons.shopping_bag_outlined),
                  ).paddingOnly(top: 30),
                  AppTextField(
                    controller: priceController,
                    hintText: 'السعر',
                    width: Get.width * 0.9,
                    height: 60,
                    prefixIcon: const Icon(Icons.money),
                  ).paddingOnly(top: 10),

                  GestureDetector(
                    onTap: () {
                      Get.dialog(
                        showCategories(
                          context,
                          (String? ID, String? categoryName) {
                            categoryController.text = categoryName!;
                            categoryID = ID!;
                          },
                        ),
                      );
                    },
                    child: AppTextField(
                      controller: categoryController,
                      enabled: false,
                      hintText: 'القسم',
                      width: Get.width * 0.9,
                      height: 60,
                      prefixIcon: const Icon(Icons.grid_view),
                    ).paddingOnly(top: 10),
                  ),
                  // brand
                  GestureDetector(
                    onTap: () {
                      Get.dialog(showBrands(context,
                          (String? ID, String? brandName) {
                        brandController.text = brandName!;
                        brandID = ID!;
                      }));
                    },
                    child: AppTextField(
                      controller: brandController,
                      enabled: false,
                      hintText: 'الماركة',
                      width: Get.width * 0.9,
                      height: 60,
                      prefixIcon: const Icon(Icons.branding_watermark),
                    ).paddingOnly(top: 10),
                  ),

                  if (image != null)
                    Container(
                      width: Get.width * 0.9,
                      height: Get.width * 0.7,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: FileImage(File(image!.path)),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ).paddingOnly(top: 30, bottom: 30),
                  CustomButton(
                    height: 45,
                    width: 200,
                    child: const Row(
                      children: [
                        Icon(Icons.add_photo_alternate,
                            color: Colors.white, size: 28),
                        SizedBox(width: 10),
                        Text(
                          'إضافة صورة',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'Tajawal',
                          ),
                        ),
                      ],
                    ),
                    onPressed: () {
                      _picker
                          .pickImage(source: ImageSource.gallery)
                          .then((value) {
                        setState(() {
                          image = value;
                        });
                      });
                    },
                  ).paddingOnly(top: 20, bottom: 20),
                  ...details,
                  Visibility(
                    visible: showDetailsInput,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: Get.width * 0.4,
                          child: TextField(
                            controller: titleController,
                            style: const TextStyle(
                              fontFamily: 'Tajawal',
                            ),
                            decoration: InputDecoration(
                              hintText: 'الإسم',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: Get.width * 0.4,
                          child: TextField(
                            controller: valueController,
                            style: const TextStyle(
                              fontFamily: 'Tajawal',
                            ),
                            decoration: InputDecoration(
                                hintText: 'التفاصيل',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                        ),
                      ],
                    ).paddingOnly(top: 30),
                  ),
                  CustomButton(
                    height: 45,
                    width: 200,
                    child: const Row(
                      children: [
                        Icon(Icons.add, color: Colors.white, size: 28),
                        SizedBox(width: 10),
                        Text(
                          'إضافة بيانات',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'Tajawal',
                          ),
                        ),
                      ],
                    ),
                    onPressed: () {
                      addDetails();
                    },
                  ).paddingOnly(top: 20),
                  CustomButton(
                    height: 45,
                    width: 200,
                    child: const Row(
                      children: [
                        Icon(Icons.save, color: Colors.white, size: 28),
                        SizedBox(width: 10),
                        Text(
                          'حفظ وإضافة',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'Tajawal',
                          ),
                        ),
                      ],
                    ),
                    onPressed: () async {
                      if (image != null) {
                        ProductsController.instance.addProduct(
                          name: nameController.text,
                          price: priceController.text,
                          category:categoryID,
                          brand: brandID,
                          image: image!.path,
                          details: detailsData,
                        );
                      } else {
                        ProductsController.instance.addProduct(
                          name: nameController.text,
                          price: priceController.text,
                          category:categoryID,
                          brand: brandID,
                          details: detailsData,
                        );
                      }
                    },
                  ).paddingOnly(top: 20),
                  SizedBox(
                    height: 50,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  addDetails() {
    setState(() {
      showDetailsInput = true;
      if (titleController.text.isNotEmpty && valueController.text.isNotEmpty) {
        details.add(DataItem(
          width: Get.width * 0.9,
          titleWidth: Get.width * 0.3,
          title: titleController.text,
          value: valueController.text,
        ));

        detailsData.add({
          'key': titleController.text,
          'value': valueController.text,
        });
        titleController.clear();
        valueController.clear();
      }
    });
  }
}
