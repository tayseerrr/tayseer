import 'package:application/views/shared/data_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class TicketDetails extends StatelessWidget {
  TicketDetails({super.key, required this.ticketDetails});

  Map<String, dynamic> ticketDetails = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'تفاصيل الحجز',
          style: TextStyle(
            fontFamily: 'Tajawal',
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Get.theme.primaryColor,
      ),
      body: Center(
        child: Column(
          children: [
            DataItem(
              title: 'الحجز مع',
              value: ticketDetails['booked_for'],
              width: Get.width * 0.75,
            ).paddingOnly(top: 100),
            DataItem(
              title: 'التاريخ',
              value: ticketDetails['date'],
              width: Get.width * 0.75,
            ),
            DataItem(
              title: 'الوقت',
              value: ticketDetails['time'],
              width: Get.width * 0.75,
            ),

            const SizedBox(
              height: 100,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Get.theme.primaryColor,
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              onPressed: () {

                final Uri emailLaunchUri = Uri(
                  scheme: 'https',
                  path: 'https://www.webex.com',

                );

                launchUrl(emailLaunchUri);
              },
              child: const Text(
                'الدخول للجلسة',
                style: TextStyle(
                  fontFamily: 'Tajawal',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            SizedBox(
              width: Get.width * 0.9,
              child: const Text("ملاحظة:",
                  style: TextStyle(
                      fontFamily: 'Tajawal',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.red)),
            ),
            SizedBox(
              width: Get.width * 0.9,
              child: const Text("سوف تحتاج تثبيت Webex للدخول للجلسة",
                  style: TextStyle(
                      fontFamily: 'Tajawal',
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ),
            // DataItem(
            //   title: 'رقم الحجز',
            //   value: ticketDetails['ticket_id'],
            // ),
          ],
        ),
      ),
    );
  }
}
