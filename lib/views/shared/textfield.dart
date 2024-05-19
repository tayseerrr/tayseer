import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    this.hintText,
    this.controller,
    this.keyboardType,
    this.obscureText,
    this.readOnly,
    this.maxLines,
    this.minLines,
    this.maxLength,
    this.maxCharacters,
    this.onChanged,
    this.onTap,
    this.onEditingComplete,
    this.onSubmitted,
    this.validator,
    this.labelText,
    this.prefixText,
    this.suffixText,
    this.prefixIcon,
    this.fillColor,
    this.suffix,
    this.width,
    this.borderColor = const Color(0xff006972),
    this.height = 65,
    this.enabled = true,
    this.inputFormatters,
  });

  final String? hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final Color? fillColor;
  final bool? readOnly;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final int? maxCharacters;
  final Function(String)? onChanged;
  final Function()? onTap;
  final Function()? onEditingComplete;
  final Function(String)? onSubmitted;
  final String? Function(String?)? validator;
  final String? labelText;
  final String? prefixText;
  final String? suffixText;
  final Icon? prefixIcon;
  final Widget? suffix;
  final double? width;
  final double? height;
  final Color borderColor;
  final bool enabled;
  final List<TextInputFormatter>? inputFormatters;


  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,

      height: widget.height,
      // height: 50,
      decoration: BoxDecoration(
        // border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.only(right: 10),
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: widget.borderColor,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
              border: Border.all(
                color: widget.borderColor,
                width: 1,
              ),
            ),
            child: Icon(
              widget.prefixIcon?.icon,
              color: Colors.white,
              size: 32,
            ),
          ),
          SizedBox(
            width: 280,
            child: TextFormField(
              inputFormatters: widget.inputFormatters,
              validator: widget.validator,
              enabled: widget.enabled,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.normal,
                fontFamily: 'Tajawal',
              ),
              minLines: widget.minLines,
              maxLines: widget.maxLines,
              maxLength: widget.maxLength,
              onChanged: widget.onChanged,
              onTap: widget.onTap,
              onEditingComplete: widget.onEditingComplete,
              obscureText: widget.obscureText ?? false,
              readOnly: widget.readOnly ?? false,
              keyboardType: widget.keyboardType,
              controller: widget.controller,
              decoration: InputDecoration(
                suffix: widget.suffix,
                error: null,
                filled: widget.fillColor != null,
                fillColor: widget.fillColor,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: widget.borderColor, width: 2),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(50),
                    bottomLeft: Radius.circular(50),
                    topRight: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: widget.borderColor),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(50),
                    bottomLeft: Radius.circular(50),
                    topRight: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                  ),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: widget.borderColor, width: 2),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(50),
                    bottomLeft: Radius.circular(50),
                    topRight: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                  ),
                ),
                labelText: widget.labelText,
                labelStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'Tajawal',
                ),
                hintStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'Tajawal',
                ),
                hintText: widget.hintText,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ExtendAppTextField extends StatefulWidget {
  const ExtendAppTextField({
    super.key,
    this.hintText,
    this.controller,
    this.keyboardType,
    this.obscureText,
    this.readOnly,
    this.maxLines,
    this.minLines,
    this.maxLength,
    this.maxCharacters,
    this.onChanged,
    this.onTap,
    this.onEditingComplete,
    this.onSubmitted,
    this.validator,
    this.labelText,
    this.prefixText,
    this.suffixText,
    this.prefixIcon,
    this.fillColor,
    this.suffix,
    this.width,
    this.borderColor = const Color(0xff006972),
    this.height = 65,
    this.enabled = true,
    this.inputFormatters,
  });

  final String? hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final Color? fillColor;
  final bool? readOnly;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final int? maxCharacters;

  final Function(String)? onChanged;
  final Function()? onTap;
  final Function()? onEditingComplete;
  final Function(String)? onSubmitted;
  final String ?Function(String?)? validator;
  final String? labelText;
  final String? prefixText;
  final String? suffixText;
  final Icon? prefixIcon;
  final Widget? suffix;
  final double? width;
  final double? height;
  final Color borderColor;
  final bool enabled;
  //  this.inputFormatters,
  final List<TextInputFormatter>? inputFormatters;

  @override
  State<ExtendAppTextField> createState() => _ExtendAppTextFieldState();
}

class _ExtendAppTextFieldState extends State<ExtendAppTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,

      height: widget.height!-120,
      // height: 50,
      decoration: BoxDecoration(
        // border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.only(right: 10),
            width: 60,
            height: widget.height! > 60 ? widget.height! - 145 : 60,
            decoration: BoxDecoration(
              color: widget.borderColor,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
              border: Border.all(
                color: widget.borderColor,
                width: 1,
              ),
            ),
            child: Icon(
              widget.prefixIcon?.icon,
              color: Colors.white,
              size: 32,
            ),
          ),
          SizedBox(
            width: 280,
            child: TextFormField(
              inputFormatters: widget.inputFormatters,
              validator: widget.validator,
              enabled: widget.enabled,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.normal,
                fontFamily: 'Tajawal',
              ),
              minLines: widget.minLines,
              maxLines: widget.maxLines,
              maxLength: widget.maxLength,
              onChanged: widget.onChanged,
              onTap: widget.onTap,
              onEditingComplete: widget.onEditingComplete,
              obscureText: widget.obscureText ?? false,
              readOnly: widget.readOnly ?? false,
              keyboardType: widget.keyboardType,
              controller: widget.controller,
              decoration: InputDecoration(
                error: null,
                filled: widget.fillColor != null,
                fillColor: widget.fillColor,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: widget.borderColor, width: 2),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(50),
                    bottomLeft: Radius.circular(50),
                    topRight: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: widget.borderColor),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(50),
                    bottomLeft: Radius.circular(50),
                    topRight: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                  ),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: widget.borderColor, width: 2),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(50),
                    bottomLeft: Radius.circular(50),
                    topRight: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                  ),
                ),
                labelText: widget.labelText,
                labelStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'Tajawal',
                ),
                hintStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'Tajawal',
                ),
                hintText: widget.hintText,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
