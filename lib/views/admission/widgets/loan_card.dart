import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LoanCard extends StatelessWidget {
  const LoanCard({
    super.key,
    required this.name,
    required this.applicationDate,
    this.isAccept = false,
    this.onAccept,
    this.onReject,
  });

  final String name;

  final String applicationDate;
  final bool isAccept;
  final VoidCallback? onReject;

  final VoidCallback? onAccept;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width ,
      alignment: Alignment.center,
      height: 100,
      margin: const EdgeInsets.only(
        left: 0,
        right: 0,
        top: 4,
      ),
      padding:
          const EdgeInsets.only(top: 20, bottom: 20, left: 6, right: 6),
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
      child: Center(
        child: Row(
          children: [
            const CircleAvatar(
              radius: 30,
              child: Image(
                image: AssetImage(
                  'assets/icons/avatar.png',
                ),
              ),
            ),

            SizedBox(
              width: (Get.width-32) * 0.5,
              child: Column(
                children: [
                  SizedBox(
                    width:(Get.width-32) * 0.5,
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
                    width: (Get.width-32) * 0.5,
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
            ),
            Spacer(),

            SizedBox(
              width: (Get.width-32) * 0.3,
              child: Row(

                children: [
                  Visibility(
                    visible: isAccept,
                    child: const Icon(
                      Icons.check_circle_rounded,
                      color: Colors.green,
                      size: 30,
                    ),
                  ),
                  Visibility(
                    visible: !isAccept,
                    child: SizedBox(
                      width: 44,
                      child: IconButton(
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(
                            const EdgeInsets.all(2),
                          ),
                        ),
                        icon: const Icon(
                          Icons.check_circle_rounded,
                          color: Colors.green,
                          size: 30,
                        ),
                        onPressed: onAccept,
                      ),
                    ),
                  ),
                  Visibility(
                    visible: !isAccept,
                    child: Center(
                      child: IconButton(
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(
                            const EdgeInsets.all(2),
                          ),
                        ),
                        icon: const Icon(
                          Icons.cancel_rounded,
                          color: Colors.red,
                          size: 30,
                        ),
                        onPressed: () {
                          if (onReject != null) {
                            onReject!();
                          }
                        },
                      ),
                    ),
                  ).paddingOnly(),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
