import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Intro extends StatefulWidget {
  @override
  _Intro createState() => _Intro();
}

class _Intro extends State<Intro> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(),
      ),
    );
  }
}
