import 'package:fashol_purchase_tracking_flutter/view/auth_screens/login_screen_phone.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mysql1/mysql1.dart';

import '../../common/login_style_button.dart';

class LoginEmailScreen extends StatefulWidget {
  const LoginEmailScreen({super.key});

  @override
  State<LoginEmailScreen> createState() => _LoginEmailScreenState();
}

class _LoginEmailScreenState extends State<LoginEmailScreen> {
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
                        hintText: 'Enter your email here',
                        icon: Icon(
                          Icons.email_outlined,
                          color: Colors.black45,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const TextInputBoxWithLogoPassword(),
                      const SizedBox(
                        height: 24,
                      ),
                      LoginStyleButton(
                        runFunction: () async {
                          var x = fetchUser();
                          print(x);
                        },
                        textData: "Login",
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
        ),
      ),
    );
  }
}

fetchUser() async {
  print("hi");
  var settings = ConnectionSettings(
      host: '192.168.0.102',
      port: 3306,
      user: 'me',
      password: '',
      db: 'fashol_erp');
  var conn = await MySqlConnection.connect(settings);

  // var result = conn.query("select * from user where id = 1");
  //
  // return result;
}

// email text input box
class TextInputBoxWithLogo extends StatelessWidget {
  final String hintText;
  final Icon icon;
  const TextInputBoxWithLogo(
      {super.key, required this.hintText, required this.icon});

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

// phone text input box
class TextInputBoxWithLogoPassword extends StatefulWidget {
  const TextInputBoxWithLogoPassword({super.key});

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
