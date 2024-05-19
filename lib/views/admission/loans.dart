import 'package:application/controllers/loans.dart';
import 'package:application/views/admission/widgets/loan_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

class LoansListView extends StatefulWidget {
  const LoansListView({super.key});

  @override
  State<LoansListView> createState() => _LoansListViewState();
}

class _LoansListViewState extends State<LoansListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'طلبات القروض',
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
            width: MediaQuery.of(context).size.width - 20,
            height: MediaQuery.of(context).size.height*0.8,
            child: FutureBuilder<List<Map<String, dynamic>>>(
                future: LoansController.instance.list(),
                builder: (context, snapshot) {
                  return ListView.builder(
                    itemCount: snapshot.data != null ? snapshot.data!.length : 0,
                    itemBuilder: (BuildContext context, int index) {
                      return LoanCard(
                        name: snapshot.data![index]['user'],
                        applicationDate: snapshot.data![index]['apply_date'],
                        onAccept: () async {
                          await LoansController.instance
                              .accept(id: snapshot.data![index]['id']);
                          setState(() {

                          });
                        },
                        isAccept:
                            snapshot.data![index]['status'] == 'true' ? true : false,
                      );
                    },
                  );
                }),
          ),
        ],
      ),
    );
  }
}
