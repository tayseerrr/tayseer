import 'dart:async';

class ConsultantModel{

  String id;
  String name;
  String experience;
  String speciality;
  String image;
  String description;
  ConsultantModel({
    required this.id,
    required this.name,
    required this.experience,
    required this.speciality,
    required this.description,
    required this.image,
  });
  factory ConsultantModel.fromJson(Map<String, dynamic> json) {
    return ConsultantModel(
      id: json['cid'].toString(),
      name: json['name'].toString(),
      experience: json['experience'].toString(),
      speciality: json['specialization'].toString(),
      description: json['description'].toString(),
      image: json['profile_picture'].toString(),
    );
  }
}