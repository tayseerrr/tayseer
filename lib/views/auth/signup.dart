import 'package:application/controllers/authentication.dart';
import 'package:application/core/email_checker.dart';
import 'package:application/utilities/password_checker.dart';
import 'package:application/views/shared/button.dart';
import 'package:application/views/shared/textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpView extends StatelessWidget {
  SignUpView({super.key});

  // final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          'إنشاء حساب جديد',
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppTextField(
              controller: firstNameController,
              height: 55,
              prefixIcon: const Icon(Icons.person),
              hintText: 'الإسم الأول للمستخدم',
              labelText: 'الإسم الأول',
              fillColor: Colors.white,
            ).paddingOnly(bottom: 20, top: 80),
            AppTextField(
              controller: lastNameController,
              fillColor: Colors.white,
              height: 55,
              prefixIcon: const Icon(Icons.person),
              minLines: 1,
              maxLines: 1,
              hintText: 'الإسم الأخير للمستخدم',
              labelText: 'الإسم الأخير',
            ).paddingOnly(bottom: 20),
            AppTextField(
              controller: emailController,
              height: 55,
              prefixIcon: const Icon(Icons.alternate_email),
              hintText: 'إدخل البريد الإلكتروني ',
              labelText: 'البريد الإلكتروني',
              fillColor: Colors.white,
            ).paddingOnly(bottom: 20),
            AppTextField(
              controller: passwordController,
              height: 55,
              obscureText: true,
              prefixIcon: const Icon(Icons.lock),
              hintText: 'إدخل كلمة المرور',
              labelText: 'كلمة المرور',
              fillColor: Colors.white,
              maxLines: 1,
            ).paddingOnly(bottom: 20),
            AppTextField(
              // obscureText: true,

              controller: confirmPasswordController,
              height: 55,
              prefixIcon: const Icon(Icons.lock),
              hintText: 'تأكيد كلمة المرور',
              labelText: 'تأكيد كلمة المرور',
              fillColor: Colors.white,
              obscureText: true,
              // test1234AA##
              maxLines: 1,
            ).paddingOnly(bottom: 20),

            Button(
              height: 55,
              text: 'إنشاء الحساب',
              onPressed: ()async {
                String d=determineAccountType(emailController.text);
                if (d.isNotEmpty) {
                  return ;
                }
                String passwordError = checkPasswordRequirements(passwordController.text);
                if (passwordError.isNotEmpty) {
                  Get.snackbar('خطأ', passwordError, backgroundColor: Colors.red, colorText: Colors.white, snackPosition: SnackPosition.BOTTOM, duration: const Duration(seconds: 3),
                    titleText: const Text(
                      'خطأ',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Tajawal',
                        fontSize: 20,
                      ),
                    ),
                    messageText:  Text(
                      passwordError,
                      style: const TextStyle(
                          color: Colors.white, fontSize: 15, fontFamily: 'Tajawal'),
                    ),);
                  return;
                }

                bool status=await AuthenticationController.instance.signUp(
                  email: emailController.text,
                  password: passwordController.text,
                  firstName: firstNameController.text,
                  lastName: lastNameController.text,
                );
                if (status) {
                  Get.snackbar(

                    'تم الإنشاء بنجاح ',
                    'تم إنشاء الحساب بنجاح',
                    backgroundColor: Colors.green,
                    snackPosition: SnackPosition.BOTTOM,
                    colorText: Colors.white,
                    titleText: const Text(
                      'تم الإنشاء بنجاح ',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Tajawal',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    messageText: const Text(
                      'تم إنشاء الحساب بنجاح',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Tajawal',
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  );
                  Get.toNamed('/login');
                }
              },
            ).paddingOnly(top: 30),
            const Spacer(),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'لديك حساب؟ ',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Tajawal',
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed('/login');
                  },
                  child: Text(
                    'تسجيل الدخول',
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
    );
  }
}
