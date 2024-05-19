import 'dart:convert';
import 'dart:io';

import 'package:application/controllers/core.dart';
import 'package:application/models/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

class ProductsController extends Core {
  // ProductsController
  ProductsController._privateConstructor();

  static final ProductsController _instance =
      ProductsController._privateConstructor();

  static ProductsController get instance => _instance;

  Future<List<Product>> list({
    String brand = '',
    String category = '',
  }) async {
    var response = await http.get(
        Uri.parse(
            super.BASE_URL + '/products/?brand=$brand&category=$category'),
        headers: await headers());
    if (response.statusCode == 200) {
      List<Product> products = [];
      var data = jsonDecode(utf8.decode(response.bodyBytes));
      for (var item in data) {
        products.add(Product.fromJson(item));
      }
      return products;
    }
    return [];
  }

  Future<Product?> details(String id) async {
    var response = await http.get(Uri.parse(super.BASE_URL + '/products/$id/'),
        headers: await headers());
    if (response.statusCode == 200) {
      var data = jsonDecode(utf8.decode(response.bodyBytes));
      return Product.fromJson(data);
    }
    return null;
  }

  Future<void> issueBill(String id) async {
    super.headers();
    var response = await http.post(Uri.parse(super.BASE_URL + '/bills/'),
        body: jsonEncode({'id': id}), headers: await headers());
    if (response.statusCode == 201) {
      GetStorage box = GetStorage();
     await box.write('bill_id', jsonDecode(response.body)['bill_id'].toString());
      Get.snackbar(
          'تم إصدار الفاتورة',
          'تم إصدار الفاتورة بنجاح',
          backgroundColor: Colors.green,
          colorText: Colors.white,
          titleText: const Text(
            'تم إصدار الفاتورة',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: 'Tajawal',
              color: Colors.white,
            ),
          ),
          messageText: const Text(
            'تم إصدار الفاتورة بنجاح',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              fontFamily: 'Tajawal',
              color: Colors.white,
            ),
          ),
          snackPosition: SnackPosition.BOTTOM);
      Get.toNamed('/product/delevery');
    }
  }

  Future<Product?> confirmOrder(String orderId) async {
    return null;
  }

  Future<Product?> setDelivery(String bill_id,String option,{
    String address = '',
  }) async {
    super.headers();
    var response = await http.post(Uri.parse(super.BASE_URL + '/orders/'),
        body: jsonEncode({'bill_id': bill_id,'option':option,
        'address': address,
        }),
        headers: await headers());
    if (response.statusCode == 200) {}
    return null;
  }

  Future<void> addProduct({
    required String name,
    required String brand,
    required String category,
    required String price,
     String ?image,
     List<Map<String,String>>? details,
  }) async {
    // var response = await http.post(Uri.parse(super.BASE_URL + '/products/');
        var request = await http.MultipartRequest('POST', Uri.parse(super.BASE_URL + '/products/'));
    request.fields['name'] = name;
    request.fields['brand'] = brand;
    request.fields['category'] = category;
    request.fields['price'] = price;

    if (details != null) {
      request.fields['details'] = jsonEncode(details);
    }
    if (image!=null) {
      var pic = File(image);
      var stream = http.ByteStream(pic.openRead());
      stream.cast();
      var length = await pic.length();
      var multipartFile = http.MultipartFile('image', stream, length,
          filename: basename(pic.path));
      request.files.add(multipartFile);
    }
        // headers: await headers());

        var response = await request.send();
    if (response.statusCode == 201) {
      Get.snackbar(
          'تم إضافة المنتج',
          'تم إضافة المنتج بنجاح',
          backgroundColor: Colors.green,
          colorText: Colors.white,
          titleText: const Text(
            'تم إضافة المنتج',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: 'Tajawal',
              color: Colors.white,
            ),
          ),
          messageText: const Text(
            'تم إضافة المنتج بنجاح',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              fontFamily: 'Tajawal',
              color: Colors.white,
            ),
          ),
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
