

import 'package:flutter/material.dart';
import 'package:livelife/Controller/HomeViewController.dart';
import 'package:livelife/Controller/SettingsViewController.dart';
import 'package:livelife/Controller/TimerViewController.dart';
import 'package:livelife/Views/Screens/CustomTabBarView.dart';
import 'package:livelife/Views/Screens/HomeView.dart';
import 'package:livelife/Views/Screens/SettingsView.dart';
import 'package:livelife/Views/Screens/TimerView.dart';

class TabBarViewController extends StatefulWidget {
  final String userId;

  TabBarViewController({Key? key, required this.userId}) : super(key: key);

  @override
  _TabBarViewControllerState createState() => _TabBarViewControllerState();
}

class _TabBarViewControllerState extends State<TabBarViewController> {
  int _selectedIndex = 1;
  final List<GlobalKey<NavigatorState>> _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];

  void _onItemTapped(int index) {
    if (index == _selectedIndex) {
      _navigatorKeys[index].currentState?.popUntil((route) => route.isFirst);
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  Future<bool> _onWillPop() async {
    final isFirstRouteInCurrentTab =
        !await _navigatorKeys[_selectedIndex].currentState!.maybePop();
    if (isFirstRouteInCurrentTab) {
      if (_selectedIndex != 1) {
        _onItemTapped(1);
        return false;
      }
    }
    return isFirstRouteInCurrentTab;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetOptions = [
      _buildNavigator(TimerViewController(), _navigatorKeys[0]),
      _buildNavigator(
          HomeViewController(userId: widget.userId), _navigatorKeys[1]),
      _buildNavigator(
          SettingsViewController(userId: widget.userId), _navigatorKeys[2]),
    ];

    return WillPopScope(
      onWillPop: _onWillPop,
      child: CustomTabBarView(
        widgetOptions: _widgetOptions,
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }

  Widget _buildNavigator(Widget child, GlobalKey<NavigatorState> navigatorKey) {
    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
          builder: (context) => child,
          settings: routeSettings,
        );
      },
    );
  }
}






