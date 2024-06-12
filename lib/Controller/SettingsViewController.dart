import 'package:flutter/material.dart';
import 'package:livelife/Controller/SignUPViewController.dart';
import 'package:livelife/Services/StorageService.dart';
import 'package:livelife/Services/UserService.dart';
import 'package:livelife/Views/Screens/SettingsView.dart'; // SettingsView dosyasının doğru path'ini yazın
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:livelife/Models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
  UserModel? _userModel;
  String? _profileImageUrl;

  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _genderController = TextEditingController();
  final _ageController = TextEditingController();
  final StorageService _storageService = StorageService();
  final UserService _userService = UserService();

  @override
  void initState() {
    super.initState();
    _loadUserData();
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
    Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => SignUPViewController()),
      (Route<dynamic> route) => false,
    );
  }

  Future<void> _pickImage() async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? pickedFile =
          await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        setState(() {
          _profileImage = File(pickedFile.path);
        });
        await _uploadProfileImage();
      }
    } catch (e) {
      print("Image picker error: $e");
      if (Platform.isIOS) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Hata"),
            content: Text("Fotoğraf seçilirken bir hata oluştu: $e"),
            actions: <Widget>[
              TextButton(
                child: Text("Tamam"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      }
    }
  }

  Future<void> _uploadProfileImage() async {
    if (_profileImage != null && _userModel != null) {
      String? imageUrl = await _storageService.uploadProfileImage(
          widget.userId, _userModel!.userName, _profileImage!);
      if (imageUrl != null) {
        setState(() {
          _profileImageUrl = imageUrl;
          _userModel!.profileImageUrl = imageUrl;
        });
        await _userService.updateUserProfileImage(widget.userId, imageUrl);
      }
    }
  }

  Future<void> _loadUserData() async {
    UserModel? userData = await _userService.loadUserData(widget.userId);
    if (userData != null) {
      setState(() {
        _userModel = userData;
        _usernameController.text = _userModel!.userName;
        _emailController.text = _userModel!.email;
        _genderController.text = _userModel!.gender?.name ?? '';
        _ageController.text = _userModel!.age?.toString() ?? '';
        _profileImageUrl = _userModel!.profileImageUrl;
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
      profileImageUrl: _profileImageUrl,
    );
  }
}
