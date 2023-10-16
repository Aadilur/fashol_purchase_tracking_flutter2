import 'package:fashol_purchase_tracking_flutter/utils/route.dart';
import 'package:fashol_purchase_tracking_flutter/view/auth_screens/login_email_screen.dart';
import 'package:fashol_purchase_tracking_flutter/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(MyApp()));

  runApp(MyApp());
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => const SplashScreen(),
        Routes.splashScreen: (context) => const SplashScreen(),
        Routes.loginScreen: (context) => const LoginEmailScreen(),
      },
      initialBinding: BindingsBuilder(() {
        // Get.lazyPut(() => );
      }),
    );
  }
}
