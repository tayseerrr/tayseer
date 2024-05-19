import 'dart:io';

import 'package:application/controllers/consulting.dart';
import 'package:application/views/shared/button.dart';
import 'package:application/views/shared/dialog/error_msg.dart';
import 'package:application/views/shared/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddConsultantView extends StatefulWidget {
  const AddConsultantView({super.key});

  @override
  State<AddConsultantView> createState() => _AddConsultantViewState();
}

class _AddConsultantViewState extends State<AddConsultantView> {
  final nameController = TextEditingController();
  final experienceController = TextEditingController();
  final descriptionController = TextEditingController();
  final specializationsController = TextEditingController();
  final picker = ImagePicker();
  final __formKey = GlobalKey<FormState>();
  XFile? photo;
  Image? image;

  @override
  void initState() {
    super.initState();
    image = Image.asset('assets/icons/avatar.png');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'إضافة استشاري',
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
            key: __formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        Get.dialog(chooseImageDialog());
                      },
                      child: Container(
                        height: Get.width * 0.35,
                        width: Get.width * 0.35,

                        // width: Get.width * 0.8,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          // borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: image!.image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      // right:

                      // left: Get.locale!.languageCode == 'ar' ? null : 130,
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Get.theme.primaryColor,
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.add_a_photo,
                              color: Colors.white),
                          onPressed: () {
                            Get.dialog(chooseImageDialog());
                          },
                        ),
                      ),
                    ),
                  ],
                ).paddingOnly(bottom: 30, top: 0),
                AppTextField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      showErrorSnackbar(
                          title: 'خطأ', message: 'الرجاء إدخال إسم المستشار');
                    }
                    return null;
                  },
                  controller: nameController,
                  height: 55,
                  prefixIcon: const Icon(Icons.label),
                  hintText: 'إسم المستشار',
                  labelText: 'الإسم ',
                  fillColor: Colors.white,
                ).paddingOnly(
                  bottom: 20,
                ),
                AppTextField(
                  validator: (value) {
                    if (value!.isEmpty && !Get.isSnackbarOpen) {
                      showErrorSnackbar(
                          title: 'خطأ', message: 'الرجاء إدخال الخبرة');
                    }
                    return null;
                  },
                  controller: experienceController,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],

                  fillColor: Colors.white,
                  height: 55,
                  prefixIcon: const Icon(Icons.home_repair_service_rounded),
                  minLines: 1,
                  maxLines: 1,
                  hintText: 'الخبرة',
                  labelText: 'الخبرة',
                ).paddingOnly(bottom: 20),

                // specializations
                AppTextField(
                  validator: (value) {
                    if (!Get.isSnackbarOpen && value!.isEmpty) {
                      showErrorSnackbar(
                          title: 'خطأ', message: 'الرجاء إدخال التخصص');
                    }
                    return null;
                  },
                  controller: specializationsController,
                  height: 60,
                  maxLines: 5,
                  prefixIcon: const Icon(Icons.lock),
                  hintText: 'التخصص',
                  labelText: 'إضافة تخصص',
                  fillColor: Colors.white,
                ).paddingOnly(bottom: 10),
                ExtendAppTextField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      if (!Get.isSnackbarOpen) {
                        showErrorSnackbar(
                            title: 'خطأ', message: 'الرجاء إدخال الوصف');
                      }
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
                ).paddingOnly(bottom: 20),
                Button(
                  text: 'إنشاء حساب',
                  onPressed: () async{
                    if (__formKey.currentState!.validate()) {
                     await ConsultingController.instance.addConsulting(
                        name: nameController.text,
                        experience: experienceController.text,
                        description: descriptionController.text,
                        image: photo!=null?photo!.path:'',
                        speciality: specializationsController.text,
                      );
                    }
                  },
                ).paddingOnly(bottom: 20),
              ],
            ),
          ),
        ),
      ),
    );
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
}
