import 'dart:async';

import 'package:flutter/material.dart';

import '../constants.dart';
import '../main.dart';
import 'splash_screen_two.dart';

class SplashScreen1 extends StatefulWidget {
  const SplashScreen1({Key? key}) : super(key: key);

  @override
  _SplashScreen1 createState() => _SplashScreen1();
}

class _SplashScreen1 extends State<SplashScreen1> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2), onChange);
    super.initState();
  }

  Future<void> onChange() async {
    Navigator.pushReplacement(
        context,
        PageRouteBuilder(
            maintainState: true,
            opaque: true,
            pageBuilder: (context, _, __) => SplashScreen2(),
            transitionDuration: const Duration(seconds: 1),
            transitionsBuilder: (context, anim1, anim2, child) {
              return FadeTransition(child: child, opacity: anim1);
            }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorWhite,
      body: Stack(
        children: [
          Positioned(
            child: Align(
              alignment: Alignment.center,
              child: Container(
                child: Image.asset("assets/images/front_logo.png",
                    fit: BoxFit.contain, package: App.pkg),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
