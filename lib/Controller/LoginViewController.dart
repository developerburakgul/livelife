import 'package:flutter/material.dart';
import 'package:livelife/Controller/TabBarViewController.dart';
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
    String email = _emailController.text;
    String password = _passwordController.text;

    // Burada giriş işlemlerini gerçekleştir
    // Bu örnek için basit bir kontrol yapalım
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => TabBarViewController(userId: "123")),
          
          
    );
    if (email == 'example@example.com' && password == 'password123') {
      // Eğer giriş bilgileri doğruysa, Anasayfaya yönlendir
     
  
    } else {
      // Giriş bilgileri yanlışsa, bir hata mesajı göster
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Hata'),
            content: Text('E-posta veya şifre yanlış!'),
            actions: <Widget>[
              TextButton(
                child: Text('Tamam'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
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
