import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:livelife/Controller/CustomPopupViewController.dart';
import 'package:livelife/Controller/HomeViewController.dart';
import 'package:livelife/Controller/LoginViewController.dart';

import 'package:livelife/Controller/TabBarViewController.dart';
import 'package:livelife/Models/gender.dart';
import 'package:livelife/Models/user_model.dart';
import 'package:livelife/Services/Exceptions/AuthExceptions.dart';
import 'package:livelife/Services/auth_service.dart';
import 'package:livelife/Utils/UtilFunctions.dart';
import 'package:livelife/Views/CustomViews/CustomPopupView.dart';
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

    try {
      if (email.isNotEmpty && password.isNotEmpty && username.isNotEmpty) {
        UserModel? newUser = await AuthService().signUp(
          userName: username,
          email: email,
          password: password,
          age: int.tryParse(age),
          gender: _gender,
        );

        if (newUser != null) {
          // Kullanıcı kayıt işlemi başarılı olduğunda
          showCustomPopup(
            context: context,
            title: 'Başarılı!',
            message: 'Kayıt işlemi başarılı! Ana sayfaya yönlendiriliyorsunuz.',
            durationInSeconds: 1,
            showCheckMark: true,
            onPopupClose: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      TabBarViewController(userId: newUser.uid!),
                ),
              );
            },
          );
        }
      } else if (username.isEmpty) {
        showCustomPopup(
          context: context,
          title: 'Hata!',
          message: 'Kullanıcı adı boş bırakılamaz!',
          durationInSeconds: 1,
          showCheckMark: false,
        );
      } else if (email.isEmpty) {
        showCustomPopup(
          context: context,
          title: 'Hata!',
          message: 'E-posta boş bırakılamaz!',
          durationInSeconds: 1,
          showCheckMark: false,
        );
      } else if (password.isEmpty) {
        showCustomPopup(
          context: context,
          title: 'Hata!',
          message: 'Şifre boş bırakılamaz!',
          durationInSeconds: 1,
          showCheckMark: false,
        );
      }
    } on AuthError catch (error) {
      showCustomPopup(
          context: context,
          title: "Giriş Başarısız",
          message: getErrorMessage(error),
          durationInSeconds: 2,
          showCheckMark: false);
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
