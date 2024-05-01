import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:livelife/Models/gender.dart';
import 'package:livelife/Models/user_model.dart';
import 'package:livelife/Screens/MyHomePage.dart';
import 'package:livelife/Screens/homePage.dart';
import 'package:livelife/Screens/login.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  Gender _gender = Gender.male; // Varsayılan cinsiyet

  // SignUpPage içindeki _signUP fonksiyonu

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Kayıt Ol')),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Kullanıcı Adı',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'E-Mail',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Şifre',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            SizedBox(height: 16.0),
            DropdownButtonFormField(
              value: _gender.name,
              decoration: InputDecoration(
                labelText: 'Cinsiyet',
                border: OutlineInputBorder(),
              ),
              items: Gender.values.map((gender) {
                return DropdownMenuItem(
                  value: gender.name,
                  child: Text(gender.turkishName),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _gender = GenderExtension.fromString(newValue!);
                });
              },
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _ageController,
              decoration: InputDecoration(
                labelText: 'Yaş',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              child: Text('Kayıt Ol'),
              onPressed: _signUP,
            ),
            TextButton(
              child: Text('Zaten hesabım var'),
              onPressed: _goToLoginPage,
            ),
          ],
        ),
      ),
    );
  }

  void _goToLoginPage() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }

  void _signUP() async {
    // ! in here must be signUP logic and depend on this result there must be route to the home page
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => MyHomePage(userId: "123")),
    );
  }
}
