//
// import 'package:application/controllers/account.dart';
// import 'package:application/controllers/medical.dart';
// import 'package:application/views/shared/button.dart';
// import 'package:application/views/shared/header_card.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../shared/data_item.dart';
//
// class MedicalBillView extends StatelessWidget {
//   const MedicalBillView({super.key});
//
//   final titleStyle = const TextStyle(
//     color: Colors.white,
//     fontSize: 12,
//     fontFamily: 'Tajawal',
//     fontWeight: FontWeight.bold,
//   );
//   final valueStyle = const TextStyle(
//     color: Colors.black54,
//     fontSize: 14,
//     fontFamily: 'Tajawal',
//     fontWeight: FontWeight.bold,
//   );
//
//   @override
//   Widget build(BuildContext context) {
//     String expireData = DateTime.now().add(const Duration(days: 60)).toString();
//     return Scaffold(
//         appBar: AppBar(
//             title: const Text(
//               "فاتورة طلب الطالب",
//               style: TextStyle(
//                 fontFamily: 'Tajawal',
//                 fontSize: 16,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//               ),
//             ),
//             backgroundColor: Get.theme.primaryColor,
//             iconTheme: const IconThemeData(
//               color: Colors.white,
//             )),
//         body: Center(
//             child: FutureBuilder(
//                 future: AccountController.instance.getAccount(),
//                 builder: (context, snapshot) {
//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     return const Center(
//                       child: CircularProgressIndicator(),
//                     );
//                   }
//                   return ListView.builder(itemBuilder:
//                       (BuildContext context, int index) {}, itemCount: 1);
//                 }
//
//             )
//         )
//     );
//   }
// }
