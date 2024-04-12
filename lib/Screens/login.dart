import 'package:flutter/material.dart';
import 'package:livelife/main.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    // Giriş işlemlerini burada gerçekleştir
    // Örnek olarak kullanıcı adı ve şifreyi yazdır
    print('Kullanıcı adı: ${_usernameController.text}');
    print('Şifre: ${_passwordController.text}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Giriş Yap')),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: _usernameController,
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
              obscureText: true, // Şifreyi gizlemek için
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              child: Text('Giriş'),
              onPressed: _login,
            ),
            TextButton(
              child: Text('Şifremi Unuttum'),
              onPressed: () {},
            ),
            
          ],
        ),
      ),
      bottomNavigationBar: bottomNavigationBar(),
    );
  }
}
