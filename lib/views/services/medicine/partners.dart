import 'package:application/controllers/medical.dart';
import 'package:application/models/medical.dart';
import 'package:application/views/admission/consulting/add.dart';
import 'package:application/views/admission/medical/add.dart';
import 'package:application/views/services/medicine/details.dart';
import 'package:application/views/shared/category_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

// our partners view
class PartnersListView extends StatefulWidget {
  const PartnersListView({super.key});

  @override
  State<PartnersListView> createState() => _PartnersListViewState();
}

class _PartnersListViewState extends State<PartnersListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Visibility(
        visible: GetStorage().read('account_type') == 'admission',
        child: FloatingActionButton(
          onPressed: () {
            Get.to(()=>const AddMedicalPartnerView());
          },
          backgroundColor: Get.theme.primaryColor,
          child: const Icon(Icons.add, color: Colors.white),
        ),

      ),
      appBar: AppBar(
        title: const Text(
          " شركاؤنا الطبيين",
          style: TextStyle(
            fontFamily: 'Tajawal',
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Get.theme.primaryColor,
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: FutureBuilder<List<Medical>>(
          future: MedicalController.instance.getMedicalPartners(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.connectionState == ConnectionState.done) {
              return SingleChildScrollView(
                child: Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 20,
                  runSpacing: 20,
                  children: [
                    for (var item in snapshot.data!)
                      HospitalCard(
                        size: 180,
                        // height: 250,
                        name: item.name,
                        onTap: () {
                          Get.to(() => PartnerDetails(
                                medical: item,
                              ));
                          // Get.to(() =>  PartnerDetails1());
                        },
                        image: item.logo != null ? item.logo! : '',
                      ),
                  ],
                ).paddingOnly(top: 30, left: 5, right: 5),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
