import 'package:flutter/material.dart';
import 'screens/onboarding_screen.dart';
void main() { runApp(const EmpresaOnboardingApp()); }
class EmpresaOnboardingApp extends StatelessWidget {
  const EmpresaOnboardingApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Conocamonos',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFD4824A), brightness: Brightness.light),
      ),
      home: const OnboardingScreen(),
    );
  }
}
