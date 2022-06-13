import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/services.dart';

import 'explorer/explorer.dart';
import 'history/history.dart';
import 'settings/settings.dart';

class Home extends StatefulWidget {
  final int iD;
  const Home(this.iD);
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  int _currentIndex = 0;
  PageController _pageController;

  List<Widget> bottomPages = [
    const HistoryPage(),
    const ExplorerPage(),
    const SettingsPage(),
  ];

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
    _pageController = PageController(initialPage: widget.iD);
    _currentIndex = widget.iD;
  }

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Scaffold(
          body: SizedBox.expand(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() => _currentIndex = index);
              },
              children: bottomPages,
            ),
          ),
          bottomNavigationBar: BottomNavyBar(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            selectedIndex: _currentIndex,
            onItemSelected: (index) {
              setState(() => _currentIndex = index);
              _pageController?.jumpToPage(index);
            },
            items: <BottomNavyBarItem>[
              BottomNavyBarItem(
                  title: const Text('History'), icon: const Icon(Icons.history)),
              BottomNavyBarItem(
                  title: const Text('Explorer'), icon: const Icon(Icons.search)),
              BottomNavyBarItem(
                  title: const Text('Settings'), icon: const Icon(Icons.settings)),
            ],
          ),
        ),
      ),
    );
  }

}
