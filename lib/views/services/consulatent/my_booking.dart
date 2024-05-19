import 'package:application/controllers/consulting.dart';
import 'package:application/core/consultant.dart';
import 'package:application/views/services/consulatent/ticket_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyBookedView extends StatefulWidget {
  const MyBookedView({super.key});

  @override
  State<MyBookedView> createState() => _MyBookedViewState();
}

class _MyBookedViewState extends State<MyBookedView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "حجوزاتي",
          style: TextStyle(
            fontFamily: 'Tajawal',
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Get.theme.primaryColor,
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: ConsultingController.instance.my(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  onTap: () {
                    Get.to(() => TicketDetails(
                      ticketDetails: {
                        'booked_for': snapshot.data![index]['booked_for'],
                        'date': snapshot.data![index]['date'],
                        'time': snapshot.data![index]['time'],
                        'ticket_id': snapshot.data![index]['ticket_id'],
                      },
                    ), );
                  },
                  title: Text(
                      'الحجز مع  ${snapshot.data![index]['booked_for']} ',
                      style: const TextStyle(
                          fontFamily: 'Tajawal',
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                  subtitle: Row(
                    children: [
                      const Text('التاريخ:',
                          style: TextStyle(
                              fontFamily: 'Tajawal',
                              fontSize: 14,
                              fontWeight: FontWeight.bold)),
                      Text(snapshot.data![index]['date']),
                      const SizedBox(width: 10),
                      const Text('الوقت:',
                          style: TextStyle(
                              fontFamily: 'Tajawal',
                              fontSize: 14,
                              fontWeight: FontWeight.bold)),
                      Text(snapshot.data![index]['time']),

                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
