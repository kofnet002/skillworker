import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skillworker/screens/home_page.dart';
import 'package:skillworker/screens/onboarding_page.dart';
import 'package:skillworker/theme/theme.dart';
import 'package:skillworker/theme/theme_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => ThemeProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(child: OnboardingPage()),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
