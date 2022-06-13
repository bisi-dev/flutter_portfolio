import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screen_decider.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

class Splash extends StatefulWidget {
  _Splash createState() => new _Splash();
}

class _Splash extends State<Splash> {

  @override
  Widget build(BuildContext context) {
    @override
    void initState() {
      SystemChrome.setEnabledSystemUIOverlays([]);
      super.initState();
    }

    return AnimatedSplashScreen(
      splash: 'assets/images/logo.png',
      nextScreen: ScreenDecider(),
      duration: 500,
      splashTransition: SplashTransition.fadeTransition,
      // pageTransitionType: PageTransitionType.bottomToTop,
    );
  }
}
