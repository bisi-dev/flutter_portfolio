import 'package:flutter/material.dart';
import 'package:flutter_showcase/flutter_showcase.dart';

String name = 'Ayodeji Olabisi';

class Home extends StatelessWidget {
  const Home({Key? key, required this.pageController}) : super(key: key);

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Showcase(
      title: 'Flutter Portfolio',
      app: MyApp(pageController: pageController),
      description: '''
$name

Built with Flutter Showcase Package to showcase my proficiency in:

• Flutter cross-platform mobile app development.
• REST API, Firebase, and GraphQL integration.
• Technical Writing and Documentation
• Managing app lifecycle from Figma sketches to app stores.
• Handling complex state and state management solutions with BloC, Provider.
• Dart language, Dev tools, Version Control (Git), and CI/CD tools (CodeMagic, BitRise, Github Actions).
                  ''',
      template: SimpleTemplate(reverse: false),
      theme: TemplateThemeData(
        backgroundColor: Colors.grey[100],
        titleTextStyle: const TextStyle(fontWeight: FontWeight.w700),
        descriptionTextStyle: const TextStyle(
          fontSize: 18,
          height: 1.75,
          fontWeight: FontWeight.w200,
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          textTheme: ButtonTextTheme.accent,
          padding: const EdgeInsets.all(16),
        ),
        buttonTextStyle: const TextStyle(
          fontSize: 16,
          letterSpacing: .8,
          fontFamily: 'OpenSans',
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
        buttonIconTheme: const IconThemeData(color: Colors.black),
      ),
      links: [
        LinkData.github('https://github.com/bisi-dev'),
        LinkData(
          url: 'https://bisi.dev/',
          title: 'Home Portfolio',
          icon: Opacity(
            opacity: 0.8,
            child: Padding(
                padding: const EdgeInsets.only(top: 0),
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
              padding: const EdgeInsets.only(top: 0),
              child: Image.asset(
                'assets/logo-gskinner.png',
                fit: BoxFit.fitHeight,
              )),
        ),
        title: 'GSkinner',
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  final PageController pageController;
  const MyApp({Key? key, required this.pageController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: name,
      builder: (context, child) =>
          FrameBuilder(app: child ?? const SizedBox(), builder: Frame.builder),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(hintColor: Colors.black, primaryColor: Colors.white),
      home: MyHomePage(pageController: pageController),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final PageController pageController;
  const MyHomePage({Key? key, required this.pageController}) : super(key: key);

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
            Text(
              'Hi All !',
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium
                  ?.copyWith(color: Colors.black87),
            ),
            const SizedBox(height: 8),
            Text('I am $name.', style: const TextStyle(fontSize: 20)),
            const Text('An experienced flutter developer.', style: style),
            const SizedBox(height: 24),
            const Text(
              'This site contains a live embed \nof some of my works and previews of \ncommercial projects.',
              style: style,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 200),
            const Text(
              'Scroll down\nto explore',
              style: style,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            FloatingActionButton(
              backgroundColor: Colors.black,
              onPressed: () => widget.pageController.animateToPage(1,
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeInOutQuart),
              tooltip: 'Scroll',
              child: const Icon(Icons.arrow_downward),
            )
          ],
        ),
      ),
    );
  }

  static const TextStyle style = TextStyle(fontSize: 20);
}
