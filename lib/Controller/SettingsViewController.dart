import 'package:flutter/material.dart';
import 'package:livelife/Views/Screens/SettingsView.dart'; // SettingsView dosyasının doğru path'ini yazın
import 'package:image_picker/image_picker.dart';
import 'dart:io';

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
  File? _profileImage;

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
    Navigator.of(context, rootNavigator: true).pop();
  }

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
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
      onProfileImagePressed: _pickImage,
      profileImage: _profileImage,
    );
  }
}
