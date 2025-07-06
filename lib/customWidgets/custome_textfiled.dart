import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/constant/appcolors.dart';

// ignore: must_be_immutable
class TextFormFiledCustom extends StatelessWidget {
  final String labelData;
  final String hintData;
  final IconData iconData;
  final TextEditingController? controllerData;
  var fillColor;
  var hintColor;
  var iconColor;
  var borderSideColor;
  var fontColor;
  bool obscureText = true;
  TextInputType? keyboardType;
  Iterable<String>? autofillHints;

//  final String? Function(String?) valid;

  final String? Function(String?) value;

  final String? Function(String?) onChanged;

  final String? Function(String?)? validator;
  TextFormFiledCustom({
    super.key,
    required this.labelData,
    required this.hintData,
    required this.iconData,
    required this.controllerData,
    // required this.valid,
    required this.value,
    required this.fillColor,
    required this.hintColor,
    required this.iconColor,
    required this.borderSideColor,
    required this.fontColor,
    required this.obscureText,
    required this.keyboardType,
    required this.autofillHints,
    required this.onChanged,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final screenWidth = _size.width;
    return TextFormField(
      textDirection: TextDirection.rtl,
      autofillHints: autofillHints,
      keyboardType: keyboardType,
      obscureText: obscureText,
      controller: controllerData,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: onChanged,
      onSaved: value,
      validator: validator,
      decoration: InputDecoration(
        filled: true,
        fillColor: fillColor,
        hintText: hintData.tr,
        hintStyle: TextStyle(color: hintColor, fontSize: screenWidth * 0.035),
        prefixIcon: Icon(iconData, color: iconColor),
        contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        label: Text(
          labelData,
        ),
        labelStyle: TextStyle(
          fontFamily: 'Cairo',
          color: fontColor,
          fontSize: screenWidth * 0.043,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderSideColor, width: 2),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderSideColor, width: 2),
        ),
      ),
      style: TextStyle(color: AppColors.balckColorTypeThree),
    );
  }
}
