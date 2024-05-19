import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dot_indicator.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key, required this.pages, required this.controller});

  final List<Widget> pages;
  final PageController controller;

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      setState(() {
        currentIndex = widget.controller.page!.round();
      });
    });
  }

  final TextStyle style = const TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          PageView(
            scrollDirection: Axis.horizontal,
            controller: widget.controller,
            children: [
              for (int i = 0; i < widget.pages.length; i++)
                Container(
                  width: Get.width,
                  color: Get.theme.cardColor,
                  child: widget.pages[i],
                ),
            ],
          ),
          DotIndicator(
            padding: const EdgeInsets.only(right: 5, left: 5),
            unSelectedColor: const Color(0xFFCDE7EB),
            count: widget.pages.length,
            dotSize: 15,
            selectedSize: 40,
            unselectedSize: 15,
            currentIndex: currentIndex,
            selectedColor: Get.theme.primaryColor,
          ).paddingOnly(top: Get.height * 0.9),
        ],
      ),
    );
  }
}
