import 'package:flutter/material.dart';
import 'package:livelife/Controller/IntroViewController.dart';
import 'package:livelife/Controller/LoginViewController.dart';
import 'package:livelife/Controller/SignUPViewController.dart';
import 'package:livelife/Views/Screens/SignUPView.dart';
import 'package:livelife/Views/Screens/SettingsView.dart';

class SettingsViewController extends StatefulWidget {
  final String userId;

  SettingsViewController({Key? key, required this.userId}) : super(key: key);

  @override
  _SettingsViewControllerState createState() => _SettingsViewControllerState();
}

class _SettingsViewControllerState extends State<SettingsViewController> {
  bool isProfileExpanded = false;
  bool isSwitchedTheme = false;
  bool isSwitchedNotifications = false;

  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _genderController = TextEditingController();
  final _ageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    print("Kullanıcı ID: ${widget.userId}");
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _genderController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  void toggleTheme(bool value) {
    setState(() {
      isSwitchedTheme = value;
    });
  }

  void toggleNotifications(bool value) {
    setState(() {
      isSwitchedNotifications = value;
    });
  }

  void navigateToSignUp(BuildContext context) {
    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignUPViewController()));
    // Navigator.of(context, rootNavigator: true).pushReplacement(
    //     MaterialPageRoute(builder: (context) => LoginViewController()));
    Navigator.of(context, rootNavigator: true).pop();
  }

  @override
  Widget build(BuildContext context) {
    return SettingsView(
      isSwitchedTheme: isSwitchedTheme,
      isSwitchedNotifications: isSwitchedNotifications,
      usernameController: _usernameController,
      emailController: _emailController,
      genderController: _genderController,
      ageController: _ageController,
      onThemeChanged: toggleTheme,
      onNotificationsChanged: toggleNotifications,
      onLogoutPressed: () => navigateToSignUp(context),
    );
  }
}
