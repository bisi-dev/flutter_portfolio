import 'package:flutter/material.dart';
import 'package:flutter_portfolio/indicator/smooth_page_indicator.dart';

import '../apps/template.dart';
import 'effects/expanding_dots_effect.dart';

class ScrollIndicator extends StatelessWidget {
  const ScrollIndicator(
      {Key? key, required this.showIndex, required this.pageController})
      : super(key: key);

  final int showIndex;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Visibility(
              visible: showIndex != 0,
              child: OutlinedButton(
                  onPressed: () => pageController.previousPage(
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeInOutQuart),
                  child: const Icon(
                    Icons.arrow_upward,
                    color: Colors.black87,
                  ),
                  style: OutlinedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(4),
                  )),
            ),
            const SizedBox(height: 5),
            SmoothPageIndicator(
              controller: pageController,
              count: 1 + TemplateApps.values.length,
              effect: const ExpandingDotsEffect(
                radius: 14,
                dotHeight: 10,
                dotWidth: 10,
                dotColor: Colors.black12,
                activeDotColor: Colors.black87,
              ),
            ),
            const SizedBox(height: 5),
            Visibility(
              visible: showIndex != TemplateApps.values.length,
              child: OutlinedButton(
                onPressed: () => pageController.nextPage(
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeInOutQuart),
                child: const Icon(
                  Icons.arrow_downward,
                  color: Colors.black87,
                ),
                style: OutlinedButton.styleFrom(
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(4),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
