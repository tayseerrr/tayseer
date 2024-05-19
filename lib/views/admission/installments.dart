import 'package:application/controllers/installment.dart';
import 'package:application/controllers/loans.dart';
import 'package:application/views/admission/widgets/loan_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

class InstallmentListView extends StatefulWidget {
  const InstallmentListView({super.key});

  @override
  State<InstallmentListView> createState() => _InstallmentListViewState();
}

class _InstallmentListViewState extends State<InstallmentListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'طلبات التقسيط',
          style: TextStyle(
            fontFamily: 'Tajawal',
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Column(

        children: [
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width-10,
            height: MediaQuery.of(context).size.height*0.8,
            child: Center(
              child: FutureBuilder<List<Map<String, dynamic>>>(
                  future: InstallmentController.instance.list(),
                  builder: (context, snapshot) {
                    return ListView.builder(
                      itemCount: snapshot.data != null ? snapshot.data!.length : 0,
                      itemBuilder: (BuildContext context, int index) {
                        return Center(
                          child: LoanCard(
                            name: snapshot.data![index]['name'],
                            applicationDate: snapshot.data![index]['apply_date'],
                            onAccept: () async {
                              await InstallmentController.instance
                                  .accept(id: snapshot.data![index]['id'],
                                status:'A'
                              );
                              setState(() {

                              });
                            },
                            onReject: () async {
                              await InstallmentController.instance
                                  .accept(id: snapshot.data![index]['id'],
                                status:'R'
                              );
                              setState(() {

                              });
                            },
                            isAccept:
                            snapshot.data![index]['status'] == 'true' ? true : false,
                          ),
                        );
                      },
                    );
                  }).paddingOnly(left: 10, ),
            ),
          ),
        ],
      ),
    );
  }
}
