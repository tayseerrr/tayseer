import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DotIndicator extends StatefulWidget {
  const DotIndicator({
    super.key,
    required this.count,
    required this.currentIndex,
    this.unSelectedColor,
    this.selectedColor,
    this.unSelectGradient,
    this.selectGradient,
    this.unselectedSize = 10,
    this.selectedSize = 30,
    this.dotSize = 10,
    this.padding = const EdgeInsets.all(8.0),
  });

  final int count;
  final int currentIndex;

  final Color? unSelectedColor;

  final Color? selectedColor;
  final double dotSize;

  final double unselectedSize;

  final double selectedSize;
  final EdgeInsets padding;

  final Gradient? unSelectGradient;

  final Gradient? selectGradient;

  @override
  State<DotIndicator> createState() => _DotIndicatorState();
}

class _DotIndicatorState extends State<DotIndicator> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,

      children: [
        for (int i = 0; i < widget.count; i++)

          Padding(
            padding:  widget.padding,
            child: AnimatedContainer(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Get.theme.primaryColor,
                  width: .5,
                ),
                borderRadius: BorderRadius.circular(50),
                gradient: (widget.currentIndex == i)
                    ? selectedGradient()
                    : unSelectedGradient(),
                color: (widget.currentIndex == i)
                    ? selectedColor()
                    : unSelectedColor(),
              ),
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeOutCubic,
              height: widget.dotSize,
              width: widget.currentIndex == i
                  ? widget.selectedSize
                  : widget.unselectedSize,
            )
          ),
      ],
    );
  }

//   check if we will use gradient or color
  unSelectedGradient() {
    if (widget.unSelectGradient != null) {
      return widget.unSelectGradient;
    } else {
      return null;
    }
  }

  selectedGradient() {
    if (widget.selectGradient != null) {
      return widget.selectGradient;
    } else {
      return null;
    }
  }

  unSelectedColor() {
    if (widget.unSelectedColor != null) {
      return widget.unSelectedColor;
    } else {
      return null;
    }
  }

  selectedColor() {
    if (widget.selectedColor != null) {
      return widget.selectedColor;
    } else {
      return null;
    }
  }
}
