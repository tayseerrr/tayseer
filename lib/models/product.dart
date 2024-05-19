
class Product {
  final int id;
  final String name;
  final double price;
  final String image;
  final List<Map<String,String>> details;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    this.details=const [],
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    List<Map<String,String>> detailsList = [];
    // details will be a list of dynamic convert it to List<Map<String,String>>
    if (json['details']!=null) {

      var details = json['details'] as List<dynamic>;
      List<Map<String,String>> detailsList = [];
      details.forEach((element) {
        detailsList.add(Map<String,String>.from(element));
      });
      return Product(
        id: json['id'],
        name: json['name'],
        price:double.parse(json['price'].toString()),
        image: json['image'],
        details: detailsList,
      );
    }


    return Product(
      id: json['id'],
      name: json['name'],
      price:double.parse(json['price'].toString()),
      image: json['image'],
      details: detailsList,
    );
  }

}
