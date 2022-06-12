import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'intro_page.dart';

import '../main.dart';
import '../constants.dart';

class SplashScreen2 extends StatefulWidget {
  @override
  _SplashScreen2 createState() => _SplashScreen2();
}

class _SplashScreen2 extends State<SplashScreen2> {
  @override
  void initState() {
    Timer(Duration(seconds: 2), onClose);
    super.initState();
  }

  Future<void> onClose() async {
    Navigator.pushReplacement(
        context,
        new PageRouteBuilder(
            maintainState: true,
            opaque: true,
            pageBuilder: (context, _, __) => new IntroPage(),
            transitionDuration: const Duration(seconds: 2),
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
            bottom: 0,
            left: 0,
            child:
                Image.asset("assets/images/faded_logo.png", package: App.pkg),
          ),
          Positioned(
              child: Align(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Image.asset("assets/images/newlogo.png",
                      width: 30, height: 30, package: App.pkg),
                ),
                SizedBox(
                  width: 10,
                ),
                SvgPicture.asset("assets/svg/mymedicines.svg",
                    package: App.pkg),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
