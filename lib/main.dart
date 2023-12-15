import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skillworker/screens/auth/signup_page.dart';
import 'package:skillworker/screens/home_page.dart';
import 'package:skillworker/screens/onboarding_page.dart';
import 'package:skillworker/theme/theme.dart';
import 'package:skillworker/theme/theme_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(ChangeNotifierProvider(
      create: (context) => ThemeProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(child: SignupPage()),
      // theme: darkMode,
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
