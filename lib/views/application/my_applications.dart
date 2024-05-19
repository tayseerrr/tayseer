import 'package:application/controllers/applications.dart';
import 'package:application/controllers/loans.dart';
import 'package:application/views/admission/widgets/loan_card.dart';
import 'package:application/views/application/widgets/installment_card.dart';
import 'package:application/views/application/widgets/loan_card.dart';
import 'package:application/views/products/bill.dart';
import 'package:application/views/shared/bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

class MyApplicationsView extends StatefulWidget {
  const MyApplicationsView({super.key});

  @override
  State<MyApplicationsView> createState() => _MyApplicationsViewState();
}

class _MyApplicationsViewState extends State<MyApplicationsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(


      appBar: AppBar(
        title: const Text(
          'طلباتي',
          style: TextStyle(
            fontFamily: 'Tajawal',
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        leading: const SizedBox(),
        backgroundColor: Theme.of(context).primaryColor,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Column(
        children: [

          SizedBox(
            width: MediaQuery.of(context).size.width - 20,
            height: MediaQuery.of(context).size.height * 0.7,
            child: FutureBuilder<Map<String, dynamic>>(
              future: ApplicationsController.instance.myApplication(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CupertinoActivityIndicator();
                }
                if (snapshot.data == null ) {
                  return const Center(
                    child: Text('لا يوجد طلبات', style: TextStyle(
                      fontFamily: 'Tajawal',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,

                    ),),
                  );
                }


                // snapshot.data!['loan']
                if (snapshot.data!['loan'] == null && snapshot.data!['order'] == null) {
                  return const Center(
                    child: Text('لا يوجد طلبات', style: TextStyle(
                      fontFamily: 'Tajawal',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent,

                    ),),
                  );
                }
                return Column(
                  children: [
                    // apply_date
                    if (snapshot.data!['loan'] != null )
                    MyLoanCard(
                      name: snapshot.data!['loan']['amount'],
                      applicationDate: snapshot.data!['loan']['apply_date'],
                      isAccepted: snapshot.data!['loan']['status'],
                    ),
                    if (snapshot.data!['order'] != null )
                    MyInstallmentCard(
                      name: snapshot.data!['order']['product_name'],
                      applicationDate: snapshot.data!['order']['order_date']
                          .toString()
                          .substring(0, 16)
                          .replaceAll('T', ' '),
                      status: snapshot.data!['order']['status'],
                      issueBill: () async {
                        Get.to(
                          () => BillView( ),arguments: snapshot.data!['order'],);

                      }
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
