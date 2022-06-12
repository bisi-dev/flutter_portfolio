import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_showcase/flutter_showcase.dart';

import 'package:mymedicinemobile/demo.dart' deferred as mymedicinemobile;
import 'package:shared/env.dart';

class TemplateApp extends StatefulWidget {
  final _TemplateApp app;
  final TemplateThemeData theme;

  const TemplateApp({Key key, this.app, this.theme}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AppState();
}

class _AppState extends State<TemplateApp> {
  @override
  void initState() {
    Env.isGalleryActive = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: widget.app.loadLibrary(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return MaterialApp(
              builder: Frame.builder,
              debugShowCheckedModeBanner: false,
              home: widget.app.page(context),
            );
          } else {
            return Frame.builder(
                context, Container(color: widget.theme.backgroundColor));
          }
        });
  }
}

class _TemplateApp {
  final String title;

  final String description;

  final String githubUrl;

  final String codePenUrl;

  final String playStoreUrl;

  final Future<dynamic> Function() loadLibrary;

  final WidgetBuilder page;

  final TemplateThemeData theme;

  _TemplateApp(
      {this.title,
      this.description,
      this.githubUrl,
      this.loadLibrary,
      this.page,
      this.theme,
      this.playStoreUrl,
      this.codePenUrl});

  Widget get showcase => Showcase(
        key: Key('showcase: $title'),
        title: title,
        template: SimpleTemplate(),
        app: TemplateApp(
          app: this,
          theme: theme,
        ),
        theme: theme,
        description: description,
        links: [
          if (githubUrl != null) LinkData.github(githubUrl),
          if (codePenUrl != null) LinkData.codePen(codePenUrl),
          if (playStoreUrl != null) LinkData(
            url: playStoreUrl,
            title: 'Google PlayStore',
            icon: Opacity(
              opacity: 0.8,
              child: Padding(
                  padding: EdgeInsets.only(top: 0),
                  child: Image.asset(
                    'assets/logo-google-play.png',
                    fit: BoxFit.fitHeight,
                  )),
            ),
          ),
        ],
      );
}

class TemplateApps {
  static _TemplateApp myMedicineMobile = _TemplateApp(
    title: 'myMedicines',
    description: ''' 
Team - Commercial Project

myMedicines is an eCommerce mobile app for medicines where individuals visit and can add multiple medicines, devices and other items to their cart, upload prescriptions where necessary and make payments for their medicines. 

This is a commercial app for a client. Please visit the playstore to use.
    ''',
    playStoreUrl:
        'https://play.google.com/store/apps/details?id=co.mymedicine.co.mymedicinemobile',
    loadLibrary: mymedicinemobile.loadLibrary,
    page: (_) => mymedicinemobile.MyApp(),
    theme: TemplateThemeData(
        brightness: Brightness.light,
        buttonTheme: ButtonThemeData(
          buttonColor: Color(0xFF083e64),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          textTheme: ButtonTextTheme.accent,
          padding: EdgeInsets.all(16),
        ),
        flutterLogoColor: FlutterLogoColor.original,
        descriptionTextStyle: TextStyle(
            color: Color(0xFF083e64),
            fontWeight: FontWeight.w300,
            fontFamily: 'OpenSans',
            package: 'gooey_edge'),
        titleTextStyle: TextStyle(
            color: Color(0xFF212121),
            fontFamily: 'OpenSans',
            fontSize: 50,
            fontWeight: FontWeight.w700,
            package: 'mymedicinemobile'),
        backgroundColor: Color(0xFFf0f0f0),
        buttonTextStyle: TextStyle(
            fontSize: 16,
            letterSpacing: .8,
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.w600,
            color: Colors.white,
            package: 'mymedicinemobile'),
        buttonIconTheme: IconThemeData(color: Colors.white)),
  );

  static _TemplateApp defiScan = _TemplateApp(
    title: 'DeFi Scan',
    description: ''' 
Personal Project

DeFi Scan is a multi-purpose mobile block chain explorer app where individuals can search, explore, curate & store records of multiple cryptocurrency accounts in one overview.

This is a personal project. The full app is embedded on this site. You can also visit the playstore to use.
    ''',
    playStoreUrl:
    'https://play.google.com/store/apps/details?id=dev.bisi.defiscan',
    loadLibrary: mymedicinemobile.loadLibrary,
    page: (_) => mymedicinemobile.MyApp(),
    theme: TemplateThemeData(
        brightness: Brightness.light,
        buttonTheme: ButtonThemeData(
          buttonColor: Color(0xFF083e64),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          textTheme: ButtonTextTheme.accent,
          padding: EdgeInsets.all(16),
        ),
        flutterLogoColor: FlutterLogoColor.original,
        descriptionTextStyle: TextStyle(
            color: Color(0xFF083e64),
            fontWeight: FontWeight.w300,
            fontFamily: 'OpenSans',
            package: 'gooey_edge'),
        titleTextStyle: TextStyle(
            color: Color(0xFF212121),
            fontFamily: 'OpenSans',
            fontSize: 50,
            fontWeight: FontWeight.w700,
            package: 'mymedicinemobile'),
        backgroundColor: Color(0xFFf0f0f0),
        buttonTextStyle: TextStyle(
            fontSize: 16,
            letterSpacing: .8,
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.w600,
            color: Colors.white,
            package: 'mymedicinemobile'),
        buttonIconTheme: IconThemeData(color: Colors.white)),
  );

  static List<_TemplateApp> values = [
    myMedicineMobile,
    defiScan
  ];
}
