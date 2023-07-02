import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants.dart';
import '../main.dart';
import '../text_style.dart';

class StartAuthPage extends StatefulWidget {
  const StartAuthPage({Key? key}) : super(key: key);

  @override
  _StartAuthPage createState() => _StartAuthPage();
}

class _StartAuthPage extends State<StartAuthPage> {
  @override
  void initState() {
    super.initState();
  }

  void playstoreAlert() {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      backgroundColor: kPrimaryColor,
      duration: Duration(seconds: 4),
      content: Text(
          'This is a commercial app owned by myMedicines. Visit PlayStore to Continue'),
    ));
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: kColorWhite,
      body: SafeArea(
        child: SizedBox(
          width: width,
          height: height,
          child: Stack(
            children: [
              Positioned(
                top: height / 4,
                left: 20,
                right: 20,
                bottom: 0,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset("assets/images/newlogo.png",
                            width: 30, height: 30, package: App.pkg),
                        const SizedBox(width: 5),
                        SvgPicture.asset(
                          "assets/svg/mymedicines.svg",
                          height: 20,
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
                    const SizedBox(height: 100),
                    InkWell(
                      onTap: () {
                        playstoreAlert();
                      },
                      child: Container(
                        width: width,
                        height: 40,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: kPrimaryColor,
                          ),
                          color: kPrimaryColor,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8.0)),
                        ),
                        child: Center(
                          child: Text(
                            "GET STARTED",
                            style: kmediumTextBold(kColorWhite),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    InkWell(
                      onTap: () {
                        playstoreAlert();
                      },
                      child: Container(
                        width: width,
                        height: 40,
                        decoration: BoxDecoration(
                          color: kColorWhite,
                          border: Border.all(
                              width: .8,
                              color: kPrimaryColor,
                              style: BorderStyle.solid),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8.0)),
                        ),
                        child: Center(
                          child: Text(
                            "LOG IN",
                            style: kmediumTextBold(kPrimaryColor),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
