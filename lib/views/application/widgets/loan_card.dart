import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyLoanCard extends StatelessWidget {
  const MyLoanCard({
    super.key,
    required this.name,
    required this.applicationDate,
    this.isAccepted = false,



  });

  final String name;

  final String applicationDate;
  final bool isAccepted;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Container(
        margin: const EdgeInsets.only(
          left: 10,
          right: 10,
          top: 4,
        ),
        padding:
            const EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.5),
          color: const Color(
            0xFF515E7D,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            const CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 30,
              child: Image(

                image: AssetImage('assets/images/loan.webp'),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              children: [
                SizedBox(
                  width: 200,
                  child: Text(
                    name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'Tajawal',
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 200,
                  child: Text(
                    applicationDate,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'Tajawal',
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Visibility(
              visible:isAccepted,
              child: const Icon(
                Icons.check_circle_rounded,
                color: Colors.green,
                size: 42,
              ),
            ),
            Visibility(
              visible: !isAccepted,
              child: const Icon(
                Icons.hourglass_bottom,
                color: Color(0xFF02E5E5),
                size: 42,
              ),
            ),


          ],
        ),
      ),
    );
  }
}
