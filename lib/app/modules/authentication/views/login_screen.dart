import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok/app/modules/authentication/controllers/login_controller.dart';
import 'package:tiktok/app/routes/app_routes.dart';
import 'package:tiktok/app/utilities/buttons/auth_button.dart';
import 'package:tiktok/app/utilities/colors/app_colors.dart';
import 'package:tiktok/app/utilities/size/size_fit.dart';
import 'package:tiktok/app/utilities/text_field/tik_textfield.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = LoginController();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: sizeFit(true, 16, context),
              vertical: sizeFit(false, 24, context)),
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
                'Login',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: sizeFit(false, 28, context)),
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
                text: 'Login',
                onPressed: () {},
              ),
              SizedBox(
                height: sizeFit(false, 24, context),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: TextStyle(
                        fontSize: sizeFit(false, 16, context),
                        color: AppColors.AppWhite),
                  ),
                  InkWell(
                    onTap: () {
                      context.pushReplacementNamed(AppRoutes.SIGNUP);
                    },
                    child: Text(
                      "Create Account ",
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
