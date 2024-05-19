import 'dart:convert';

import 'package:application/controllers/core.dart';
import 'package:application/controllers/location.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class BranchesController extends Core {
  BranchesController._();

  static BranchesController _controller = BranchesController._();
  static BranchesController get instance => _controller;

  // static get BranchesController instance => _controller;

  Future<List<dynamic>>getBranches() async{
    Position locData = await LocationController.instance.getLocation();
    var res=await http.post(Uri.parse(super.BASE_URL + '/branches/'),

    body: {
      'lat': locData.latitude.toString(),
      'lng': locData.longitude.toString(),
    });
    if(res.statusCode==200){
      return jsonDecode(utf8.decode(res.bodyBytes));
    }
    return [];
  }

  // Get branch by id
  getBranchById(int id) {
    // Get branch by id from the database
  }

  // Create a new branch
  createBranch() {
    // Create a new branch in the database
  }

  // Update a branch
  updateBranch(int id) {
    // Update a branch in the database
  }

// Delete a branch

// Delete a branch from the database
}
