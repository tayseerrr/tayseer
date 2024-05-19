import 'dart:convert';

import 'package:application/controllers/core.dart';
import 'package:http/http.dart' as http;

class AccountController extends Core {
  AccountController._();

  static final AccountController _instance = AccountController._();

  static AccountController get instance => _instance;

  Future<Map<String, dynamic>?> getAccount() async {
    var response = await http.get(
        Uri.parse('${super.BASE_URL}/users/students/'),
        headers: await headers());


    if (response.statusCode == 200) {
      return jsonDecode(utf8.decode(response.bodyBytes));
    }
    return null;
  }
}
