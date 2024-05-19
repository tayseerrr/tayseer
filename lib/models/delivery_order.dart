class DeliveryOrder {
  String id = '';
  String name = '';
  String productName = '';
  String email = '';
  String receivingMethod='';
  String address='';

  DeliveryOrder({
    required this.id,
    required this.name,
    required this.productName,
    required this.email,
    required this.receivingMethod,
    required this.address,
  });

  DeliveryOrder.fromJson(Map<String, dynamic> json) {
    try {
      id = json['order_id'].toString();
      name = json['name'].toString();
      productName = json['product_name'].toString();
      email = json['email'].toString();
      receivingMethod = json['receiving_method'].toString();
      address = json['address']??'';
    }
    //
    catch (e) {
      print(e);
    }
  }
}
