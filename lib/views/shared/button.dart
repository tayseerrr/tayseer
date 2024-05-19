import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.text,
    this.onPressed,
    this.width = 250,
    this.height = 40,
    this.mainColor = const Color(0xFF006972),
    this.textStyle = const TextStyle(
      color: Colors.white,
      fontSize: 14,
      fontWeight: FontWeight.bold,
      fontFamily: 'Tajawal',
    ),
  });

  final String text;
  final VoidCallback? onPressed;
  final double width;

  final double height;
  final Color mainColor ;
final TextStyle textStyle ;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: mainColor,
            padding: const EdgeInsets.only(left: 30, right: 30),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            elevation: 3),
        onPressed: onPressed,
        child: Text(
          text,
          style: textStyle
        ),
      ),
    );
  }
}
class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.child,
    this.onPressed,
    this.width = 280,
    this.height = 40,
    this.mainColor = const Color(0xFF006972),

  });

  final Widget child;
  final VoidCallback? onPressed;
  final double width;

  final double height;
  final Color mainColor ;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: mainColor,
            padding: const EdgeInsets.only(left: 30, right: 30),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            elevation: 3),
        onPressed: onPressed,
        child:child,
      ),
    );
  }
}
