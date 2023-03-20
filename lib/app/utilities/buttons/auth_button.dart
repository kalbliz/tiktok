// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:tiktok/app/utilities/colors/app_colors.dart';
import 'package:tiktok/app/utilities/size/size_fit.dart';

class AuthButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  TextStyle? style;
  AuthButton({
    Key? key,
    this.onPressed,
    required this.text,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.AppRed,
      ),
      child: Material(
        type: MaterialType.transparency,
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
            splashColor: Color.fromARGB(124, 108, 130, 255),
            highlightColor: Colors.white,
            splashFactory: InkRipple.splashFactory,
            onTap: onPressed,
            borderRadius: BorderRadius.circular(8),
            child: Container(
              padding:
                  EdgeInsets.symmetric(horizontal: sizeFit(true, 16, context)),
              width: sizeFit(true, 368, context),
              height: sizeFit(false, 52, context),
              decoration: BoxDecoration(
                  // color: AppColors.AppRed,
                  borderRadius: BorderRadius.circular(8)),
              child: Center(
                child: Text(
                  text,
                  style: style ??
                      TextStyle(
                          fontSize: sizeFit(false, 16, context),
                          color: AppColors.AppWhite,
                          fontWeight: FontWeight.w600),
                ),
              ),
            )),
      ),
    );
  }
}
