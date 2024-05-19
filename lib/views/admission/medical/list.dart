import 'package:application/controllers/account.dart';
import 'package:application/controllers/medical.dart';
import 'package:application/views/admission/consulting/add.dart';
import 'package:application/views/admission/medical/bill.dart';
import 'package:application/views/services/medicine/bill.dart';
import 'package:application/views/shared/button.dart';
import 'package:application/views/shared/header_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../shared/data_item.dart';

class MedicalApplicationsView extends StatelessWidget {
   MedicalApplicationsView({super.key});

   TextStyle titleStyle =  TextStyle(
    color: Get.theme.primaryColor,
    fontSize: 12,
    fontFamily: 'Tajawal',
    fontWeight: FontWeight.bold,
  );
  final valueStyle = const TextStyle(
    color: Colors.black54,
    fontSize: 14,
    fontFamily: 'Tajawal',
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    String expireData = DateTime.now().add(const Duration(days: 60)).toString();
    return Scaffold(
      floatingActionButton: Visibility(
        visible: GetStorage().read('account_type') == 'admission',
        child: FloatingActionButton(
          onPressed: () {
            Get.to(() => const AddConsultantView());
          },
          backgroundColor: Get.theme.primaryColor,
          child: const Icon(Icons.add, color: Colors.white),
        ),
      ),
      appBar: AppBar(
          title: const Text(
            "طلبات الطلاب",
            style: TextStyle(
              fontFamily: 'Tajawal',
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          backgroundColor: Get.theme.primaryColor,
          iconTheme: const IconThemeData(
            color: Colors.white,
          )),
      body: FutureBuilder(
        future: MedicalController.instance.getApplications(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        else if (snapshot.connectionState == ConnectionState.done) {
          return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 100,
                  child: Card(

                    child: Center(
                      child: ListTile(
                        onTap: () {
                          Get.to(() => const AdmissionMedicalBillView(), arguments: {
                            'hospital':snapshot.data![index]['offer']['partner'],
                            'service': snapshot.data![index]['offer']['title'],
                            'discount': snapshot.data![index]['offer']['discount'],
                            'offer_id': snapshot.data![index]['offer']['offer_id'],
                            'name': snapshot.data![index]['profile']['full_name'],
                            'collage': snapshot.data![index]['profile']['collage'],
                            'specialization': snapshot.data![index]['profile']['specialization'],
                          });
                        },
                        leading: const Icon(Icons.list_alt_sharp, color: Colors.blue, size: 40,),
                        title: Text(
                            snapshot.data![index]['profile']['full_name'],
                          style: TextStyle(
                            color:Get.theme.primaryColor,
                            fontSize: 18,
                            fontFamily: 'Tajawal',
                            fontWeight: FontWeight.bold,
                          )
                        ),
                        subtitle: Row(
                          children: [
                            Text(
                              snapshot.data![index]['offer']['partner'],
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontFamily: 'Tajawal',
                                fontWeight: FontWeight.bold,
                              )
                            ),
                            SizedBox(width: 10,),
                            Text(
                              snapshot.data![index]['offer']['title'],
                              style: valueStyle,
                            ),
                          ],
                        ),

                      ),
                    ),
                  ),
                );
              },
              itemCount: snapshot.data!.length,);
        }
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
        },
      ),
    );
  }
}
