import 'package:application/controllers/supplier.dart';
import 'package:application/views/shared/delivery_request_card.dart';
import 'package:application/views/suppliers/application.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeliveryRequestListView extends StatelessWidget {
  const DeliveryRequestListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'طلبات التوصيل',
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
        )
      ),
      body: Center(
        child: FutureBuilder(
          future: SupplierController.instance.listDeliveryOrders(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CupertinoActivityIndicator();
            }
            return ListView.builder(
              itemCount: snapshot.data!.length ,
              itemBuilder: (context, index) {
                return DeliveryRequestCard(
                  onTap: () {
                    Get.to(
                      () => ApplicationInfoView(
                        deliveryRequest: snapshot.data![index],
                      ),
                    );
                  },
                  name: snapshot.data![index].name,
                  product: snapshot.data![index].productName,
                );
              },
            ).paddingOnly(top: 20);
          },
        ),
      ),
    );
  }
}
