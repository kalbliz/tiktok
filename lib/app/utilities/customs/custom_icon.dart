import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:tiktok/app/utilities/colors/app_colors.dart';
import 'package:tiktok/app/utilities/size/size_fit.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: sizeFit(true, 45, context),
      height: sizeFit(false, 30, context),
      child: Stack(children: [
        Container(
          margin: EdgeInsets.only(left: sizeFit(true, 10, context)),
          width: sizeFit(true, 38, context),
          decoration: BoxDecoration(
              color: Color.fromARGB(225, 250, 45, 108),
              borderRadius: BorderRadius.circular(8)),
        ),
        Container(
          margin: EdgeInsets.only(right: sizeFit(true, 10, context)),
          width: sizeFit(true, 38, context),
          decoration: BoxDecoration(
              color: Color.fromARGB(225, 32, 211, 234),
              borderRadius: BorderRadius.circular(8)),
        ),
        Center(
          child: Container(
            height: double.infinity,
            width: sizeFit(true, 38, context),
            decoration: BoxDecoration(
                color: AppColors.AppWhite,
                borderRadius: BorderRadius.circular(8)),
            child: Icon(
              Icons.add,
              size: sizeFit(false, 20, context),
              color: AppColors.AppBlack,
            ),
          ),
        )
      ]),
    );
  }
}
