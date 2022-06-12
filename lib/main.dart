// @dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'apps/template.dart';
import 'indicator/smooth_page_indicator.dart';
import 'indicator/effects/expanding_dots_effect.dart';
import 'package:flutter_showcase/flutter_showcase.dart';

void main() => runApp(Examples());
String name = 'Ayodeji Olabisi';

class Examples extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ExamplesState();
}

class _ExamplesState extends State<Examples> {
  PageController pageController;
  @override
  void initState() {
    pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.ltr,
        child: Stack(children: [
          PageView.builder(
              controller: pageController,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                if (index > 0 && index <= TemplateApps.values.length) {
                  final app = TemplateApps.values[index - 1];
                  return app.showcase;
                } else {
                  return Showcase(
                    title: 'Flutter Portfolio',
                    app: MyApp(pageController: pageController),
                    description: '''
$name

Built with Flutter Showcase Package      
                  ''',
                    template: SimpleTemplate(reverse: false),
                    theme: TemplateThemeData(
                      backgroundColor: Colors.grey[100],
                      titleTextStyle: TextStyle(fontWeight: FontWeight.w700),
                      descriptionTextStyle: TextStyle(
                          fontSize: 24,
                          height: 1.2,
                          fontWeight: FontWeight.w200),
                      buttonTheme: ButtonThemeData(
                        buttonColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4)),
                        textTheme: ButtonTextTheme.accent,
                        padding: EdgeInsets.all(16),
                      ),
                        buttonTextStyle: TextStyle(
                            fontSize: 16,
                            letterSpacing: .8,
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            package: 'mymedicinemobile'),
                        buttonIconTheme: IconThemeData(color: Colors.black)
                    ),
                    links: [
                      LinkData.github('https://github.com/bisi-dev'),
                      LinkData(
                        url: 'https://bisi.dev/',
                        title: 'Home Portfolio',
                        icon: Opacity(
                          opacity: 0.8,
                          child: Padding(
                              padding: EdgeInsets.only(top: 0),
                              child: Image.asset(
                                'assets/logo.png',
                                fit: BoxFit.fitHeight,
                              )),
                        ),
                      ),
                    ],
                    logoLink: LinkData(
                      url: 'https://flutter.gskinner.com/',
                      icon: Opacity(
                        opacity: 0.8,
                        child: Padding(
                            padding: EdgeInsets.only(top: 0),
                            child: Image.asset(
                              'assets/logo-gskinner.png',
                              fit: BoxFit.fitHeight,
                            )),
                      ),
                    ),
                  );
                }
              },
              itemCount: 1 + TemplateApps.values.length),
          Align(
              alignment: Alignment.centerRight,
              child: Padding(
                  padding: EdgeInsets.all(20),
                  child: SmoothPageIndicator(
                      controller: pageController,
                      count: 1 + TemplateApps.values.length,
                      effect: ExpandingDotsEffect(
                          radius: 14,
                          dotHeight: 10,
                          dotWidth: 10,
                          dotColor: Colors.black12,
                          activeDotColor: Colors.black87))))
        ]));
  }
}

class MyApp extends StatelessWidget {
  final PageController pageController;
  const MyApp({Key key, this.pageController}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: '$name',
        builder: (context, child) =>
            FrameBuilder(app: child, builder: Frame.builder),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(accentColor: Colors.black, primaryColor: Colors.white),
        home: MyHomePage(title: '$name', pageController: pageController));
  }
}

class MyHomePage extends StatefulWidget {
  final PageController pageController;
  MyHomePage({Key key, this.title, this.pageController}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
          Text('Hi All !',
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  .copyWith(color: Colors.black87)),
          SizedBox(height: 8),
          Text('I am $name.', style: TextStyle(fontSize: 20)),
          Text('An experienced flutter developer.', style: TextStyle(fontSize: 20)),
          SizedBox(
            height: 24,
          ),
          Text('This site contains a live embed',
              style: TextStyle(fontSize: 20)),
          Text('of some of my works and previews of',
              style: TextStyle(fontSize: 20)),
          Text('commercial projects.', style: TextStyle(fontSize: 20)),
          SizedBox(height: 200),
          Text('Scroll down\nto explore',
              style: TextStyle(fontSize: 20), textAlign: TextAlign.center),
          SizedBox(height: 20),
          FloatingActionButton(
              onPressed: () => widget.pageController?.animateToPage(1,
                  duration: Duration(seconds: 1), curve: Curves.easeInOutQuart),
              tooltip: 'Scroll',
              child: Icon(Icons.arrow_downward))
        ])));
  }
}
