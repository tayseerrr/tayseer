import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    this.onTap,
    this.size = 200,
    this.height,
    this.borderColor = const Color(0xFF00A3BA),
    this.image = const AssetImage('assets/images/medicine.png'),
    this.titleStyle = const TextStyle(
      color: Color(0xFF00A3BA),
      fontSize: 16,
      fontWeight: FontWeight.bold,
      fontFamily: 'Tajawal',
    ),
    required this.title,
    this.subtitle,
    this.subtitleStyle = const TextStyle(
      color: Color(0xFF00A3BA),
      fontSize: 18,
      fontWeight: FontWeight.w500,
      fontFamily: 'Tajawal',
    ),
  });

  final Color borderColor;

  final ImageProvider image;

  final double size;
  final double? height;
  final TextStyle titleStyle;
  final TextStyle subtitleStyle;
  final String title;

  final String? subtitle;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: borderColor,
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(
                0,
                2,
              ), // changes position of shadow
            ),
          ],
        ),
        width: size,
        height: height ?? size + 20,
        child: Column(
          children: [
            Container(
              width: size * 0.7,
              height: size * 0.7,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              title,
              style: titleStyle,
              textAlign: TextAlign.center,
            ).paddingOnly(top: 10),

          ],
        ),
      ),
    );
  }
}
class HospitalCard extends StatelessWidget {


  const HospitalCard({
    super.key,
    this.onTap,
    this.size = 200,
    this.height,
    this.borderColor = const Color(0xFF00A3BA),
    this.image = 'assets/images/medicine.png',
    this.nameStyle = const TextStyle(
      color: Color(0xFF00A3BA),
      fontSize: 16,
      fontWeight: FontWeight.bold,
      fontFamily: 'Tajawal',
    ),
    required this.name,

  });

  final Color borderColor;

  final String image;

  final double size;
  final double? height;
  final TextStyle nameStyle;
  final String name;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: borderColor,
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(
                0,
                2,
              ), // changes position of shadow
            ),
          ],
        ),
        width: size,
        height: height ?? size + 20,
        child: Column(
          children: [
            Container(
              width: size * 0.7,
              height: size * 0.7,
              decoration: BoxDecoration(
                image:

                (image.isNotEmpty && image.startsWith('http'))?  DecorationImage(
                  image: NetworkImage(image),
                  fit: BoxFit.contain,
                ):
                const DecorationImage(
                  image: AssetImage('assets/images/medicine.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              name,
              style: nameStyle,
              textAlign: TextAlign.center,
            ).paddingOnly(top: 10),

          ],
        ),
      ),
    );
  }
}