import 'package:application/controllers/authentication.dart';
import 'package:application/views/shared/button.dart';
import 'package:application/views/shared/header_card.dart';
import 'package:application/views/shared/verification_code_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyView extends StatefulWidget {
  const VerifyView({super.key, required this.uuid});

  final String uuid;

  @override
  State<VerifyView> createState() => _VerifyViewState();
}

class _VerifyViewState extends State<VerifyView> {
  final TextEditingController __controller = TextEditingController();

  @override
  void dispose() {
    __controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    __controller.addListener(() {
      if (__controller.text.length == 6) {}
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'تحقق من البريد الإلكتروني',
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
            HeaderCard(
              title: 'تحقق من البريد الإلكتروني',
              height: 70,
              width: Get.width * 0.7,
              textStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF9E773A),
                fontFamily: 'Tajawal',
              ),
            ).paddingOnly(top: Get.height * 0.2),
            Center(
              child: VerificationCode(
                width: Get.width * 0.8,
                border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  borderSide: BorderSide(
                    color: Get.theme.primaryColor,
                    width: .5,
                  ),
                ),
                focuseBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  borderSide: BorderSide(
                    color: Get.theme.primaryColor,
                    width: 1,
                  ),
                ),
                fieldPadding: const EdgeInsets.only(left: 10, right: 10),
                fieldHeight: 50,
                length: 6,
                controller: __controller,
                fieldWidth: 30,
              ).paddingOnly(top: 50),
            ),
            const Text(
              "تم إرسال رقم التحقق على البريد الإلكتروني الخاص بك",
              style: TextStyle(
                color: Color(0xFF9E773A),
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontFamily: 'Tajawal',
              ),
            ).paddingOnly(top: 20, bottom: 30),
            Button(
              onPressed: () async {
                // reverse
                String code = "";

                for (int i = 0; i < __controller.text.length; i++) {
                  code = __controller.text[i] + code;
                }
                await AuthenticationController.instance.activateEmail(
                  code: code,
                  uuid: widget.uuid,
                );
                __controller.clear();
              },
              text: 'تحقق',
            ).paddingOnly(top: 20),
            const Spacer(),
            // GestureDetector(
            //   onTap: () {
            //
            //
            //   },
            //   child: Text(
            //     'إعادة إرسال رمز التحقق؟',
            //     style: TextStyle(
            //         color: Get.theme.primaryColor,
            //         fontFamily: 'Tajawal',
            //         fontSize: 14,
            //         fontWeight: FontWeight.bold,
            //         decoration: TextDecoration.underline,
            //         decorationColor: Get.theme.primaryColor,
            //         decorationStyle: TextDecorationStyle.solid,
            //         decorationThickness: 2
            //     ),
            //   ),
            // ).paddingOnly(bottom: 80),
          ],
        ),
      ),
    );
  }
}
