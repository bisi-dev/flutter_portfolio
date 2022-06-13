import 'package:defiscan/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings_ui/flutter_settings_ui.dart';

import 'package:defiscan/core/prefs.dart';

class CurrenciesScreen extends StatefulWidget {
  @override
  _CurrenciesScreenState createState() => _CurrenciesScreenState();
}

class _CurrenciesScreenState extends State<CurrenciesScreen> {
  int languageIndex = 0;
  AppPreference appPreference = AppPreference();

  void changeLanguage(int index, [List<String> language]) {
    appPreference.setCurrencyPref([
      '${language[0]}',
      '${language[1]}',
      '${language[2]}',
      '${language[3]}'
    ]);
    setState(() {
      languageIndex = index;
    });
    // Navigator.of(context).push(MaterialPageRoute(
    //   builder: (_) => Home(2),
    // ));

  }

  void setIndex() async {
    List list = await appPreference.getCurrency();
    int index = int.parse(list[3]);
    setState(() {
      languageIndex = index;
    });
  }

  @override
  void initState() {
    setIndex();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.buildLightTheme().scaffoldBackgroundColor,
        centerTitle: true,
        title: const Text(
          'Currencies',
          style: TextStyle(color: Colors.blue),
        ),
        leading: IconButton(
          icon: Icon(Icons.close),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context, 0);
          },
        ),
        elevation: 0,
      ),
      body: SettingsList(
        backgroundColor: AppTheme.buildLightTheme().backgroundColor,
        sections: [
          SettingsSection(tiles: [
            SettingsTile(
              title: "AUD - Australian Dollars",
              trailing: trailingWidget(0),
              onPressed: (BuildContext context) {
                changeLanguage(0, ['AU\$', 'aud', 'Australian Dollars', '0']);
              },
            ),
            SettingsTile(
              title: "EUR - European Euros",
              trailing: trailingWidget(1),
              onPressed: (BuildContext context) {
                changeLanguage(1, ['€', 'eur', 'European Euros', '1']);
              },
            ),
            SettingsTile(
              title: "GBP - Great British Pounds",
              trailing: trailingWidget(2),
              onPressed: (BuildContext context) {
                changeLanguage(2, ['£', 'gbp', 'Great British Pounds', '2']);
              },
            ),
            SettingsTile(
              title: "USD - United States Dollars",
              trailing: trailingWidget(3),
              onPressed: (BuildContext context) {
                changeLanguage(3, ['\$', 'usd', 'US Dollars', '3']);
              },
            ),
          ]),
        ],
      ),
    );
  }

  Widget trailingWidget(int index) {
    return (languageIndex == index)
        ? const Icon(Icons.check, color: Colors.blue)
        : const Icon(null);
  }
}
