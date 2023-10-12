import 'package:fashol_purchase_tracking_flutter/screen/auth%20screens/login_email_screen.dart';
import 'package:fashol_purchase_tracking_flutter/screen/splash_screen.dart';
import 'package:fashol_purchase_tracking_flutter/utils/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(
        const ProviderScope(
          child: MyApp(),
        ),
      ));
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => const SplashScreen(),
        Routes.splashScreen: (context) => const SplashScreen(),
        Routes.loginScreen: (context) => const LoginEmailScreen(),
      },
    );
  }
}
