import 'package:flutter/material.dart';
import 'package:shared/env.dart';

import 'demo.dart';

void main() => runApp(App());

class App extends StatelessWidget {

  static String _pkg = "mymedicinemobile";
  static String get pkg => Env.getPackage(_pkg);

  @override
  Widget build(BuildContext context) {
    const title = 'Boiler App';
    return MaterialApp(
      title: title,
      home: MyApp(),
    );
  }
}
