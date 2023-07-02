import 'package:flutter/material.dart';
import 'package:shared/env.dart';

import 'app.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  static const String _pkg = "parceldrop";
  static String get pkg => Env.getPackage(_pkg);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Parcel Drop',
      home: MyApp(),
    );
  }
}
