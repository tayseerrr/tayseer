import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gif/gif.dart';
import 'package:lottie/lottie.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView(
      {super.key,
      this.subTitle,
      required this.title,
      required this.controller,
      required this.imagePath,
      required this.topPadding,
      this.subTitleStyle,
      this.bottom,
      this.repeat = false,
      this.onNext});

  final String? subTitle;
  final String title;
  final bool repeat;
  final String imagePath;
  final TextStyle? subTitleStyle;
  final Widget? bottom;
  final GifController controller;

  // onNext
  final VoidCallback? onNext;

  final double topPadding;

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: topPadding,
        ),
        if (imagePath.endsWith('gif'))
          Gif(
            width: Get.width * .6,

            image: AssetImage(imagePath),
            controller: controller,
            autostart: Autostart.loop,
            placeholder: (context) => const Text('Loading...'),
            onFetchCompleted: () {
              // if is run once
              if (controller.isCompleted) {
                controller.value = controller.upperBound;
              }
            },
            // duration: const Duration(milliseconds: 1200),
          )
        else if (imagePath.endsWith('json'))
          Lottie.asset(imagePath,
              width: Get.width * 0.65, height: Get.width * 0.65, repeat: repeat)
        else
          Image.asset(
            imagePath,
            width: 200,
            height: 200,
          ),
        Text(title,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Get.theme.primaryColor,
                    fontFamily: 'Tajawal'))
            .paddingOnly(top: 20),
        if (subTitle != null)
          SizedBox(
            width: Get.width * 0.8,
            height: 80,
            child: Text(
              subTitle!,
              // "Plant Life Matters too",
              style: subTitleStyle ??
                  TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Get.theme.primaryColor,
                      fontFamily: 'Tajawal'),
              textAlign: TextAlign.center,
            ),
          ).paddingOnly(left: 20, top: 50, bottom: 30),
        bottom ?? const SizedBox()
      ],
    );
  }
}
