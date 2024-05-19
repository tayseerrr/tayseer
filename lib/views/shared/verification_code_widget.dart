import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class VerificationCode extends StatefulWidget {
  final int length;
  final double height;
  final double width;
  final double fieldWidth;
  final double fieldHeight;
  final EdgeInsets fieldPadding;
  final TextEditingController controller;
  final OutlineInputBorder? border;
  final OutlineInputBorder? focuseBorder;

  const VerificationCode(
      {this.length = 6,
      required this.controller,
      this.width = 100,
      this.height = 55,
      this.fieldWidth = 20,
      this.fieldHeight = 50,
      this.fieldPadding = const EdgeInsets.all(1),
      this.border,
      this.focuseBorder,
      super.key});

  @override
  State<VerificationCode> createState() => _VerificationCodeState();
}

class _VerificationCodeState extends State<VerificationCode> {
  final List<FocusNode> _focusNode = [];
  final List<TextEditingController> _controllers = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < widget.length; i++) {
      _focusNode.add(FocusNode());
      _controllers.add(TextEditingController());
      //  check when foucs on field
      _focusNode[i].addListener(() {
        if (_focusNode[i].hasFocus) {
          _controllers[i].text = "";
        }
      });
    }
    widget.controller.addListener(() {
      if (widget.controller.text.isEmpty) {
        for (int i = 0; i < widget.length; i++) {
          _controllers[i].text = "";
        }
      }
      if (widget.controller.text.length == widget.length) {
        for (int i = 0; i < widget.length; i++) {
          _controllers[i].text = widget.controller.text[i];
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.length < 1) {
      throw Exception("widget.length must be greater than 0");
    }

    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: Row(
        mainAxisAlignment: Get.locale!.languageCode == "ar"
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        children: [
          for (int i = 0; i < widget.length; i++)
            Container(
              margin: widget.fieldPadding,
              padding: const EdgeInsets.all(1),
              height: widget.height,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: SizedBox(
                width: widget.fieldWidth,
                height: widget.fieldHeight,
                child: TextField(
                  controller: _controllers[i],
                  focusNode: _focusNode[i],

                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                  ],

                  onChanged: (value) {
                    if (_controllers[i].text.isEmpty) return;
                    // _controllers[i].text = value;
                    if (i > 0) {
                      _focusNode[i].unfocus();
                      FocusScope.of(context).requestFocus(_focusNode[i - 1]);
                    }
                    if (checkIfAllFilled()) {
                      for (int i = 0; i < widget.length; i++) {
                        widget.controller.text += _controllers[i].text;
                      }
                    }
                    // check language arabic or english
                  },
                  onSubmitted: (value) {
                    if (_controllers[i].text.isEmpty) return;
                    if (Get.locale!.languageCode == "ar") {
                      if (i > 0) {
                        _focusNode[i].unfocus();
                        FocusScope.of(context).requestFocus(_focusNode[i - 1]);
                      }
                      if (i == 0) {
                        for (int j = 0; j < widget.length; j++) {
                          widget.controller.text += _controllers[i].text;
                        }
                      }
                    }
                  },
                  onTap: () {
                    if (_controllers[i].text.isEmpty)
                      return;
                    else {
                      _controllers[i].clear();
                    }
                  },

                  // maxLength: 1,
                  decoration: InputDecoration(
                      border: widget.border ?? InputBorder.none,
                      enabledBorder: widget.border ?? InputBorder.none,
                      hintText: '',
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.all(5),
                      focusedBorder: widget.focuseBorder ?? InputBorder.none,
                      // counter: SizedBox.shrink(),
                      counterText: ""),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontFamily: "Cairo",
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
        ],
      ),
    );
  }

  bool checkIfAllFilled() {
    for (int i = 0; i < widget.length; i++) {
      if (_controllers[i].text.isEmpty) {
        return false;
      }
    }
    return true;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    for (int i = 0; i < widget.length; i++) {
      _focusNode[i].dispose();
      _controllers[i].dispose();
    }
  }
}

// Widget VerificationCode({
//  required TextEditingController widget.controller,
//  int widget.length = 4,
// }){
//
// }
