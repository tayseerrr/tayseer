import 'package:flutter/material.dart';

AlertDialog showBrands(
    BuildContext context, Function(String? text,String? value) onTap) {
  String selectedCategory = "";
  const style = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    fontFamily: 'Tajawal',
    color: Colors.black,
  );
  return AlertDialog(
    //  MARKS = (
    //         ('AP', 'Apple'),
    //         ('HW', 'Huawei'),
    //         ('AD', 'Android'),
    //     )
    // Image.asset(
    //                             'assets/images/android.webp',
    //                             width: 70,
    //                           ).paddingOnly(bottom: 10),
    //                           Text(
    //                             'ANDROID',
    //                             style: TextStyle(
    //                               fontSize: 18,
    //                               fontWeight: FontWeight.bold,
    //                               fontFamily: 'Tajawal',
    //                               color: Get.theme.primaryColor,
    //                             ),
    title: const Text('إختر العلامة التجارية',style: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      fontFamily: 'Tajawal',
      color: Colors.black,
    )),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[

        ListTile(
          leading: Image.asset(
           'assets/images/huawei.png',
            width: 30,
          ),
          title: const Text('HUAWEI',style: style,),
          onTap: () {
            selectedCategory = "HW";
            onTap(selectedCategory,"HUAWEI");
            Navigator.of(context).pop();
          },
        ),
        ListTile(
          leading: Image.asset(
            'assets/images/android.webp',
            width: 30,
          ),
          title: const Text('ANDROID',style: style,),
          onTap: () {
            selectedCategory = "AD";
            onTap(selectedCategory,"ANDROID");
            Navigator.of(context).pop();
          },
        ),ListTile(
          leading: Image.asset(
            'assets/images/apple.png',
            width: 30,
          ),
          title: const Text(
            'APPLE'
          ,style: style,),
          onTap: () {
            selectedCategory = "AP";
            onTap(selectedCategory,"APPLE");
            Navigator.of(context).pop();
          },
        ),

      ],
    ),
  );
}
