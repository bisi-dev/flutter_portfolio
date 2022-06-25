import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screen_decider.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import '../main.dart';

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
      splash: Image.asset('assets/images/logo.png', package: App.pkg,),
      nextScreen: ScreenDecider(),
      duration: 1000,
      splashTransition: SplashTransition.fadeTransition,
      // pageTransitionType: PageTransitionType.bottomToTop,
    );
  }
}
