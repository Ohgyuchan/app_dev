import 'package:flutter/material.dart';
import 'package:flutter_location_tracker/constants/asset_path.dart';
import 'package:flutter_location_tracker/controllers/app_controller.dart';
import 'package:flutter_location_tracker/screens/authentication/widgets/login.dart';
import 'package:flutter_location_tracker/screens/authentication/widgets/bottom_text.dart';
import 'package:flutter_location_tracker/screens/authentication/widgets/registration.dart';
import 'package:get/get.dart';

class AuthenticationScreen extends StatelessWidget {
  final AppController _appController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(
        () => SingleChildScrollView(
          child: Stack(
            children: [
              Image.asset(
                bg3,
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                fit: BoxFit.cover,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: Get.width / 1.3),
                  SizedBox(
                    height: Get.width / 70,
                  ),
                  Visibility(
                      visible: _appController.isLoginWidgetDisplayed.value,
                      child: LoginWidget()),
                  Visibility(
                      visible: !_appController.isLoginWidgetDisplayed.value,
                      child: RegistrationWidget()),
                  SizedBox(
                    height: 10,
                  ),
                  Visibility(
                    visible: _appController.isLoginWidgetDisplayed.value,
                    child: BottomTextWidget(
                      onTap: () {
                        _appController.changeDIsplayedAuthWidget();
                      },
                      text1: "Don\'t have an account?",
                      text2: "Create account!",
                    ),
                  ),
                  Visibility(
                    visible: !_appController.isLoginWidgetDisplayed.value,
                    child: BottomTextWidget(
                      onTap: () {
                        _appController.changeDIsplayedAuthWidget();
                      },
                      text1: "Already have an account?",
                      text2: "Sign in!!",
                    ),
                  ),
                ],
              ),
              Positioned(
                top: Get.height / 6,
                left: 20,
                child: Image.asset(
                  logo2,
                  width: 140,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
