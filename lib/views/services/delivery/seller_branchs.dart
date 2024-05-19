import 'package:application/controllers/branches.dart';
import 'package:application/controllers/location.dart';
import 'package:application/controllers/products.dart';
import 'package:application/views/shared/button.dart';
import 'package:application/views/shared/header_card.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SellerBranchView extends StatefulWidget {
  const SellerBranchView({super.key});

  @override
  State<SellerBranchView> createState() => _SellerBranchViewState();
}

class _SellerBranchViewState extends State<SellerBranchView> {
  GoogleMapController? mapController; // Controller for Google map
  Set<Marker> markers = {}; // Markers for Google map
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  void initState() {
    super.initState();

    // "21.330209732055664,39.95214080810547"
    WidgetsBinding.instance!.addPostFrameCallback(
      (timeStamp) async {
        Position locData = await LocationController.instance.getLocation();

        markers.add(
          Marker(
            markerId: const MarkerId('id-1'),
            icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueGreen),
            position: LatLng(locData.latitude, locData.longitude),
            infoWindow: const InfoWindow(
              title: 'موقعي الحالي',
              snippet: 'معرض البيع',
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          " طريقة التسيلم",
          style: TextStyle(
            fontFamily: 'Tajawal',
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Get.theme.primaryColor,
      ),
      body: Center(
        child: Column(
          children: [
            const HeaderCard(
              title: 'طريقة تسيلم المنتج',
              height: 60,
              width: 300,
              textStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                fontFamily: 'Tajawal',
                color: Color(0xFF9E773A),
              ),
            ).paddingOnly(top: 40, bottom: 70),
            SizedBox(
              height: Get.height * 0.5,
              child: FutureBuilder<List<dynamic>>(
                future: BranchesController.instance.getBranches(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.hasError) {
                    return const Center(
                      child: Text('Error'),
                    );
                  }

                  for (var i = 0; i < snapshot.data!.length; i++) {
                    markers.add(
                      Marker(
                        markerId: MarkerId('id-$i'),
                        position: LatLng(
                          snapshot.data![i]['location']['lat'],
                          snapshot.data![i]['location']['lng'],
                        ),
                        infoWindow: InfoWindow(
                          title: snapshot.data![i]['name'] +
                              " \n" +
                              snapshot.data![i]['distance'],
                          snippet: snapshot.data![i]['address'],
                          onTap: () {
                            //
                          },
                        ),
                      ),
                    );
                  }

                  return GoogleMap(
                    onMapCreated: _onMapCreated,

                    initialCameraPosition: CameraPosition(
                      // 39.952141
                      target: markers.first.position,
                      zoom: 8.0,
                      //   allow ui gesture
                    ),
                    zoomControlsEnabled: true,
                    zoomGesturesEnabled: true,
                    markers: markers,
                    //   handle when click button of my location
                  );
                },
              ),
            ),
            Button(
              text: 'رفع الطلب',
              onPressed: () async {
                // Get.to(() => const SellerBranchView());
                GetStorage box = GetStorage();
                String billId = await box.read('bill_id');
                await ProductsController.instance
                    .setDelivery( billId,'P');
                Get.snackbar(
                  'تم رفع الطلب',
                  'تم رفع الطلب بنجاح',
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: Colors.green,
                  colorText: Colors.white,
                  titleText: const Text(
                    'تم رفع الطلب',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Tajawal',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  messageText: const Text(
                    'تم رفع الطلب بنجاح',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Tajawal',
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                );
                GetStorage().remove('cart');
                GetStorage().remove('bill_id');
                Get.toNamed('/home');
              },
            ).paddingOnly(top: 40),
          ],
        ),
      ),
    );
  }
}
