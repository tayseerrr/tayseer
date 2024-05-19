import 'package:flutter/material.dart';

class DataItem extends StatelessWidget {
  const DataItem({
    super.key,
    this.width = 200,
    this.height = 40,
    this.valueWidth = 100,
    this.titleWidth = 100,
    this.mainColor = const Color(0xFF00A3BA),
    this.title = 'الإسم',
    this.margin = const EdgeInsets.all(5  ),
    this.value = 'القيمة',
    this.valueStyle = const TextStyle(
      color: Color(0xFF00A3BA),
      fontSize: 16,
      fontFamily: 'Tajawal',
      fontWeight: FontWeight.w500,
    ),
    this.titleStyle = const TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontFamily: 'Tajawal',
      fontWeight: FontWeight.bold,
    ),
  });

  final double width;
  final double valueWidth;
  final double titleWidth;
  final EdgeInsetsGeometry margin;


  final double height;

  final Color mainColor;

  final String title;

  final String value;
  final TextStyle valueStyle;

  final TextStyle titleStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.all(0),
      margin: margin,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: mainColor,
          width: 1,
        ),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.grey.withOpacity(0.5),
        //     spreadRadius: 5,
        //     blurRadius: 7,
        //     offset: const Offset(0, 3), // changes position of shadow
        //   ),
        // ],
      ),
      child: Row(
        children: [
          Container(
            width: titleWidth,
            padding: const EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              color: mainColor,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(4),
                bottomRight: Radius.circular(4),
              ),
            ),
            child: Center(
              child: Text(
                title,
                style: titleStyle,
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(left: 5, right: 5),
              width: valueWidth ,

              // width: 50,
              decoration: BoxDecoration(
                // color: Colors.green,

                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: Text(
                  value,
                  style: valueStyle,
                ),
              ),
            ),
          ),
        ],
      ),

    );
  }
}
