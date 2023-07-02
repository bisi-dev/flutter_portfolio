import 'package:flutter/material.dart';
import 'package:shared/env.dart';

import 'app.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  static String _pkg = "defiscan";
  static String get pkg => Env.getPackage(_pkg);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeFi Scan',
      home: MyApp(),
    );
  }
}
