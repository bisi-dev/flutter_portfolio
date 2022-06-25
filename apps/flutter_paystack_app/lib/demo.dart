import 'package:flutter/material.dart';
import 'package:flutter_paystack_app/screens/checkout.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutterwave',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: CheckOutPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}