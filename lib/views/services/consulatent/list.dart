import 'package:application/controllers/consulting.dart';
import 'package:application/core/consultant.dart';
import 'package:application/views/admission/consulting/add.dart';
import 'package:application/views/services/consulatent/details.dart';
import 'package:application/views/services/consulatent/my_booking.dart';
import 'package:application/views/shared/consultant_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ConsultantsListView extends StatefulWidget {
  const ConsultantsListView({super.key});

  @override
  State<ConsultantsListView> createState() => _ConsultantsListViewState();
}

class _ConsultantsListViewState extends State<ConsultantsListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Visibility(
        visible: GetStorage().read('account_type') == 'admission',
        child: FloatingActionButton(
          onPressed: () {
            Get.to(()=>const AddConsultantView());
          },
          backgroundColor: Get.theme.primaryColor,
          child: const Icon(Icons.add, color: Colors.white),
        ),

      ),
        appBar: AppBar(
          actions: [
            IconButton(
              icon: const Icon(Icons.menu_book,size: 30,),
              onPressed: () async {


                Get.to(()=>const MyBookedView() );
              },
            ),
          ],
            iconTheme: const IconThemeData(color: Colors.white),
            title: const Text(
              "الاستشاريين",
              style: TextStyle(
                fontFamily: 'Tajawal',
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            backgroundColor: Get.theme.primaryColor),
        body: SingleChildScrollView(
          child: FutureBuilder<List<ConsultantModel>>(
              future: ConsultingController.instance.list(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    return const Center(
                      child: Text(
                        'حدث خطأ ما',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Tajawal',
                        ),
                      ),
                    );
                  }
                }
                return Wrap(
                  spacing: 10,
                  verticalDirection: VerticalDirection.down,
                  alignment: WrapAlignment.center,
                  runSpacing: 10,
                  children: [
                    SizedBox(
                      width: Get.width,
                      height: 60,
                    ),
                    for (var consultant in snapshot.data!)
                      ConsultantCard(
                        consultant: consultant,
                        onTap: () {
                          Get.to(()=>ConsultantDetailsView(consultant: consultant));
                        },
                      ),
                  ],
                );
              }),
        ));
  }
}
