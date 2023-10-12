import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class LoginEmailScreen extends ConsumerStatefulWidget {
  const LoginEmailScreen({super.key});

  @override
  LoginEmailScreenState createState() => LoginEmailScreenState();
}

class LoginEmailScreenState extends ConsumerState {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
          child: Stack(
            children: [
              Positioned(
                top: 32,
                left: 0,
                child: SvgPicture.asset("asset/images/text logo.svg"),
              ),
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
              const Positioned(
                top: 312,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    TextInputBoxWithLogo(),
                    SizedBox(
                      height: 16,
                    ),
                    TextInputBoxWithPassword(),
                    SizedBox(
                      height: 24,
                    ),
                    LoginButton(),
                  ],
                ),
              ),
              Positioned(
                bottom: 16,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Or login with"),
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.all(0),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      onPressed: () {
                        // Handle the phone login action here
                      },
                      child: Text(
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
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TextInputBoxWithLogo extends StatelessWidget {
  const TextInputBoxWithLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: const Row(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.email_outlined, // Replace with your desired logo/icon
              color: Colors.grey,
            ),
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText:
                    'Enter your email here', // Replace with your desired hint text
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TextInputBoxWithPassword extends StatefulWidget {
  const TextInputBoxWithPassword({super.key});

  @override
  TextInputBoxWithPasswordState createState() =>
      TextInputBoxWithPasswordState();
}

class TextInputBoxWithPasswordState extends State<TextInputBoxWithPassword> {
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
          color: Colors.black,
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
              color: Colors.grey,
            ),
          ),
          Expanded(
            child: TextField(
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

class LoginButton extends StatefulWidget {
  const LoginButton({super.key});

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                // Add your login logic here
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.green, // Background color
                padding: EdgeInsets.all(16.0), // Button padding
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(8.0), // Button border radius
                ),
              ),
              child: Text(
                'Login',
                style: TextStyle(
                  color: Colors.white, // Text color
                  fontSize: 18.0, // Text font size
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
