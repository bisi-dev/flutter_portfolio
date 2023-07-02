import 'package:flutter/material.dart';

import 'main.dart';
import 'screens/onboarding_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Parcel Drop',
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    loadApp();
  }

  void loadApp() async {
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => const OnboardingScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF4661E4),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Image.asset(
              "assets/png/logo.png",
              width: 150,
              fit: BoxFit.cover,
              package: App.pkg,
            ),
          ),
        ],
      ),
    );
  }
}
