import 'dart:convert';

import 'package:application/controllers/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoansController extends Core {
  LoansController._privateConstructor();

  static final LoansController _instance =
      LoansController._privateConstructor();

  static LoansController get instance => _instance;

  Future<Map<String, dynamic>> loabApply() async {
    try {
      var response = await http.post(
        Uri.parse(BASE_URL + '/loan/'),
        headers: await headers(),
      );
      var data = jsonDecode(utf8.decode(response.bodyBytes));
      if (response.statusCode == 201) {
        Get.snackbar(
          'تم التقديم بنجاح',
          'تم تقديم طلب القرض بنجاح يرجى انتظار الرد من الإدارة ',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
          duration: const Duration(seconds: 3),
          titleText: const Text(
            'تم التقديم بنجاح',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Tajawal',
              fontSize: 20,
            ),
          ),
          messageText: const Text(
            'تم تقديم طلب القرض بنجاح يرجى انتظار الرد من الإدارة',
            style: TextStyle(
                color: Colors.white, fontSize: 15, fontFamily: 'Tajawal'),
          ),
        );
      } else {
        Get.snackbar(
          'تم التقديم بنجاح',
          'تم تقديم طلب القرض بنجاح يرجى انتظار الرد من الإدارة ',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
          duration: const Duration(seconds: 3),
          titleText: const Text(
            'حدث خطأ',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Tajawal',
              fontSize: 20,
            ),
          ),
          messageText: const Text(
            ' حدث خطأ أثناء تقديم طلب القرض يرجى المحاولة مرة أخرى او التواصل مع الإدارة',
            style: TextStyle(
                color: Colors.white, fontSize: 15, fontFamily: 'Tajawal'),
          ),
        );
      }
      return data;
    } catch (e) {
      print('Error at PoliciesController.loabApply $e');
      return {
        'status': 'unsuccessful',
        'msg': 'An error occurred',
      };
    }
  }

  Future<Map<String, dynamic>> checkLoan() async {
    try {
      var response = await http.get(Uri.parse(BASE_URL + '/loan/check/'),
          headers: await headers());
      var data = jsonDecode(utf8.decode(response.bodyBytes));
      return data;
    } catch (e) {
      print('Error at PoliciesController.checkLoan $e');
      return {
        'status': 'unsuccessful',
        'msg': 'An error occurred',
      };
    }
  }

  Future<List<Map<String, dynamic>>> list() async {
    List<Map<String, dynamic>> loans = [];
    try {
      var response = await http.get(Uri.parse(BASE_URL + '/loan/'),
          headers: await headers());
      var data = jsonDecode(utf8.decode(response.bodyBytes));
      Map<String, dynamic> loanData = {};
      for (var loan in data) {
        loanData['id'] = loan['id'].toString();
        loanData['user'] = loan['user'].toString();
        loanData['status'] = loan['status'].toString();
        loanData['apply_date'] = loan['apply_date'].toString();
        loans.add(loanData);
      }
      // print('loans ${loans.length}');
      return loans;
    } catch (e) {
      print('Error at PoliciesController.list $e');
      return [];
    }
  }

  Future<bool> accept({required String id}) async {
    try {
      // partial_update
      var response = await http.patch(
        Uri.parse(BASE_URL + '/loan/$id/'),
        headers: await headers(),
      );
       jsonDecode(utf8.decode(response.bodyBytes));
      if (response.statusCode == 200) {
        Get.snackbar(
          'تم قبول الطلب',
          'تم قبول طلب القرض بنجاح',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
          duration: const Duration(seconds: 3),
          titleText: const Text(
            'تم قبول الطلب',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Tajawal',
              fontSize: 20,
            ),
          ),
          messageText: const Text(
            'تم قبول طلب القرض بنجاح',
            style: TextStyle(
                color: Colors.white, fontSize: 15, fontFamily: 'Tajawal'),
          ),
        );
        return true;
      } else {
        Get.snackbar(
          'حدث خطأ',
          'حدث خطأ أثناء قبول طلب القرض يرجى المحاولة مرة أخرى او التواصل مع الإدارة',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
          duration: const Duration(seconds: 3),
          titleText: const Text(
            'حدث خطأ',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Tajawal',
              fontSize: 20,
            ),
          ),
          messageText: const Text(
            'حدث خطأ أثناء قبول طلب القرض يرجى المحاولة مرة أخرى او التواصل مع الإدارة',
            style: TextStyle(
                color: Colors.white, fontSize: 15, fontFamily: 'Tajawal'),
          ),
        );
        return false;
      }
    } catch (e) {
      print('Error at PoliciesController.accept $e');
      return false;
    }
  }
}
