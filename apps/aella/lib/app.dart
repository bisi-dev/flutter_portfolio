import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'main.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Aella',
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2054D2),
      body: Center(
        child: SvgPicture.asset('assets/svg/logo_full.svg', package: App.pkg),
      ),
    );
  }
}
