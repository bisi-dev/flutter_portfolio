import 'package:shared_preferences/shared_preferences.dart';

class AppPreference {

  static const themeSetting = 'THEMESETTING';
  static const languageSetting = 'LANGUAGE';
  static const currencySetting = 'CURRENCY';

  setThemePref(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(themeSetting, value);
  }

  Future<bool> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(themeSetting) ?? false;
  }

  setLanguagePref(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(languageSetting, value ?? '');
  }

  Future<String> getLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(languageSetting) ?? "Default";
  }

  setCurrencyPref(List<String> value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList(currencySetting, value);
  }

  Future<List<String>> getCurrency() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(currencySetting) ?? ['\$', 'usd', 'US Dollars', '3'];
  }

}