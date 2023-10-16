import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../utils/route.dart';
import 'auth_screens/login_email_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 4), () {
      Get.to(const LoginEmailScreen());
    });

    return Material(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
          child: Stack(
            children: [
              Positioned(
                top: 240,
                left: 0,
                right: 0,
                child: SvgPicture.asset("asset/images/logo.svg"),
              ),
              Positioned(
                bottom: 32,
                left: 0,
                right: 0,
                child: SvgPicture.asset("asset/images/text logo.svg"),
              ),
              const Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Text(
                  "Version 0.0.2",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: "Lato", fontWeight: FontWeight.w300),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
