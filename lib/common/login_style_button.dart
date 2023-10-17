import 'package:flutter/material.dart';

import '../view/auth_screens/login_email_screen.dart';

class LoginStyleButton extends StatefulWidget {
  final Function runFunction;
  final String textData;
  const LoginStyleButton(
      {super.key, required this.runFunction, this.textData = ""});

  @override
  State<LoginStyleButton> createState() => _LoginStyleButtonState();
}

class _LoginStyleButtonState extends State<LoginStyleButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () async {
              widget.runFunction;
              // fetchUser();
              // Add your login logic here
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green, // Background color
              padding: const EdgeInsets.all(16.0), // Button padding
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(8.0), // Button border radius
              ),
            ),
            child: Text(
              widget.textData,
              style: const TextStyle(
                color: Colors.white, // Text color
                fontSize: 18.0, // Text font size
              ),
            ),
          ),
        ),
      ],
    );
  }
}
