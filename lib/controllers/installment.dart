import 'dart:convert';

import 'package:application/controllers/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class InstallmentController extends Core {
  InstallmentController._privateConstructor();

  static final InstallmentController _instance =
      InstallmentController._privateConstructor();

  static InstallmentController get instance => _instance;

  Future<Map<String, dynamic>> checkInstallment() async {
    try {
      var response = await http.get(Uri.parse(BASE_URL + '/installment/check/'),
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
    List<Map<String, dynamic>> requests = [];
    try {
      var response = await http.get(Uri.parse(BASE_URL + '/installment/list'),
          headers: await headers());
      var data = jsonDecode(utf8.decode(response.bodyBytes));
      Map<String, dynamic> loanData = {};
      for (var loan in data) {
        loanData['id'] = loan['order_id'].toString();
        loanData['name'] = loan['name'].toString();
        loanData['status'] = loan['status'].toString();
        loanData['apply_date'] = loan['order_date'].toString().substring(0, 16).replaceAll('T', ' ');
        // loanData['apply_date'] = loan['apply_date'].toString();
        requests.add(loanData);
      }
      // print('requests ${requests.length}');
      return requests;
    } catch (e) {
      print('Error at PoliciesController.list $e');
      return [];
    }
  }

  Future<bool> accept({required String id,required String status}) async {
    try {
      // partial_update
      var response = await http.post(
        Uri.parse(BASE_URL + '/installment/change/'),
        headers: await headers(),
        body: jsonEncode({'order_id': id, 'status': status}),
      );

      if (response.statusCode == 200) {
        if ( status == 'A') {
          Get.snackbar(
            'تم قبول الطلب',
            'تم قبول الطلب بنجاح',
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
              'تم قبول  الطلب بنجاح',
              style: TextStyle(
                  color: Colors.white, fontSize: 15, fontFamily: 'Tajawal'),
            ),
          );
        }
        else{
          Get.snackbar(
            'تم رفض الطلب',
            'تم رفض الطلب  بنجاح',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white,
            duration: const Duration(seconds: 3),
            titleText: const Text(
              'تم رفض الطلب',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Tajawal',
                fontSize: 20,
              ),
            ),
            messageText: const Text(
              'تم رفض  الطلب بنجاح',
              style: TextStyle(
                  color: Colors.white, fontSize: 15, fontFamily: 'Tajawal'),
            ),
          );
        }
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
