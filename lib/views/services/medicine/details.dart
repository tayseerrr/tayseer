import 'package:application/models/medical.dart';
import 'package:application/views/services/medicine/bill.dart';
import 'package:application/views/shared/service_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PartnerDetails extends StatelessWidget {
  const PartnerDetails({super.key, required this.medical});

  final Medical medical;

  final TextStyle servicesStyle = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    fontFamily: 'Tajawal',
    color: Color(4278217074),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "تفاصيل شريكنا الطبي",
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
            Text(
              medical.name,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Tajawal',
                color: Get.theme.primaryColor,
              ),
            ).paddingOnly(top: 30, bottom: 10),
            Row(
              children: [
                if (medical.logo != null && medical.logo!.isNotEmpty)
                  Image.network(
                    medical.logo!,
                    width: Get.width * .4,
                    height: Get.width * .4,
                  )
                else
                  Image(
                      image: const AssetImage('assets/images/medicine.png'),
                      width: Get.width * .4,
                      height: Get.width * .4),
                Container(
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    padding: const EdgeInsets.only(top: 15, bottom: 15),
                    decoration: BoxDecoration(
                      color: Get.theme.primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: SizedBox(
                      width: Get.width * .5,
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: medical.description,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                fontFamily: 'Tajawal',
                                color: Colors.white,
                              ),
                            ),
                            const TextSpan(
                              text: '\n\nالفروع: ',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Tajawal',
                                color: Colors.white,
                              ),
                            ),
                            TextSpan(
                              text: medical.branches,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Tajawal',
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ).paddingOnly(top: 10, bottom: 10, left: 10, right: 10),
                    )),
              ],
            ).paddingOnly(),
            SizedBox(
              width: Get.width * .85,
              child: Text(
                "الخدمات",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Tajawal',
                  color: Get.theme.primaryColor,
                ),
              ).paddingOnly(left: 20, top: 50),
            ),
            SizedBox(
              height: 200,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                 for (var offer in medical.offers!)
                    ServiceCard(
                      onTap: () {
                        Get.to(() => const MedicalBillView(), arguments: {
                          'hospital': medical.name,
                          'service': offer.title,
                          'discount': '${offer.discount}',
                          'offer_id': offer.offerId,
                        });
                      },
                      width: 80,
                      height: 150,
                      child: Center(
                        child: Text(
                          '${offer.title} '
                          '\n'
                              '%${offer.discount}',
                          style: servicesStyle,
                          softWrap: true,
                          textAlign: TextAlign.center,
                        ).paddingOnly(top: 10, left: 3, right: 3),
                      ),
                    ).paddingOnly(left: 10, right: 10, bottom: 10),
                  // ServiceCard(
                  //   onTap: () {
                  //     Get.to(() => const MedicalBillView(), arguments: {
                  //       'hospital': 'مستشفى الالماني',
                  //       'service': 'عمليات تقويم الأسنان',
                  //     });
                  //   },
                  //   width: 80,
                  //   height: 150,
                  //   child: Center(
                  //     child: Text(
                  //       'تقويم الأسنان %20',
                  //       style: servicesStyle,
                  //       softWrap: true,
                  //       textAlign: TextAlign.center,
                  //     ).paddingOnly(top: 10, left: 3, right: 3),
                  //   ),
                  // ).paddingOnly(left: 10, right: 10, bottom: 10),
                  // ServiceCard(
                  //   onTap: () {
                  //     Get.to(() => const MedicalBillView(), arguments: {
                  //       'hospital': 'مستشفى الالماني',
                  //       'service': 'عمليات التجميل',
                  //     });
                  //   },
                  //   width: 80,
                  //   height: 150,
                  //   child: Center(
                  //     child: Text(
                  //       'ولادة طبيعية %20',
                  //       style: servicesStyle,
                  //       softWrap: true,
                  //       textAlign: TextAlign.center,
                  //     ).paddingOnly(top: 10, left: 3, right: 3),
                  //   ),
                  // ).paddingOnly(left: 10, right: 10, bottom: 10),
                  // ServiceCard(
                  //   onTap: () {
                  //     Get.to(() => const MedicalBillView(), arguments: {
                  //       'hospital': 'مستشفى الالماني',
                  //       'service': 'جراحات السمنة',
                  //     });
                  //   },
                  //   width: 80,
                  //   height: 150,
                  //   child: Center(
                  //     child: Text(
                  //       'جراحات السمنة %20',
                  //       style: servicesStyle,
                  //       softWrap: true,
                  //       textAlign: TextAlign.center,
                  //     ).paddingOnly(top: 10, left: 3, right: 3),
                  //   ),
                  // ).paddingOnly(left: 10, right: 10, bottom: 10),
                  // ServiceCard(
                  //   onTap: () {
                  //     Get.to(() => const MedicalBillView(), arguments: {
                  //       'hospital': 'مستشفى الالماني',
                  //       'service': 'الطب النفسي',
                  //     });
                  //   },
                  //   width: 80,
                  //   height: 150,
                  //   child: Center(
                  //     child: Text(
                  //       'الطب النفسي %20',
                  //       style: servicesStyle,
                  //       softWrap: true,
                  //       textAlign: TextAlign.center,
                  //     ).paddingOnly(top: 10, left: 3, right: 3),
                  //   ),
                  // ).paddingOnly(left: 10, right: 10, bottom: 10),
                ],
              ).paddingOnly(top: 20, left: 20, right: 20, bottom: 50),
            ),
            // Button(
            //   text: 'طلب',
            //   onPressed: () {},
            // ).paddingOnly(bottom: 10),
          ],
        ),
      ),
    );
  }
}
