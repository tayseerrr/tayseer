import 'dart:convert';

import 'package:application/controllers/core.dart';
import 'package:application/models/delivery_order.dart';
import 'package:http/http.dart' as http;

class SupplierController extends Core {
  SupplierController._privateConstructor();
  static final SupplierController instance =
      SupplierController._privateConstructor();

  Future<List<DeliveryOrder>> listDeliveryOrders() async {
    List<DeliveryOrder> deliveryOrder = [];
    final response = await http.get(Uri.parse(super.BASE_URL + '/bills/all'));
    if (response.statusCode == 200) {
      var data = jsonDecode(utf8.decode(response.bodyBytes));

    // print(data[0] );
      data.forEach((element) {
        deliveryOrder.add(DeliveryOrder.fromJson(element));
      });
    }
    return deliveryOrder;
    return [];
  }

  void updateSupplier() {
    print('Supplier updated');
  }

  void deleteSupplier() {
    print('Supplier deleted');
  }

  void viewSupplier() {
    print('Supplier viewed');
  }
}
