import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home.dart';
import 'package:defiscan/screens/intro.dart';
import 'package:page_transition/page_transition.dart';

class ScreenDecider extends StatefulWidget {
  _ScreenDecider createState() => new _ScreenDecider();
}

class _ScreenDecider extends State<ScreenDecider> {
  SharedPreferences sharedPreferences;

  @override
  void initState() {
    onClose();
    super.initState();
  }

  Future<dynamic> onClose() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool installed = sharedPreferences.getBool("FirstInstall");
    if(installed != null){
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return Intro();
      }));
    }else{
      Navigator.push(context, PageTransition(type: PageTransitionType.bottomToTop, child: Home(1)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
