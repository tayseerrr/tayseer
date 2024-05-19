import 'dart:convert';

// http
import 'package:application/controllers/core.dart';
import 'package:http/http.dart' as http;

class CommitmentsController extends Core {
  CommitmentsController._privateConstructor();

  static final CommitmentsController _instance =
      CommitmentsController._privateConstructor();

  static CommitmentsController get instance => _instance;

  Future<Map<String, dynamic>> commitments() async {
    try {
      var response = await http.get(Uri.parse(BASE_URL + '/users/commitments/'),
          headers: await headers());
      var data = jsonDecode(utf8.decode(response.bodyBytes));
      if (response.statusCode == 200) {
        return data;
      }
      if (response.statusCode == 204) {
        return {};
      }
      return {};
    } catch (e) {
      print('Error at PoliciesController.info $e');
      return {};
    }
  }
}
