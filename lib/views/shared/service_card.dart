import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextServiceCard extends StatelessWidget {
  const TextServiceCard({super.key, required this.text,
    this.width = 120,
    this.height = 200,
  });

  final String text;
  final double width;
  final double height;


  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: const Color(0xffCDE7EB),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: 'Tajawal',
            color: Get.theme.primaryColor,
          ),

        ),
      ),
    );
  }
}
class ServiceCard extends StatelessWidget {
  const ServiceCard({super.key, required this.child,this.width = 110,

    this.height = 200,
    this.margin = const EdgeInsets.all(0),
    this.borderRadius = const BorderRadius.all(Radius.circular(10)),
    this.onTap,
    this.showBorder = false,
  });

  final Widget child;
  final double width;
  final double height;
  final EdgeInsetsGeometry margin ;
  final BorderRadiusGeometry borderRadius ;
  final Function()? onTap;
  final bool showBorder ;



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        margin: margin,
        decoration: BoxDecoration(
          color: const Color(0xffCDE7EB),
          borderRadius: borderRadius,
          border: showBorder?Border.all(
            color: Get.theme.primaryColor,
            width: 2,
          ):null,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: child,
      ),
    );
  }
}
