import 'package:application/views/account/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBottomNavigationBar extends StatelessWidget {
  const AppBottomNavigationBar({super.key, this.currentIndex = 0});

  final int currentIndex;


  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
       onTap: (index) {
          if (index == 0) {
            Navigator.pushNamed(context, '/home');
          } else if (index == 1) {
            Navigator.pushNamed(context, '/cart');
          } else if (index == 2) {
            Navigator.pushNamed(context, '/my_applications');
          }
          else if (index == 3) {
            Navigator.pushNamed(context, '/commitments');
          }
          else if (index == 4) {
            Get.to(() => const ProfileView());
          }
        },
        backgroundColor: Get.theme.primaryColor,
        selectedItemColor: Colors.white,
        // make it not fix
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: const TextStyle(
          fontFamily: 'Tajawal',
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        unselectedLabelStyle: const TextStyle(
          fontFamily: 'Tajawal',
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: Color(0xA5D3FFFC),
        ),
        unselectedItemColor: const Color(0xA5D3FFFC),
        items: [
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.home,
              size: 28,
            ).paddingOnly(bottom: 10, top: 4),
            label: 'الرئيسية',
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.shopping_cart,
              size: 28,
            ).paddingOnly(bottom: 10, top: 4),
            label: 'السلة',
          ),BottomNavigationBarItem(
            icon: const Icon(
              // applications
              Icons.list_alt,
              size: 28,
            ).paddingOnly(bottom: 10, top: 4),
            label: 'طلباتي',
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.date_range_outlined,
              size: 28,
            ).paddingOnly(bottom: 10, top: 4),
            label: 'الأقساط',
          ),BottomNavigationBarItem(
            icon: const Icon(
              Icons.person,
              size: 28,
            ).paddingOnly(bottom: 10, top: 4),
            label: 'حسابي',
          ),
        ],
        currentIndex: currentIndex,
      );
  }
}
