import 'package:flutter/material.dart';
import 'package:flutter_settings_ui/flutter_settings_ui.dart';

import 'package:defiscan/core/prefs.dart';
import 'package:defiscan/theme/app_theme.dart';

import 'languages.dart';
import 'currencies.dart';
import 'networks.dart';
import '../../main.dart';

import 'dart:js' as js;

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool lockInBackground = true;
  bool notificationsEnabled = true;
  AppPreference appPreference = AppPreference();
  String language = '';
  String currency = '';
  int popIndex;

  @override
  void initState() {
    setUp();
    super.initState();
  }

  void setUp() async {
    String selectedLanguage = await appPreference.getLanguage();
    List selectedCurrency = await appPreference.getCurrency();
    setState(() {
      language = selectedLanguage;
      currency = selectedCurrency[2];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.buildLightTheme().scaffoldBackgroundColor,
        centerTitle: true,
        title: const Text(
          'Settings',
          style: TextStyle(color: Colors.blue),
        ),
        elevation: 0,
      ),
      body: buildSettingsList(),
    );
  }

  Widget buildSettingsList() {
    return Container(
      color: AppTheme.buildLightTheme().backgroundColor,
      padding: const EdgeInsets.only(top: 10.0),
      child: SettingsList(
        backgroundColor: Colors.white,
        sections: [
          SettingsSection(
            title: 'App',
            tiles: [
              SettingsTile(
                title: 'Language',
                subtitle: '$language',
                leading: const Icon(Icons.language),
                onPressed: (context) async {
                  var i = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LanguagesScreen();
                      },
                    ),
                  );
                  if (i != null) {
                    setUp();
                  }
                },
              ),
              SettingsTile(
                title: 'Currency',
                subtitle: '$currency',
                leading: const Icon(Icons.currency_exchange),
                onPressed: (context) async {
                  var index = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return CurrenciesScreen();
                      },
                    ),
                  );
                  if (index != null) {
                    setUp();
                  }
                },
              ),
              SettingsTile(
                title: 'Networks',
                subtitle: 'Select BlockChain Networks',
                leading: const Icon(Icons.currency_bitcoin),
                onPressed: (context) {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => NetworksScreen(),
                  ));
                },
              ),
              // SettingsTile(
              //   title: 'Theme',
              //   subtitle: 'Choose App Theme',
              //   leading: const Icon(Icons.dark_mode),
              // ),
            ],
          ),
          // SettingsSection(
          //   title: 'Account',
          //   tiles: [
          //     SettingsTile(title: 'Phone number', leading: Icon(Icons.phone)),
          //     SettingsTile(title: 'Email', leading: Icon(Icons.email)),
          //     SettingsTile(title: 'Sign out', leading: Icon(Icons.exit_to_app)),
          //   ],
          // ),
          // SettingsSection(
          //   title: 'Device',
          //   tiles: [
          //     SettingsTile.switchTile(
          //       title: 'Copied Accounts',
          //       subtitleWidget: Text('Identify accounts copied outside app'),
          //       leading: const Icon(Icons.copy_sharp),
          //       switchValue: lockInBackground,
          //       onToggle: (bool value) {
          //         setState(() {
          //           lockInBackground = value;
          //           notificationsEnabled = value;
          //         });
          //       },
          //     ),
          //   ],
          // ),
          SettingsSection(
            title: 'More',
            tiles: [
              SettingsTile(
                  title: 'Rate App on Playstore',
                  leading: Icon(Icons.rate_review_outlined),
                onPressed: (context) {
                  js.context.callMethod('open', ['https://play.google.com/store/apps/details?id=dev.bisi.defiscan']);
                },
              ),
              // SettingsTile(
              //     title: 'Open source licenses',
              //     leading: Icon(Icons.collections_bookmark)),
            ],
          ),
          CustomSection(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 22, bottom: 8),
                  child: Image.asset(
                    'assets/images/settings.png',
                    height: 50,
                    width: 50,
                      package: App.pkg,
                    color: const Color(0xFF777777),
                  ),
                ),
                const Text(
                  'Version: 1.0.0 (1)',
                  style: TextStyle(color: Color(0xFF777777)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
