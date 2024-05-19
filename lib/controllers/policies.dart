import 'dart:convert';

import 'package:application/controllers/core.dart';
import 'package:http/http.dart' as http;

class PoliciesController extends Core {
  PoliciesController._privateConstructor();

  static final PoliciesController _instance =
      PoliciesController._privateConstructor();

  static PoliciesController get instance => _instance;



}
