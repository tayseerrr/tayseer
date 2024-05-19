import 'package:application/views/admission/home.dart';
import 'package:application/views/auth/login.dart';
import 'package:application/views/auth/signup.dart';
import 'package:application/views/application/my_applications.dart';
import 'package:application/views/auth/verifiy.dart';
import 'package:application/views/home/home_page.dart';
import 'package:application/views/products/cart.dart';
import 'package:application/views/products/commitments_info.dart';
import 'package:application/views/products/details.dart';
import 'package:application/views/products/devices.dart';
import 'package:application/views/products/list.dart';
import 'package:application/views/home/home.dart';
import 'package:application/views/loan/apply.dart';
import 'package:application/views/onboarding/onboarding.dart';
import 'package:application/views/polices/installment.dart';
import 'package:application/views/polices/loan.dart';
import 'package:application/views/services/consulatent/apply.dart';
import 'package:application/views/services/consulatent/list.dart';
import 'package:application/views/services/medicine/apply.dart';
import 'package:application/views/services/medicine/partners.dart';
import 'package:application/views/suppliers/list.dart';
import 'package:get/get.dart';

import '../views/services/delivery/delivery.dart';

List<GetPage> routers = [
  GetPage(
    name: '/home',
    page: () =>  HomePage(),
  ),
  GetPage(
    name: '/onboarding',
    page: () => const OnBoardingView(),
  ),
  GetPage(
    name: '/login',
    page: () => LoginView(),
  ),
  GetPage(
    name: '/signup',
    page: () => SignUpView(),
  ),GetPage(
    name: '/admission',
    page: () => const AdmissionHomeView(),
  ),
  // GetPage(
  //   name: '/verify',
  //   page: () => const VerifyView(),
  // ),
  GetPage(
    name: '/loans/apply',
    page: () => const LoanApplyView(),
  ),
  GetPage(
    name: '/loans/policy',
    page: () => LoanPolicyView(),
  ),

  GetPage(
    name: '/medicines/apply',
    page: () => const MedicineDiscountsApplyView(),
  ),
  // installment part
  GetPage(
    name: '/installment/apply',
    page: () => const InstallmentPolicyView(),
  ),
  GetPage(
    name: '/installment/devices',
    page: () => DevicesMenuView(),
  ),
  GetPage(
    name: '/products/list',
    page: () => const DevicesListView(),
  ),
  GetPage(
    name: '/products/details',
    page: () => ProductDetailsView(),
  ),
  GetPage(
    name: '/product/delevery',
    page: () => const DeliveryOptionsView(),
  ),

  GetPage(
    name: '/cart',
    page: () => CartView(),
  ),
  GetPage(
    name: '/commitments',
    page: () => const CommitmentsInfoView(),
  ),
  GetPage(
    name: '/my_applications',
    page: () => const MyApplicationsView(),
  ),

  //
  GetPage(
    name: '/consultant/apply',
    page: () => const ConsultingApplyView(),
  ), GetPage(
    name: '/consultants',
    page: () => const ConsultantsListView(),
  ),
  GetPage(
    name: '/medicine/partners',
    page: () => const PartnersListView(),
  ),
  GetPage(
    name: '/suppliers/delivery',
    page: () => const DeliveryRequestListView(),
  ),
];
