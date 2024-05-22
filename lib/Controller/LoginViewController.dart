import 'package:flutter/material.dart';
import 'package:livelife/Controller/CustomPopupViewController.dart';
import 'package:livelife/Controller/TabBarViewController.dart';
import 'package:livelife/Models/user_model.dart';
import 'package:livelife/Services/Exceptions/AuthExceptions.dart';
import 'package:livelife/Services/auth_service.dart';
import 'package:livelife/Utils/UtilFunctions.dart';
import 'package:livelife/Views/Screens/LoginView.dart';
import 'package:livelife/Views/Screens/HomeView.dart';

class LoginViewController extends StatefulWidget {
  @override
  _LoginViewControllerState createState() => _LoginViewControllerState();
}

class _LoginViewControllerState extends State<LoginViewController> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() async {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    // if email and password is empty
    if (email.isEmpty || password.isEmpty) {
      showCustomPopup(
        context: context,
        title: 'Giriş Başarısız!',
        message: 'Lütfen tüm alanları doldurun.',
        durationInSeconds: 1,
        showCheckMark: false,
      );
      return;
    }

    try {
      UserModel? user =
          await AuthService().signIn(email: email, password: password);
      if (user != null) {
        showCustomPopup(
          context: context,
          title: 'Giriş Başarılı!',
          message: 'Ana sayfaya yönlendiriliyorsunuz.',
          durationInSeconds: 1,
          showCheckMark: true,
          onPopupClose: () {
            Navigator.of(context, rootNavigator: true).pushReplacement(
              MaterialPageRoute(
                  builder: (context) =>
                      TabBarViewController(userId: user.uid!)),
            );
          },
        );
      }
    } on AuthError catch (error) {
      showCustomPopup(
        context: context,
        title: 'Giriş Başarısız!',
        message: getErrorMessage(error),
        durationInSeconds: 1,
        showCheckMark: false,
      );
    }
  }

  void _goToBackSignUPPage() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return LoginView(
        emailController: _emailController,
        passwordController: _passwordController,
        onLoginPressed: _login,
        onGoToBackSignUpPressed: _goToBackSignUPPage);
  }
}
