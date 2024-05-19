import 'package:flutter/material.dart';

AlertDialog showCategories(
    BuildContext context, Function(String? text,String? value) onTap) {
  String selectedCategory = "";
  const style = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    fontFamily: 'Tajawal',
    color: Colors.black,
  );
  return AlertDialog(
    //   CATEGORIES = (
    //         ('SP', 'Smart Phone'),
    //         ('TL', 'Tablet & Laptop'),
    //         ('AC', 'Accessories'),
    //     )
    title: const Text('Select Category'),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[

        ListTile(
          leading: Image.asset(
            'assets/images/devices.webp',
            width: 30,
          ),
          title: const Text('الكمبيوتر والتابلت',style: style,),
          onTap: () {
            selectedCategory = "TL";
            onTap(selectedCategory,"الكمبيوتر والتابلت");
            Navigator.of(context).pop();
          },
        ),ListTile(
          leading: Image.asset(
            'assets/images/iphone.webp',
            width: 30,
          ),
          title: const Text('الهواتف الذكية',style: style,),
          onTap: () {
            selectedCategory = "SP";
            onTap(selectedCategory,"الهواتف الذكية");
            Navigator.of(context).pop();
          },
        ),ListTile(
          leading: Image.asset(
            'assets/images/devices_3.webp',
            width: 30,
          ),
          title: const Text(
            'مستلزمات الأجهزة'
          ,style: style,),
          onTap: () {
            selectedCategory = "AC";
            onTap(selectedCategory,"مستلزمات الأجهزة");
            Navigator.of(context).pop();
          },
        ),

      ],
    ),
  );
}
