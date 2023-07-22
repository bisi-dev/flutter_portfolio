import 'package:aella/app.dart' deferred as aella;
import 'package:defiscan/app.dart' deferred as defiscan;
import 'package:flutter/material.dart';
import 'package:flutter_showcase/flutter_showcase.dart';
import 'package:mymedicinemobile/app.dart' deferred as mymedicinemobile;
import 'package:parceldrop/app.dart' deferred as parceldrop;
import 'package:shared/env.dart';

class TemplateApp extends StatefulWidget {
  final _TemplateApp app;
  final TemplateThemeData theme;

  const TemplateApp({Key? key, required this.app, required this.theme})
      : super(key: key);

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
            context,
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Installing...',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 16),
                SizedBox(
                  width: 200,
                  child: LinearProgressIndicator(value: 0.5),
                )
              ],
            ),
          );
        }
      },
    );
  }
}

class _TemplateApp {
  final String title;
  final String description;
  final String? githubUrl;
  final String? playStoreUrl;
  final String? appStoreUrl;
  final String? articleUrl;
  final Future<dynamic> Function() loadLibrary;
  final WidgetBuilder page;
  final TemplateThemeData theme;

  _TemplateApp({
    required this.title,
    required this.description,
    this.githubUrl,
    required this.loadLibrary,
    required this.page,
    required this.theme,
    this.playStoreUrl,
    this.appStoreUrl,
    this.articleUrl,
  });

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
          if (githubUrl != null) LinkData.github(githubUrl!),
          if (playStoreUrl != null)
            LinkData(
              url: playStoreUrl!,
              title: 'Google PlayStore',
              icon: Opacity(
                opacity: 0.8,
                child: Padding(
                  padding: const EdgeInsets.only(top: 0),
                  child: Image.asset(
                    'assets/logo-google-play.png',
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ),
          if (appStoreUrl != null)
            LinkData(
              url: appStoreUrl!,
              title: 'App Store',
              icon: Opacity(
                opacity: 0.8,
                child: Padding(
                  padding: const EdgeInsets.only(top: 0),
                  child: Image.asset(
                    'assets/logo-app-store.png',
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ),
          if (articleUrl != null)
            LinkData(
              url: articleUrl!,
              title: 'Read Article',
              icon: Opacity(
                opacity: 0.8,
                child: Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: Image.asset(
                      'assets/logo-white.png',
                      fit: BoxFit.fitHeight,
                    )),
              ),
            ),
        ],
        logoLink: LinkData(icon: const SizedBox(), url: '', title: ''),
      );
}

class TemplateApps {
  static List<_TemplateApp> values = [
    aellaCredit,
    defiScan,
    parcel,
    myMedicineMobile,
  ];

  static _TemplateApp aellaCredit = _TemplateApp(
    title: 'Aella App',
    description: '''
Work - Commercial Project

This is a fintech app built for Aella (YC 15).
Aella is a diversified credit payments platform with over 2 million users, offering a raft of financial services to underbanked users across emerging markets with a focus on lending. 

This is a commercial app for Aella. [Demo only includes Splash Screen]. 
Please visit the store to use.
    ''',
    playStoreUrl:
        'https://play.google.com/store/apps/details?id=com.aella.comportal',
    appStoreUrl: 'https://apps.apple.com/ng/app/aella-app/id1498675625',
    loadLibrary: aella.loadLibrary,
    page: (_) => aella.MyApp(),
    theme: appTheme,
  );

  static _TemplateApp defiScan = _TemplateApp(
    title: 'DeFi Scan',
    description: ('''
Personal - Commercial Project

DeFi Scan is a multi-purpose mobile block chain explorer app where individuals can search, explore, curate & store records of multiple cryptocurrency accounts in one overview.

This is a personal project. An extensive preview is embedded on this site.
The full source code is hosted on GitHub. 
You can also visit the App store to use.
    '''),
    appStoreUrl:
        'https://apps.apple.com/ng/app/defi-scan/id1644035976?platform=iphone',
    githubUrl: 'https://github.com/bisi-dev/defiscan',
    loadLibrary: defiscan.loadLibrary,
    page: (_) => defiscan.MyApp(),
    theme: appTheme,
  );

  static _TemplateApp parcel = _TemplateApp(
    title: 'Parcel Drop',
    description: ('''
Work - Commercial Project

This is a mobility-as-a-service MVP built for a client.
ParcelDrop involves real-time tracking package delivery for persons and businesses.

This is a commercial app for a client. [Demo only includes Splash + Onboarding Screens]. 
Please visit the App store to use.
    '''),
    appStoreUrl: 'https://apps.apple.com/app/parceldrop/id1666680880',
    loadLibrary: parceldrop.loadLibrary,
    page: (_) => parceldrop.MyApp(),
    theme: appTheme,
  );

  static _TemplateApp myMedicineMobile = _TemplateApp(
    title: 'myMedicines',
    description: '''
Work - Commercial Project

This is a health-tech app built for MyMedicines
myMedicines is an eCommerce mobile app for medicines where individuals visit and can add multiple medicines, devices and other items to their cart, upload prescriptions where necessary and make payments for their medicines.

This is a commercial app for a client. [Demo only includes Splash + Onboarding Screens]. 
Please visit the playstore to use.
    ''',
    playStoreUrl:
        'https://play.google.com/store/apps/details?id=co.mymedicine.co.mymedicinemobile',
    loadLibrary: mymedicinemobile.loadLibrary,
    page: (_) => mymedicinemobile.MyApp(),
    theme: appTheme,
  );
}

TemplateThemeData appTheme = TemplateThemeData(
  buttonTheme: ButtonThemeData(
    colorScheme:
        const ColorScheme.light().copyWith(background: const Color(0xFF083E64)),
    buttonColor: const Color(0xFF083E64),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    textTheme: ButtonTextTheme.accent,
    padding: const EdgeInsets.all(16),
  ),
  descriptionTextStyle: const TextStyle(
    color: Color(0xFF083E64),
    fontWeight: FontWeight.w300,
    fontFamily: 'OpenSans',
  ),
  titleTextStyle: const TextStyle(
    color: Color(0xFF212121),
    fontFamily: 'OpenSans',
    fontSize: 50,
    fontWeight: FontWeight.w700,
  ),
  backgroundColor: const Color(0xFFF0F0F0),
  buttonTextStyle: const TextStyle(
    fontSize: 16,
    letterSpacing: .8,
    fontFamily: 'OpenSans',
    fontWeight: FontWeight.w600,
    color: Colors.white,
  ),
  buttonIconTheme: const IconThemeData(color: Colors.white),
);
