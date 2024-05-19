import 'package:flutter/material.dart';

class HeaderCard extends StatelessWidget {
  const HeaderCard({
    super.key,
    this.textAlign = TextAlign.center,
    this.textStyle = const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      fontFamily: 'Tajawal',
      color: Color(0xFF9E773A),
    ),
    required this.title,
    this.width = 200,
    this.height = 80,
    this.padding = const EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
  });

  final TextAlign textAlign;
  final TextStyle textStyle;
  final double width;
  final double height;
  final String title;
  final EdgeInsets padding ;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: padding,
      // vertical

      height: height,
      margin: const EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFEFE),
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: const Color(0xFF9E773A),
          width: 1.5,
        ),
      ),

      child:

      Center(
        child: Text(
          title,
          style: textStyle,
          textAlign: textAlign,
        )
      )

    );
  }
}
