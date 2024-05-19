import 'dart:convert';
import 'dart:io';
import 'package:application/controllers/core.dart';
import 'package:application/models/medical.dart';
import 'package:application/views/shared/dialog/error_msg.dart';
import 'package:application/views/shared/dialog/success_msg.dart';
import 'package:http/http.dart' as http;

class MedicalController extends Core {
  MedicalController._();

  static final MedicalController instance = MedicalController._();

  // Base API URL - update this to your actual API endpoint

  Future<List<Medical>> getMedicalPartners() async {
    List<Medical> partners = [];
    final url = Uri.parse('$BASE_URL/medical/partners/');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      var data = jsonDecode(utf8.decode(response.bodyBytes));
      partners = data.map<Medical>((item) => Medical.fromJson(item)).toList();
      return partners;
    } else {
      showErrorSnackbar(message: 'حصلت مشكلة', title: 'خطأ');
      return [];
    }
  }

  Future<void> createMedicalPartner(Medical newPartner) async {
    final url = Uri.parse('$BASE_URL/medical/partners/');

    // Build the multipart request
    var request = http.MultipartRequest('POST', url);

    // Add image file
    if (newPartner.logo != null && newPartner.logo!.isNotEmpty) {
      var file = File(newPartner.logo!);
      var fileStream = http.MultipartFile(
        'logo',
        file.readAsBytes().asStream(),
        file.lengthSync(),
        filename: file.path.split('/').last,
      );
      request.files.add(fileStream);
    }

    // Add the JSON fields
    request.fields['name'] = newPartner.name;
    request.fields['description'] = newPartner.description;
    request.fields['branches'] = newPartner.branches;
    request.fields['offers'] = jsonEncode(newPartner.offers);

    // Send the multipart request
    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode != 201) {
      // Handle errors properly based on the response
      throw Exception('Failed to create a medical partner');
    }
    else{
      showSuccessSnackbar(title: 'تم', message: 'تم اضافة الشريك بنجاح');
    }
  }

  Future<void> submitApplication(String offerId) async {
    final url = Uri.parse('$BASE_URL/medical/apply/');
    final response = await http.post(
      url,
      headers:await headers(),
      body: jsonEncode({
        'offer_id': offerId,
      }),
    );

    if (response.statusCode != 201) {
      showErrorSnackbar(message: 'طلبك غير صحيح', title: 'خطأ');
    } else {
      showSuccessSnackbar(title: 'تم', message: 'تم تقييد الطلب بنجاح');
    }
  }

 Future<List> getApplications()async {
    final url = Uri.parse('$BASE_URL/medical/applications/');
    final response = await http.get(url, headers: await headers());
    if (response.statusCode == 200) {

      var data = jsonDecode(utf8.decode(response.bodyBytes));
      // print( (data is Map<String,dynamic>));
      // print(data is List);
      return data;
    } else {
      showErrorSnackbar(message: 'حصلت مشكلة', title: 'خطأ');
      return [];
    }

 }
}
