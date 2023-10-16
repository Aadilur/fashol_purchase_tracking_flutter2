import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../common/login_style_button.dart';
import 'login_email_screen.dart';

class LoginPhoneScreen extends StatefulWidget {
  const LoginPhoneScreen({super.key});

  @override
  State<LoginPhoneScreen> createState() => _LoginPhoneScreenState();
}

class _LoginPhoneScreenState extends State<LoginPhoneScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height - 52,
                ),
                //text logo
                Positioned(
                  top: 32,
                  left: 0,
                  child: SvgPicture.asset("asset/images/text logo.svg"),
                ),

                //greetings text and header START

                const Positioned(
                  top: 128,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      Text(
                        "Welcome Back !",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: "Lato",
                          fontWeight: FontWeight.w300,
                          color: Colors.black45,
                        ),
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 32,
                          fontFamily: "Lato",
                          fontWeight: FontWeight.w300,
                          color: Colors.black45,
                        ),
                      ),
                    ],
                  ),
                ),

                //greetings text and header END

                // text input fields (email and password input field start)

                Positioned(
                  top: 312,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      const TextInputBoxWithLogo(
                        hintText: 'Enter Your Mobile Number',
                        icon: Icon(
                          Icons.phone,
                          color: Colors.black45,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      LoginStyleButton(
                        runFunction: () {},
                        textData: "Send OTP",
                      ),
                    ],
                  ),
                ),

                // text input fields (email and password input field END)

                // Footer Section Start
                Positioned(
                  bottom: 16,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Or login with"),
                      TextButton(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.all(0),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        onPressed: () {
                          Get.to(() => const LoginEmailScreen());
                          // Handle the phone login action here
                        },
                        child: const Text(
                          'Email',
                          style: TextStyle(
                            color: Colors.green, // Green color
                            fontSize: 16.0,
                            decoration: TextDecoration.underline, // Underline
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // footer section END
              ],
            ),
          ),
        ),
      ),
    );
  }
}
