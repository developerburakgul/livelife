import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:livelife/Controller/HomeViewController.dart';
import 'package:livelife/Controller/LoginViewController.dart';

import 'package:livelife/Controller/TabBarViewController.dart';
import 'package:livelife/Models/gender.dart';
import 'package:livelife/Views/Screens/SignUPView.dart';

class SignUPViewController extends StatefulWidget {
  @override
  _SignUPViewControllerState createState() => _SignUPViewControllerState();
}

class _SignUPViewControllerState extends State<SignUPViewController> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  Gender _gender = Gender.male;

  void _signUP() async {
    String username = _usernameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;
    String age = _ageController.text;
    Gender gender = _gender;
    if (email.isNotEmpty &&
        password.isNotEmpty &&
        username.isNotEmpty &&
        age.isNotEmpty) {
      // Simülasyon: Kullanıcı bilgilerini kontrol edin
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => TabBarViewController(userId: "123")),
      );
      Fluttertoast.showToast(
          msg: "Kayıt Başarılı! Ana sayfaya yönlendiriliyorsunuz.",
          toastLength: Toast.LENGTH_SHORT);
    } else {
      // Eksik bilgi varsa kullanıcıyı uyar
      Fluttertoast.showToast(
          msg: "Lütfen tüm alanları doldurun!",
          toastLength: Toast.LENGTH_SHORT);
    }
  }

  void _goToLoginPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginViewController()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SignUpView(
        usernameController: _usernameController,
        emailController: _emailController,
        passwordController: _passwordController,
        ageController: _ageController,
        gender: _gender,
        onGenderChanged: (Gender newGender) {
          setState(() {
            _gender = newGender;
          });
        },
        onSignUpPressed: _signUP,
        onGoToLoginPressed: _goToLoginPage);
  }
}
