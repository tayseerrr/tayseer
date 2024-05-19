import 'dart:convert';

import 'package:application/controllers/core.dart';
import 'package:application/views/home.dart';
import 'package:application/views/auth/login.dart';
import 'package:application/views/auth/verifiy.dart';
import 'package:application/views/home/home.dart';
import 'package:application/views/home/home_page.dart';
import 'package:application/views/suppliers/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class AuthenticationController extends Core {
  AuthenticationController._privateConstructor();

  // get BASE_URL => 'http://127.0.0.1:8000/api/v1';

  static final AuthenticationController _instance =
      AuthenticationController._privateConstructor();

  static AuthenticationController get instance => _instance;

  Future<bool> signIn() async {
    return true;
  }

  Future<bool> signUp({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    var response = await http.post(Uri.parse(BASE_URL + '/users/auth/'), body: {
      'email': email,
      'password': password,
      'first_name': firstName,
      'last_name': lastName,
    });
    if (response.statusCode == 201) {
      return true;
    }
    return false;
  }

  Future<bool> login({
    required String email,
    required String password,
  }) async {
    var response =
        await http.post(Uri.parse(BASE_URL + '/users/token/'), body: {
      'email': email,
      'password': password,
    });
    if (response.statusCode == 200) {
      GetStorage box = GetStorage();
      box.write('access', jsonDecode(response.body)['access']);
      box.write('refresh', jsonDecode(response.body)['refresh']);
      box.write('account_type', jsonDecode(response.body)['account_type']);
      String accountType = jsonDecode(response.body)['account_type'];
      //  student, admission, supplier
      if (accountType == 'student') {
        Get.to(() =>  HomePage());
      } else if (accountType == 'admission') {
        Get.to(() => const AdmissionHomeView());
      } else if (accountType == 'supplier') {
        Get.to(() => const SuppliersHomeView());
      }
      else{}
    } else if (response.statusCode == 302) {

      GetStorage box = GetStorage();
      box.write('access', jsonDecode(response.body)['access']);
      box.write('refresh', jsonDecode(response.body)['refresh']);
      box.write('account_type', jsonDecode(response.body)['account_type']);


      // VerifyView(),
      // String uuid = jsonDecode(response.body)['uuid'];
      Get.to(() => const VerifyView(
            uuid: 'uuid',
          ));
    } else {
      Get.snackbar(
        'خطأ',
        'البريد الإلكتروني أو كلمة المرور غير صحيحة',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
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
          'البريد الإلكتروني أو كلمة المرور غير صحيحة',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Tajawal',
            fontSize: 14,
            fontWeight: FontWeight.normal,
          ),
        ),
      );
    }
    return false;
  }

  Future<bool> verify() async {
    String access = GetStorage().read('access');
    try {
      var response =
          await http.post(Uri.parse(BASE_URL + '/users/token/verify/'), body: {
        'token': access,
      });

      if (response.statusCode != 200) {
        return false;
      }
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> refresh() async {
    String refresh = GetStorage().read('refresh');
    var response =
        await http.post(Uri.parse(BASE_URL + '/users/token/refresh/'), body: {
      'refresh': refresh,
    });
    GetStorage box = GetStorage();
    if (response.statusCode == 200) {
      await box.write('access', jsonDecode(response.body)['access']);
      await box.write('refresh', jsonDecode(response.body)['refresh']);
      return true;
    }
    await logout();
    return false;
  }

//   logout
  logout() async {
    GetStorage box = GetStorage();
    // check if access token is available
    if (box.hasData('access')) {
      box.remove('access');
    }
    // check if refresh token is available
    if (box.hasData('refresh')) {
      box.remove('refresh');
    }

    Get.toNamed('/login');
  }

  Future<bool> activateEmail({
    required String uuid,
    required String code,
  }) async {
    var response =
        await http.get(Uri.parse(BASE_URL + '/users/activate/'),
          headers:await headers()

        );
    if (response.statusCode == 200) {
      String accountType = GetStorage().read('account_type');
      if (accountType == 'student') {
        Get.to(() =>  HomePage());
      } else if (accountType == 'admission') {
        Get.to(() => const AdmissionHomeView());
      } else if (accountType == 'supplier') {
        Get.to(() => const SuppliersHomeView());
      }
      Get.snackbar(
        'تم التحقق',
        'تم التحقق بنجاح',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
        titleText: const Text(
          'تم التحقق',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Tajawal',
            fontSize: 20,
          ),
        ),
        messageText: const Text(
          'تم التحقق بنجاح',
          style: TextStyle(
              color: Colors.white, fontSize: 15, fontFamily: 'Tajawal'),
        ),
      );
      //
      return true;
    }else{
      Get.snackbar(
        'خطأ',
        'الرمز غير صحيح',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
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
          'الرمز غير صحيح',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Tajawal',
            fontSize: 14,
            fontWeight: FontWeight.normal,
          ),
        ),
      );
    }
    return false;
  }
}
