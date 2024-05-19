import 'package:application/views/onboarding/widgets/onboading.dart';
import 'package:application/views/onboarding/widgets/onboarding_page.dart';
import 'package:application/views/shared/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gif/gif.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView>
    with TickerProviderStateMixin {
  //     List.filled(_totalPage, GifController(vsync: this));
  late GifController _controller1;
  late GifController _controller2;
  late GifController _controller3;
  late GifController _controller4;

  @override
  void initState() {
    super.initState();
    _controller1 = GifController(vsync: this);
    _controller2 = GifController(vsync: this);
    _controller3 = GifController(vsync: this);
    _controller4 = GifController(vsync: this);
  }

  final PageController controller = PageController(
    initialPage: 0,
    viewportFraction: 1,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // EAF4F4
      backgroundColor: Color(0xFFEAF4F4),
        body: Onboarding(
      controller: controller,
      pages: [
        OnboardingView(

          topPadding: Get.width * 0.7,
          title: "مرحباً بك على منصة تيسير",
          subTitleStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Get.theme.primaryColor,
              fontFamily: 'Tajawal'),
          controller: _controller1,
          imagePath: "assets/images/logo.png",
          onNext: () {
            controller.nextPage(
              duration: const Duration(milliseconds: 500),
              curve: Curves.ease,
            );
          },
          bottom: Button(
            onPressed: () {
              controller.nextPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease,
              );
            },
            text: 'البدء',
          ).paddingOnly(top: 100),
        ),
        OnboardingView(
          title: "ماذا يوفر تيسير؟",
          subTitle: "تيسير هو منصة إلكترونية يوفر تسهيلات للحصول على الإستشارات المالية والخصومات للمراكز الطبية ",
          subTitleStyle: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Get.theme.primaryColor,
              fontFamily: 'Tajawal'),
          topPadding: Get.width * 0.5,
          controller: _controller2,
          imagePath: 'assets/lotties/money.json',
          onNext: () {
            controller.nextPage(
              duration: const Duration(milliseconds: 500),
              curve: Curves.ease,
            );
          },
          bottom: Button(
            onPressed: () {
              controller.nextPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease,
              );
            },
            text: 'التالي',
          ).paddingOnly(bottom: 20),
        ),
        OnboardingView(
          title: "ماذا يوفر تيسير؟",
          subTitle: "يساهم إيضا في منح الطلاب وخطة تسديد بناء على مستوى الطالب المالي",
          topPadding: Get.width * 0.5,
          controller: _controller3,
          imagePath: 'assets/lotties/bank.json',
          repeat: true,
          bottom: Button(
            onPressed: () {
              controller.nextPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease,
              );
            },
            text: 'التالي',
          ).paddingOnly(bottom: 20),

          onNext: () {
            controller.nextPage(
              duration: const Duration(milliseconds: 500),
              curve: Curves.ease,
            );
          },
        ),
        OnboardingView(
          repeat: true,
          title: "ماذا يوفر تيسير؟",
          subTitle: "يساعد الطلاب على في شراء الأجهزة الإلكترونية بكل سهولة وأمان",
          topPadding: Get.width * 0.5,
          controller: _controller4,
          imagePath: "assets/lotties/devices.json",
          bottom: Button(
            onPressed: ()async {
             await GetStorage().write('first_time', true);
              Get.offAllNamed('/login');
            },
            text: 'ابدأ الآن',
          ).paddingOnly(bottom: 20),

          onNext: () {

          },
        ),

      ],
    ));
  }
}
