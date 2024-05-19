import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:application/controllers/core.dart';
import 'package:application/core/consultant.dart';
import 'package:application/views/shared/dialog/error_msg.dart';
import 'package:application/views/shared/dialog/success_msg.dart';

// http
import 'package:http/http.dart' as http;

class ConsultingController extends Core {
  ConsultingController._privateConstructor();

  static final ConsultingController instance =
      ConsultingController._privateConstructor();

  // name, expirience, speciality, description, image
  Future<void> addConsulting(
      {required String name,
      required String experience,
      required String speciality,
      required String description,
      required String image}) async {
    try {
      var request =
          http.MultipartRequest('POST', Uri.parse('${BASE_URL}/consulting/'));
      if (image.isNotEmpty) {
        var file = File(image);

        var fileStream = http.MultipartFile(
          'logo',
          file.readAsBytes().asStream(),
          file.lengthSync(),
          filename: file.path.split('/').last,
        );
        request.files.add(fileStream);
      }
      request.fields['name'] = name;
      request.fields['experience'] = experience;
      request.fields['specialization'] = speciality;
      request.fields['description'] = description;
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);
      if (response.statusCode != 201) {
        showErrorSnackbar(message: 'طلبك غير صحيح', title: 'خطأ');
      } else {
        showSuccessSnackbar(title: 'تم', message: 'تم اضافة المستشار بنجاح');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<List<ConsultantModel>> list() async {
    try {
      List<ConsultantModel> consultants = [];
      final response = await http.get(Uri.parse('${BASE_URL}/consulting/'),
          // headers: await headers()

      );
      if (response.statusCode == 200) {
        var data = jsonDecode(utf8.decode(response.bodyBytes));


        for (var item in data) {
          consultants.add(ConsultantModel.fromJson(item));
        }

        return consultants;
      }
    } catch (e) {
      print(e);
    }
    return [];
  }
  Future<List<Map<String,dynamic>>> my() async {
    try {
      List<Map<String,dynamic>> consultants = [];
      final response = await http.get(Uri.parse('${BASE_URL}/consulting/my/'),
          headers: await headers()

      );
      if (response.statusCode == 200) {
        var data = jsonDecode(utf8.decode(response.bodyBytes));
        for (var item in data) {

          consultants.add(item);
        }

        return consultants;
      }
    } catch (e) {
      print(e);
    }
    return [];
  }

  Future<void> booking({required int id, required int hour}) async {
    try {
      var body = jsonEncode({'id': id, 'hour': hour});
      final response = await http.post(
          Uri.parse('${BASE_URL}/consulting/book/'),
          headers: await headers(),
          body: body);
    } catch (e) {
      print(e);
    }
  }

  Future<List<String>> booked({required String id}) async {
    try {

      List<String> data = [];
      final response = await http.get(
          Uri.parse('${BASE_URL}/consulting/booked/$id/'),
          headers: await headers());
      if (response.statusCode == 200) {
        var d = jsonDecode(response.body)['time'];
        for (var item in d) {
          data.add(item.toString());
        }

        return data;
      }
    } catch (e) {
      print(e);
    }
    return [];
  }
}
