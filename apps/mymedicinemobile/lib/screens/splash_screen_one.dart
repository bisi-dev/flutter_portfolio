import 'dart:async';

import 'package:flutter/material.dart';
import 'splash_screen_two.dart';

import '../constants.dart';
import '../main.dart';

class SplashScreen1 extends StatefulWidget {
  @override
  _SplashScreen1 createState() => _SplashScreen1();
}

class _SplashScreen1 extends State<SplashScreen1> {
  @override
  void initState() {
    Timer(Duration(seconds: 2), onChange);
    super.initState();
  }

  Future<void> onChange() async {
    Navigator.pushReplacement(
        context,
        new PageRouteBuilder(
            maintainState: true,
            opaque: true,
            pageBuilder: (context, _, __) => new SplashScreen2(),
            transitionDuration: const Duration(seconds: 1),
            transitionsBuilder: (context, anim1, anim2, child) {
              return new FadeTransition(
                child: child,
                opacity: anim1,
              );
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
