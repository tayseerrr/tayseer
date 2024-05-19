import 'dart:convert';

import 'package:application/controllers/core.dart';
import 'package:http/http.dart' as http;

class ApplicationsController extends Core {
  ApplicationsController._();

  static final ApplicationsController _instance = ApplicationsController._();

  static ApplicationsController get instance => _instance;

  Future<Map<String, dynamic>> myApplication() async {
    try {
      var response = await http.get(
          Uri.parse(BASE_URL + '/users/applications/'),
              headers: await headers());
          var data = jsonDecode(utf8.decode(response.bodyBytes));
         if (response.statusCode == 200) {
           return data;
         }
          if (response.statusCode == 204) {
            return {};
          }
      return data;
     } catch (e)
      {
        print('Error at ApplicationsController.checkApplication $e');
        return {};
      }
    }
}