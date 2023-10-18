import 'package:fashol_purchase_tracking_flutter/view/auth_screens/login_screen_phone.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mysql1/mysql1.dart';

import '../../common/login_style_button.dart';
import '../../core/view_model/user_view_model.dart';

class LoginEmailScreen extends StatefulWidget {
  const LoginEmailScreen({super.key});

  @override
  State<LoginEmailScreen> createState() => _LoginEmailScreenState();
}

class _LoginEmailScreenState extends State<LoginEmailScreen> {
  final UserViewModel userViewModel = Get.find();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(body: Obx(() {
        return Padding(
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

                Positioned(
                  top: 128,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      Text(
                        "Welcome Back ${userViewModel.users.value.name} !",
                        style: const TextStyle(
                          fontSize: 16,
                          fontFamily: "Lato",
                          fontWeight: FontWeight.w300,
                          color: Colors.black45,
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      const Text(
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
                      TextInputBoxWithLogo(
                        hintText: 'Enter your email here',
                        icon: const Icon(
                          Icons.email_outlined,
                          color: Colors.black45,
                        ),
                        emailController: emailController,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      TextInputBoxWithLogoPassword(
                        passwordController: passwordController,
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                final username = emailController.text;
                                final password = passwordController.text;
                                userViewModel.login(username, password);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Colors.green, // Background color
                                padding: const EdgeInsets.all(
                                    16.0), // Button padding
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      8.0), // Button border radius
                                ),
                              ),
                              child: const Text(
                                "Login _",
                                style: TextStyle(
                                  color: Colors.white, // Text color
                                  fontSize: 18.0, // Text font size
                                ),
                              ),
                            ),
                          ),
                        ],
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
                          Get.to(() => const LoginPhoneScreen());
                          // Handle the phone login action here
                        },
                        child: const Text(
                          'Phone',
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
        );
      })),
    );
  }
}

// email text input box
class TextInputBoxWithLogo extends StatelessWidget {
  final String hintText;
  final Icon icon;
  final TextEditingController emailController;
  const TextInputBoxWithLogo(
      {super.key,
      required this.hintText,
      required this.icon,
      required this.emailController});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black45,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: icon,
          ),
          Expanded(
            child: TextField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: hintText, // Replace with your desired hint text
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// password text input box
class TextInputBoxWithLogoPassword extends StatefulWidget {
  final TextEditingController passwordController;

  const TextInputBoxWithLogoPassword(
      {super.key, required this.passwordController});

  @override
  TextInputBoxWithLogoPasswordState createState() =>
      TextInputBoxWithLogoPasswordState();
}

class TextInputBoxWithLogoPasswordState
    extends State<TextInputBoxWithLogoPassword> {
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black45,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.lock_outlined, // Replace with your desired logo/icon
              color: Colors.black45,
            ),
          ),
          Expanded(
            child: TextField(
              controller: widget.passwordController,
              obscureText: _obscureText,
              decoration: const InputDecoration(
                hintText: 'Enter your password here',
                // Replace with your desired hint text
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            onPressed: _togglePasswordVisibility,
            icon: Icon(
              _obscureText ? Icons.visibility_off : Icons.visibility,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
