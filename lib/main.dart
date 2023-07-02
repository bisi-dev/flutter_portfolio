import 'package:flutter/material.dart';
import 'package:flutter_portfolio/home.dart';
import 'package:flutter_portfolio/indicator/scroll_indicator.dart';

import 'apps/template.dart';

void main() => runApp(const Portfolio());

class Portfolio extends StatefulWidget {
  const Portfolio({super.key});

  @override
  State<StatefulWidget> createState() => _PortfolioState();
}

class _PortfolioState extends State<Portfolio> {
  PageController pageController = PageController(initialPage: 0);
  int showIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Stack(
        children: [
          PageView.builder(
            onPageChanged: (page) {
              setState(() => showIndex = page);
            },
            controller: pageController,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              if (index > 0 && index <= TemplateApps.values.length) {
                final app = TemplateApps.values[index - 1];
                return app.showcase;
              } else {
                return Home(pageController: pageController);
              }
            },
            itemCount: 1 + TemplateApps.values.length,
          ),
          ScrollIndicator(showIndex: showIndex, pageController: pageController),
        ],
      ),
    );
  }
}
