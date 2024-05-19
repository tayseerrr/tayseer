import 'package:application/controllers/account.dart';
import 'package:application/controllers/authentication.dart';
import 'package:application/views/shared/bottom_navigation_bar.dart';
import 'package:application/views/shared/button.dart';
import 'package:application/views/shared/data_item.dart';
import 'package:application/views/shared/header_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  final titleStyle = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    fontFamily: 'Tajawal',
    color: Colors.white,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        actions: const [],
        leading: const SizedBox(),
        title: const Text(
          "الملف الشخصي",
          style: TextStyle(
            fontFamily: 'Tajawal',
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Get.theme.primaryColor,
      ),
      body: FutureBuilder<Map<String, dynamic>?>(
        future: AccountController.instance.getAccount(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return const Center(
                child: Text(
                  'حدث خطأ ما',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Tajawal',
                  ),
                ),
              );
            }
            if (snapshot.data == null) {
              return Column(
                children: [
                  Center(
                    child: Padding(
                      padding: EdgeInsets.all(Get.width * 0.2),
                      child: const Text(
                        'لا يوجد سجل اكاديمي مرتبط بهذا الحساب حالياً',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Tajawal',
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  CustomButton(
                      mainColor: const Color(0xFFD00836),
                      child: const Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.logout, color: Colors.white, size: 20),
                          Text(
                            'تسجيل الخروج',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Tajawal',
                            ),
                          ),
                        ],
                      ).paddingOnly(left: 50, right: 50, top: 10, bottom: 10),
                      onPressed: () async {
                        await AuthenticationController.instance.logout();
                        Get.toNamed('/login');
                      }).paddingOnly(bottom: 50, top: 20),
                ],
              );
            }
            return SingleChildScrollView(
              child: Column(
                children: [
                  // {"full_name":"","roll_no":"1","specialization":"1","collage":"1","enrollment_year":2020,"level":"1","average":90.0,"study_type":2,"loan":null}
                  Center(
                    child: HeaderCard(
                      title: 'معلومات الطالب',
                      height: 50,
                      width: Get.width * 0.75,
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Tajawal',
                        color: Color(0xFF9E773A),
                      ),
                    ).paddingOnly(top: 60, bottom: 30),
                  ),
                  DataItem(
                      title: 'الاسم',
                      value: snapshot.data!['full_name'].toString() ?? '',
                      width: Get.width * 0.75,
                      titleWidth: Get.width * 0.28,
                      titleStyle: titleStyle),
                  DataItem(
                      title: 'التخصص',
                      value: snapshot.data!['specialization'].toString() ?? '',
                      width: Get.width * 0.75,
                      titleWidth: Get.width * 0.28,
                      margin: const EdgeInsets.only(top: 10),
                      titleStyle: titleStyle),
                  DataItem(
                      title: 'الكلية',
                      value: snapshot.data!['collage'].toString() ?? '',
                      width: Get.width * 0.75,
                      titleWidth: Get.width * 0.28,
                      margin: const EdgeInsets.only(top: 10),
                      titleStyle: titleStyle),
                  DataItem(
                      title: 'سنة الإلتحاق ',
                      value: snapshot.data!['enrollment_year'].toString() ?? '',
                      width: Get.width * 0.75,
                      titleWidth: Get.width * 0.28,
                      margin: const EdgeInsets.only(top: 10),
                      titleStyle: titleStyle),
                  DataItem(
                      title: 'المستوى',
                      value: snapshot.data!['level'].toString() ?? '',
                      width: Get.width * 0.75,
                      titleWidth: Get.width * 0.28,
                      margin: const EdgeInsets.only(top: 10),
                      titleStyle: titleStyle),
                  DataItem(
                      title: 'المعدل',
                      value: snapshot.data!['average'].toString() ?? '',
                      width: Get.width * 0.75,
                      titleWidth: Get.width * 0.28,
                      margin: const EdgeInsets.only(top: 10),
                      titleStyle: titleStyle),
                  DataItem(
                      title: 'نوع الدراسة',
                      value: snapshot.data!['study_type'].toString() ?? '',
                      width: Get.width * 0.75,
                      titleWidth: Get.width * 0.28,
                      margin: const EdgeInsets.only(top: 10),
                      titleStyle: titleStyle),
                  if (snapshot.data!['loan'] != null )
                  DataItem(
                      title: 'قيمة القرض',
                      value: snapshot.data!['loan'].toString() ?? '0',
                      width: Get.width * 0.75,
                      titleWidth: Get.width * 0.28,
                      margin: const EdgeInsets.only(top: 10),
                      titleStyle: titleStyle),
                  DataItem(
                      title: 'مدة السداد',
                      value: '${snapshot.data!['duration']} أشهر' ?? '0',
                      width: Get.width * 0.75,
                      titleWidth: Get.width * 0.28,
                      margin: const EdgeInsets.only(top: 10),
                      titleStyle: titleStyle),
                  // Button(
                  //   text: 'تسجيل الخروج',
                  //   onPressed: () {
                  //     Get.toNamed('/edit_profile');
                  //   },
                  //   mainColor:  Color(0xFFD00836),
                  // ).paddingOnly(top: 20, bottom: 20),
                  CustomButton(
                      mainColor: const Color(0xFFD00836),
                      child: const Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.logout, color: Colors.white, size: 20),
                          Text(
                            'تسجيل الخروج',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Tajawal',
                            ),
                          ),
                        ],
                      ).paddingOnly(left: 50, right: 50, top: 10, bottom: 10),
                      onPressed: () async {
                        await AuthenticationController.instance.logout();
                        Get.toNamed('/login');
                      }).paddingOnly(bottom: 50, top: 20),
                ],
              ),
            );
          }
          return const Center(
            child: Text(
              'لا يوجد بيانات',
              style: TextStyle(
                color: Colors.red,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'Tajawal',
              ),
            ),
          );
        },
      ),
    );
  }
}
