import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'start_auth_page.dart';

import '../constants.dart';
import '../text_style.dart';
import '../main.dart';

class IntroPage extends StatefulWidget {
  _IntroPage createState() => new _IntroPage();
}

class _IntroPage extends State<IntroPage> {
  int currentIndex = 0;
  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  void onAddButtonTapped(int index) {
    pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        backgroundColor: kColorWhite,
        body: SafeArea(
          child: Container(
              child: Stack(
            children: [
              PageView(
                controller: pageController,
                onPageChanged: (var int) {
                  setState(() {
                    currentIndex = int;
                  });
                },
                children: [
                  customView(
                      "assets/images/front1.png",
                      0,
                      "Buy medical products using voice recognition",
                      "Have access to our top and best selling medical products online "),
                  customView("assets/images/front2.png", 1, "Refill medicines",
                      "Subscribe to our plans and get access to recurring medicine refills and reminders "),
                  customView("assets/images/front3.png", 2, "Track your orders",
                      "You can track your order after checkout until delivery is done"),
                  customView(
                      "assets/images/front4.png",
                      3,
                      "Chat anonymously with a pharmacist",
                      "Our pharmacists are available to speak with you whenever you need help"),
                ],
              ),
              Positioned(
                  bottom: 45,
                  left: 20,
                  right: 20,
                  child: Container(
                    width: width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 5,
                          width: 80,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              Container(
                                width: currentIndex == 0 ? 40 : 10,
                                height: 5,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: currentIndex == 0
                                      ? kPrimaryColor
                                      : kColorSmoke,
                                ),
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Container(
                                width: currentIndex == 1 ? 40 : 10,
                                height: 5,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: currentIndex == 1
                                      ? kPrimaryColor
                                      : kColorSmoke,
                                ),
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Container(
                                width: currentIndex == 2 ? 40 : 10,
                                height: 5,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: currentIndex == 2
                                      ? kPrimaryColor
                                      : kColorSmoke,
                                ),
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: currentIndex == 3
                                      ? kPrimaryColor
                                      : kColorSmoke,
                                ),
                                width: currentIndex == 3 ? 40 : 10,
                                height: 5,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        InkWell(
                          onTap: () {
                            if (currentIndex != 3) {
                              onAddButtonTapped(currentIndex + 1);
                            } else {
                              setState(() {
                                currentIndex = 0;
                              });
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          new StartAuthPage()));
                            }
                          },
                          child: Container(
                            width: width,
                            height: 40,
                            color: kPrimaryColor,
                            child: Center(
                              child: Text(
                                "NEXT",
                                style: kmediumTextBold(kColorWhite),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ))
            ],
          )),
        ),
      ),
    );
  }

  Widget customView(String path, int index, String firstTxt, String secondTxt) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.only(left: 10, right: 10, top: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              currentIndex == 0
                  ? Text("")
                  : InkWell(
                      onTap: () {
                        onAddButtonTapped(currentIndex - 1);
                      },
                      child: SvgPicture.asset("assets/svg/back_arrow.svg",
                          package: App.pkg)),
              Row(
                children: [
                  Container(
                    child: Image.asset("assets/images/newlogo.png",
                        width: 30, height: 30, package: App.pkg),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  SvgPicture.asset("assets/svg/mymedicines.svg",
                      height: 20, package: App.pkg),
                ],
              ),
              currentIndex != 3
                  ? InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => StartAuthPage()));
                      },
                      child: Text(
                        "Skip",
                        style: kmediumText(kColorSmoke2),
                        textAlign: TextAlign.center,
                      ),
                    )
                  : Text("")
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 25),
            margin: EdgeInsets.only(left: 5, right: 5, top: 30),
            child: Column(
              children: [
                Image.asset(path, package: App.pkg),
                Text(
                  firstTxt,
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      fontFamily: "Poppins",
                      color: kColorBlack),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(secondTxt,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                        fontFamily: "Poppins",
                        color: kColorSmoke2),
                    textAlign: TextAlign.center),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
