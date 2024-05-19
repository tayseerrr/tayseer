import 'dart:async';

import 'package:application/controllers/authentication.dart';
import 'package:application/core/email_checker.dart';
import 'package:application/utilities/password_checker.dart';
import 'package:application/views/shared/button.dart';
import 'package:application/views/shared/dialog/error_msg.dart';
import 'package:application/views/shared/textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends StatefulWidget {
  LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // emailController.addListener(() {
    //   determineAccountType(emailController.text);
    // });
  }
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          'تسجيل الدخول',
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
        child: Form(
          key: _key,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.png',
                width: Get.width * 0.3,
                height: Get.width * 0.3,
              ).paddingOnly(bottom: 70, top: 60),
              AppTextField(
                validator: (value) {
                  if (value!.isEmpty) {
                    showErrorSnackbar(message: 'كلمة المرور مطلوبة', title: 'ناقص');
                  }
                  // determineAccountType(value);

                },
                controller: emailController,
                height: 60,
                prefixIcon: const Icon(Icons.alternate_email),
                hintText: 'إدخل البريد الإلكتروني ',
                labelText: 'البريد الإلكتروني',
                fillColor: Colors.white,
              ).paddingOnly(bottom: 20),
              AppTextField(
                validator: (value) {
                  if (value!.isEmpty) {
                    showErrorSnackbar(message: 'كلمة المرور مطلوبة', title: 'ناقص');
                  }
                   checkPasswordRequirements(value);

                },
                controller: passwordController,
                fillColor: Colors.white,
                height: 60,
                prefixIcon: const Icon(Icons.lock),
                minLines: 1,
                maxLines: 1,
                hintText: 'إدخل كلمة المرور',
                labelText: 'كلمة المرور',
                obscureText: true,
              ),
              // SizedBox(
              //   width: Get.width * 0.8,
              //   height: 70,
              //   child: GestureDetector(
              //     onTap: () {},
              //     child: Text(
              //       'نسيت كلمة المرور؟',
              //       style: TextStyle(
              //           color: Get.theme.primaryColor,
              //           fontFamily: 'Tajawal',
              //           fontSize: 12,
              //           fontWeight: FontWeight.bold,
              //           decoration: TextDecoration.underline,
              //           decorationColor: Get.theme.primaryColor,
              //           decorationStyle: TextDecorationStyle.solid,
              //           decorationThickness: 2),
              //       textAlign: TextAlign.right,
              //     ).paddingOnly(right: 30, top: 10, bottom: 20),
              //   ),
              // ),
              Button(
                height: 50,
                text: 'تسجيل الدخول',
                onPressed: ()async{
                  //  check if email is valid
                  // String d=determineAccountType(emailController.text);
                  // if (d.isNotEmpty) {
                  //   return ;
                  // }
                  // String passwordError = checkPasswordRequirements(passwordController.text);
                  // if (passwordError.isNotEmpty) {
                  //   Get.snackbar('خطأ', passwordError, backgroundColor: Colors.red, colorText: Colors.white, snackPosition: SnackPosition.BOTTOM, duration: const Duration(seconds: 3),
                  //     titleText: const Text(
                  //       'خطأ',
                  //       style: TextStyle(
                  //         color: Colors.white,
                  //         fontFamily: 'Tajawal',
                  //         fontSize: 20,
                  //       ),
                  //     ),
                  //     messageText:  Text(
                  //       passwordError,
                  //       style: TextStyle(
                  //           color: Colors.white, fontSize: 15, fontFamily: 'Tajawal'),
                  //     ),);
                  //   return;
                  // }

                  if (_key.currentState!.validate()) {
                  await AuthenticationController.instance.login(
                      email: emailController.text,
                      password: passwordController.text);}
                },
              ).paddingOnly(top: 30),
              const Spacer(),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'ليس لديك حساب؟ ',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Tajawal',
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed('/signup');
                    },
                    child: Text(
                      'سجل الآن',
                      style: TextStyle(
                          color: Get.theme.primaryColor,
                          fontFamily: 'Tajawal',
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                          decorationColor: Get.theme.primaryColor,
                          decorationStyle: TextDecorationStyle.solid,
                          decorationThickness: 2),
                    ),
                  )
                ],
              ).paddingOnly(bottom: 50)
            ],
          ),
        ),
      ),
    );
  }
}
