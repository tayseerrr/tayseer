import 'dart:io';

import 'package:application/controllers/medical.dart';
import 'package:application/models/medical.dart';
import 'package:application/views/shared/button.dart';
import 'package:application/views/shared/data_item.dart';
import 'package:application/views/shared/dialog/error_msg.dart';
import 'package:application/views/shared/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddMedicalPartnerView extends StatefulWidget {
  const AddMedicalPartnerView({super.key});

  @override
  State<AddMedicalPartnerView> createState() => _AddMedicalPartnerViewState();
}

class _AddMedicalPartnerViewState extends State<AddMedicalPartnerView> {
  final nameController = TextEditingController();
  final branchesController = TextEditingController();
  final descriptionController = TextEditingController();
  final offerNameController = TextEditingController();
  final offerValueController = TextEditingController();
  bool showDetailsInput = true;
  final _formKey = GlobalKey<FormState>();

  List<Widget> offers = [];
  List<MedicalOffer> offersData = [];
  final picker = ImagePicker();
  XFile? photo;
  Image? image;

  @override
  void initState() {
    super.initState();
    // image = Image.asset('assets/icons/avatar.png');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'إضافة شريك طبي',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontFamily: 'Tajawal',
          ),
        ),
        backgroundColor: Get.theme.primaryColor,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (image != null)
                  Container(
                    width: Get.width * 0.9,
                    height: Get.width * 0.7,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: FileImage(File(photo!.path)),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ).paddingOnly(
                    top: 30,
                  ),
                Button(
                  text: 'إضافة شعار الشريك',
                  onPressed: () {
                    Get.dialog(chooseImageDialog());
                  },
                ).paddingOnly(bottom: 50, top: 20),
                AppTextField(
                  controller: nameController,
                  height: 55,
                  prefixIcon: const Icon(Icons.label),
                  hintText: 'إسم الشريك الطبي',
                  labelText: 'الإسم الأول',
                  fillColor: Colors.white,
                  validator: (value) {
                    if (value!.isEmpty) {
                      // showSnackBar(title: "خطأ", msg: "الرجاء إدخال الإسم");
                      showErrorSnackbar(title: "خطأ", message: "الرجاء إدخال الإسم");
                    }
                    return null;
                  },
                ).paddingOnly(
                  bottom: 20,
                ),

                // specializations
                AppTextField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      showErrorSnackbar(title: "خطأ", message: "الرجاء إدخال الفروع");
                    }
                    return null;
                  },
                  controller: branchesController,
                  height: 60,
                  maxLines: 5,
                  prefixIcon: const Icon(Icons.grid_view),
                  hintText: 'الفرع',
                  labelText: ' فروع الشريك',
                  fillColor: Colors.white,
                ).paddingOnly(bottom: 10),
                ExtendAppTextField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      showErrorSnackbar(title: "خطأ", message: "الرجاء إدخال الوصف");
                    }
                    return null;
                  },
                  controller: descriptionController,
                  height: 300,
                  maxLines: 5,
                  minLines: 5,
                  prefixIcon: const Icon(Icons.description),
                  hintText: 'الوصف',
                  labelText: 'إضافة الوصف',
                  fillColor: Colors.white,
                ).paddingOnly(bottom: 50),
                ...offers,
                Visibility(
                  visible: showDetailsInput,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: Get.width * 0.4,
                        child: TextField(
                          controller: offerNameController,
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
                          keyboardType: TextInputType.number,
                          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                          key: const ValueKey('offerValue'),
                          controller: offerValueController,
                          style: const TextStyle(
                            fontFamily: 'Tajawal',
                          ),
                          decoration: InputDecoration(
                            hintText: 'نسبة الخصم',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ).paddingOnly(top: 30, bottom: 20),
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

                Button(
                  text: 'إنشاء الشريك',
                  onPressed: ()async {
                    if (_formKey.currentState!.validate()) {
                    await  MedicalController.instance.createMedicalPartner(
                       Medical(
                          name: nameController.text,
                          branches: branchesController.text,
                          description: descriptionController.text,
                         logo: photo?.path,
                          offers: offersData,


                       )
                      );

                    }
                  },
                ).paddingOnly(bottom: 70, top: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  addDetails() {
    setState(() {
      showDetailsInput = true;
      if (offerNameController.text.isNotEmpty &&
          offerNameController.text.isNotEmpty) {
        offers.add(DataItem(
          width: Get.width * 0.9,
          titleWidth: Get.width * 0.3,
          title: offerNameController.text,
          value: offerValueController.text,
        ));

        offersData.add(
          MedicalOffer(
            title: offerNameController.text,
            discount: double.parse(offerValueController.text),
          ));
        offerNameController.clear();
        offerValueController.clear();
      }
    });
  }

  AlertDialog chooseImageDialog() {
    return AlertDialog(
      title: Center(
        child: Text(
          "Choose Image from",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Get.theme.primaryColor,
          ),
        ),
      ),
      content: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: SizedBox(
                height: 90,
                child: GestureDetector(
                  onTap: () async {
                    photo = await picker.pickImage(source: ImageSource.gallery);
                    setState(
                      () {
                        image = Image.file(File(photo!.path));
                      },
                    );

                    Get.back();
                  },
                  child: Column(
                    children: [
                      Icon(
                        Icons.image_outlined,
                        color: Get.theme.primaryColor,
                        size: 42,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Gallery",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Get.theme.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: SizedBox(
                height: 90,
                child: GestureDetector(
                  onTap: () async {
                    photo = await picker.pickImage(source: ImageSource.camera);
                    setState(
                      () {
                        image = Image.file(
                          File(photo!.path),
                        );
                      },
                    );
                    //hide dialog
                    Get.back();
                  },
                  child: Column(
                    children: [
                      Icon(
                        Icons.camera_alt_outlined,
                        size: 42,
                        color: Get.theme.primaryColor,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Camera",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Get.theme.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // showSnackBar({required String title, required String msg}) {
  //   Get.snackbar(
  //     title,
  //     msg,
  //     snackPosition: SnackPosition.BOTTOM,
  //     backgroundColor: Colors.redAccent,
  //     colorText: Colors.white,
  //     duration: const Duration(seconds: 3),
  //     titleText: Text(
  //       title,
  //       style: const TextStyle(
  //         color: Colors.white,
  //         fontFamily: 'Tajawal',
  //         fontSize: 20,
  //       ),
  //     ),
  //     messageText: Text(
  //       msg,
  //       style: const TextStyle(
  //           color: Colors.white, fontSize: 15, fontFamily: 'Tajawal'),
  //     ),
  //   );
  // }
}
