import 'package:defiscan/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings_ui/flutter_settings_ui.dart';

import 'package:defiscan/core/prefs.dart';

class LanguagesScreen extends StatefulWidget {
  @override
  _LanguagesScreenState createState() => _LanguagesScreenState();
}

class _LanguagesScreenState extends State<LanguagesScreen> {
  int languageIndex = 0;
  AppPreference appPreference = AppPreference();

  void changeLanguage(int index, [String language]) {
    appPreference.setLanguagePref(language);
    setState(() {
      languageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.buildLightTheme().scaffoldBackgroundColor,
        centerTitle: true,
        title: const Text('Languages', style: TextStyle(color: Colors.blue),),
        leading: IconButton(
          icon: Icon(Icons.close),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context, 0);
          },
        ),
        elevation: 0,
      ),
      body:
      SettingsList(
        backgroundColor: AppTheme.buildLightTheme().backgroundColor,
        sections: [
          SettingsSection(tiles: [
            SettingsTile(
              title: "Default",
              trailing: trailingWidget(0),
              onPressed: (BuildContext context) {
                changeLanguage(0, "Default");
              },
            ),
            // SettingsTile(
            //   title: "Spanish",
            //   trailing: trailingWidget(1),
            //   onPressed: (BuildContext context) {
            //     changeLanguage(1, "Spanish");
            //   },
            // ),
            // SettingsTile(
            //   title: "Chinese",
            //   trailing: trailingWidget(2),
            //   onPressed: (BuildContext context) {
            //     changeLanguage(2, "Chinese");
            //   },
            // ),
            // SettingsTile(
            //   title: "German",
            //   trailing: trailingWidget(3),
            //   onPressed: (BuildContext context) {
            //     changeLanguage(3, "German");
            //   },
            // ),
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

  Widget getAppBarUI() {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.buildLightTheme().backgroundColor,
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              offset: const Offset(0, 2),
              blurRadius: 4.0),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top, left: 8, right: 8),
        child: Row(
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              width: AppBar().preferredSize.height + 40,
              height: AppBar().preferredSize.height,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(32.0),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.close),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  'Filters',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                    color: AppTheme.buildLightTheme().primaryColor,
                  ),
                ),
              ),
            ),
            Container(
              width: AppBar().preferredSize.height + 40,
              height: AppBar().preferredSize.height,
            )
          ],
        ),
      ),
    );
  }
}