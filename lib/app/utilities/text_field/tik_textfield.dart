// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:tiktok/app/utilities/colors/app_colors.dart';

import 'package:tiktok/app/utilities/size/size_fit.dart';

class TikTextField extends StatelessWidget {
  final String hintText;
  final String? titleText;
  final TextEditingController? textEditingController;
  final bool? autofocus;
  final String? errorText;
  final String? Function(String?)? validator;
  final bool? obscureText;
  final bool enabled;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String)? onChanged;
  final Color? suffixIconColor;
  final Color? prefixIconColor;
  const TikTextField({
    Key? key,
    required this.hintText,
    this.titleText,
    this.textEditingController,
    this.autofocus,
    this.errorText,
    this.validator,
    this.obscureText,
    required this.enabled,
    this.suffixIcon,
    this.prefixIcon,
    this.textInputType,
    this.inputFormatters,
    this.onChanged,
    this.suffixIconColor,
    this.prefixIconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: sizeFit(true, 368, context),
        /*  height: sizeFit(false, 56, context),*/
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
        ),
        child: TextFormField(
          controller: textEditingController,
          cursorColor: AppColors.AppBlack,
          autofocus: autofocus ?? false,
          obscureText: obscureText ?? false,
          keyboardType: textInputType,
          inputFormatters: inputFormatters,
          onChanged: onChanged,
          enabled: enabled,
          style: TextStyle(
              fontSize: sizeFit(false, 16, context),
              letterSpacing: 1.0,
              color: AppColors.AppBlack),
          validator: validator,
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            floatingLabelStyle: TextStyle(color: AppColors.AppGreen),
            labelText: titleText,
            labelStyle: TextStyle(color: AppColors.AppBlack),
            isDense: false,
            contentPadding: EdgeInsets.only(
              top: sizeFit(false, 10, context),
              left: sizeFit(true, 16, context),
              bottom: sizeFit(false, 10, context),
              right: sizeFit(true, 16, context),
            ),
            prefixIconConstraints: BoxConstraints.tight(
                Size(sizeFit(true, 38, context), sizeFit(false, 22, context))),
            isCollapsed: false,
            prefixIcon: prefixIcon,
            prefixIconColor: prefixIconColor,
            suffixIcon: suffixIcon,
            suffixIconColor: suffixIconColor,
            hintText: hintText,
            hintStyle: TextStyle(
                color: AppColors.AppBlack,
                fontSize: sizeFit(false, 16, context),
                fontWeight: FontWeight.w400,
                fontFamily: 'Cabin'),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(
                color: AppColors.AppWhite,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(
                color: AppColors.AppBlack,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(
                color: AppColors.AppGreen,
              ),
            ),
            focusColor: AppColors.AppGreen,
            hoverColor: AppColors.AppGreen,
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(
                color: Colors.redAccent,
              ),
            ),
          ),
        ));
  }
}
