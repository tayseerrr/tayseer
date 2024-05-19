import 'package:application/views/account/profile.dart';
import 'package:application/views/application/my_applications.dart';
import 'package:application/views/home/home.dart';
import 'package:application/views/products/cart.dart';
import 'package:application/views/products/commitments_info.dart';
import 'package:application/views/shared/bottom_navigation_bar.dart';
import 'package:application/views/shared/category_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  Widget body = const HomeView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: body,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          if (index == 0) {
            setState(() {
              currentIndex = index;
              body = const HomeView();
            });

          } else if (index == 1) {
            setState(() {
              currentIndex = index;
              body =  CartView();
            });
          } else if (index == 2) {
            setState(() {
              currentIndex = index;
              body =  MyApplicationsView();
            });
          } else if (index == 3) {
            setState(() {
              currentIndex = index;
              body =  CommitmentsInfoView();
            });
          } else if (index == 4) {
            currentIndex = index;
            setState(() {
              body =   ProfileView();
            });
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
          ),
          BottomNavigationBarItem(
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
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.person,
              size: 28,
            ).paddingOnly(bottom: 10, top: 4),
            label: 'حسابي',
          ),
        ],
        currentIndex: currentIndex,
      ),
    );
  }
}
