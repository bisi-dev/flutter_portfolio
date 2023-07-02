import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../main.dart';
import 'get_started_screen.dart';
import 'shape/bezier_container.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _pageController;
  int currentIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              left: MediaQuery.of(context).size.width * .20,
              top: -MediaQuery.of(context).size.height * .25,
              child: const BezierContainer(
                divisorPi: 3.5,
                divisorHeight: .5,
              )),
          PageView(
            scrollDirection: Axis.horizontal,
            controller: _pageController,
            onPageChanged: (value) {
              setState(() {
                currentIndex = value;
              });
            },
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 240),
                  SvgPicture.asset(
                    "assets/svg/onboarding-1.svg",
                    package: App.pkg,
                  ),
                  SizedBox(height: 70),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 45),
                    child: const Text(
                      "Easy and fast courier pickups and delivery"
                      " for all kinds of packages nationwide. Whether a parcel or an apartment "
                      "move, we got you covered.",
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 240),
                  SvgPicture.asset(
                    "assets/svg/onboarding-2.svg",
                    package: App.pkg,
                  ),
                  SizedBox(height: 70),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 45),
                    child: SizedBox(
                      height: 64,
                      width: 300,
                      child: const Text(
                        "Real time tracking for all pickups and "
                        "deliveries that keeps you updated through your orders.",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
          Positioned(
            top: 630,
            left: 165,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(2, (index) => buildDot(index, context)),
            ),
          ),
          Positioned(
            top: 680,
            left: 165,
            child: SizedBox(
              height: 60,
              width: 60,
              child: ElevatedButton(
                onPressed: () {
                  if (currentIndex == 1) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const GetStartedScreen(),
                      ),
                    );
                  } else {
                    _pageController.nextPage(
                        duration: const Duration(seconds: 2),
                        curve: Curves.ease);
                  }
                },
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  elevation: 0,
                  backgroundColor: Color(0xFF4661E4),
                ),
                child: SvgPicture.asset(
                  "assets/svg/arrow-right.svg",
                  package: App.pkg,
                ),
              ),
            ),
          ),
          Positioned(
            left: -MediaQuery.of(context).size.width * .5,
            bottom: -MediaQuery.of(context).size.height * .2,
            child: const BezierContainer(
              divisorPi: 0.8,
              divisorHeight: .5,
            ),
          ),
        ],
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 25 : 10,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0xFF4661E4),
      ),
    );
  }
}
