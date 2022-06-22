import 'package:flutter/material.dart';
import 'package:flutter_flutterwave/screens/checkout.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutterwave',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const CheckOutPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}