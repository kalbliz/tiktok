import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok/app/modules/authentication/controllers/signup_controller.dart';
import 'package:tiktok/app/routes/app_routes.dart';
import 'package:tiktok/app/utilities/buttons/auth_button.dart';
import 'package:tiktok/app/utilities/colors/app_colors.dart';
import 'package:tiktok/app/utilities/size/size_fit.dart';
import 'package:tiktok/app/utilities/text_field/tik_textfield.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: sizeFit(true, 16, context),
              vertical: sizeFit(false, 16, context)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Tiktok Clone',
                style: TextStyle(
                    fontSize: sizeFit(false, 34, context),
                    fontWeight: FontWeight.w800,
                    color: AppColors.AppRed),
              ),
              SizedBox(
                height: sizeFit(false, 16, context),
              ),
              Text(
                'Register',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: sizeFit(false, 28, context)),
              ),
              SizedBox(
                height: sizeFit(false, 16, context),
              ),
              Stack(
                children: [
                  CircleAvatar(
                    backgroundColor: AppColors.AppBlack,
                    radius: sizeFit(false, 64, context),
                    backgroundImage: NetworkImage(
                        'https://images.pexels.com/photos/163064/play-stone-network-networked-interactive-163064.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                  ),
                  Positioned(
                      left: 60,
                      bottom: -10,
                      child: IconButton(
                          onPressed: () {
                            // controller.pickImage();
                            controller.pickHeroImage();
                          },
                          icon: Icon(Icons.add_a_photo)))
                ],
              ),
              SizedBox(
                height: sizeFit(false, 16, context),
              ),
              TikTextField(
                enabled: true,
                hintText: 'Username',
                titleText: 'Username',
                textEditingController: controller.usernameEditingController,
                prefixIcon: Icon(
                  Icons.person,
                  size: 16,
                  color: AppColors.AppBlack,
                ),
              ),
              SizedBox(
                height: sizeFit(false, 16, context),
              ),
              TikTextField(
                enabled: true,
                hintText: 'Email',
                titleText: 'Email',
                textEditingController: controller.emailEditingController,
                prefixIcon: Icon(
                  Icons.email,
                  size: 16,
                  color: AppColors.AppBlack,
                ),
              ),
              SizedBox(
                height: sizeFit(false, 16, context),
              ),
              TikTextField(
                enabled: true,
                hintText: 'Password',
                titleText: 'Password',
                obscureText: true,
                textEditingController: controller.passwordEditingController,
                prefixIcon: Icon(
                  Icons.lock,
                  size: 16,
                  color: AppColors.AppBlack,
                ),
              ),
              SizedBox(
                height: sizeFit(false, 24, context),
              ),
              AuthButton(
                text: 'Register',
                onPressed: () {
                  controller.registerUser(
                      controller.usernameEditingController.value.text,
                      controller.emailEditingController.value.text,
                      controller.passwordEditingController.value.text,
                      controller.profilePhoto);
                },
              ),
              SizedBox(
                height: sizeFit(false, 24, context),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account? ",
                    style: TextStyle(
                        fontSize: sizeFit(false, 16, context),
                        color: AppColors.AppWhite),
                  ),
                  InkWell(
                    onTap: () {
                      context.pushReplacementNamed(AppRoutes.LOGIN);
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                          fontSize: sizeFit(false, 16, context),
                          color: AppColors.AppRed),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
