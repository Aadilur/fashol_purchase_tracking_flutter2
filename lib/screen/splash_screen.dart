import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/route.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushNamed(context, Routes.loginScreen);
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
