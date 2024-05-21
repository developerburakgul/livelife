import 'package:flutter/material.dart';
import 'package:livelife/Controller/SignUPViewController.dart';
import 'package:livelife/Views/Screens/IntroView.dart';
import 'package:livelife/Views/Screens/SignUPView.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroViewController extends StatefulWidget {
  @override
  _IntroViewControllerState createState() => _IntroViewControllerState();
}

class _IntroViewControllerState extends State<IntroViewController> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  bool _showIntro = true;

  @override
  void initState() {
    super.initState();
    _checkIntroStatus();
  }

  void _checkIntroStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _showIntro = prefs.getBool('showIntro') ?? true;
    setState(() {});
  }

  void _saveIntroStatus(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('showIntro', value);
  }

  void onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  void onStartPressed() {
    _saveIntroStatus(_showIntro);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => SignUPViewController()),
    );
  

  }

  void onShowIntroChanged(bool? value) {
    setState(() {
      _showIntro = value ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return IntroView(
      pageController: _pageController,
      currentPage: _currentPage,
      showIntro: _showIntro,
      onPageChanged: onPageChanged,
      onStartPressed: onStartPressed,
      onShowIntroChanged: onShowIntroChanged,
    );
  }
}
