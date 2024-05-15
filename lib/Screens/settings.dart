import 'package:flutter/material.dart';
import 'package:livelife/Screens/signUP.dart';

import 'package:livelife/main.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage() {
    print('SettingsPage constructor called');
  }
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isProfileExpanded = false;
  bool isSwitchedTheme = false;
  bool isSwitchedNotifications = false;
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  final _ageController = TextEditingController();
  final _genderController = TextEditingController();

  void dispose() {
    // Kontrolleri dispose edin
    _usernameController.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    _ageController.dispose();
    _genderController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Live Life')),
        ),
        body: ListView(
          children: <Widget>[
            ExpansionTile(
              leading: Icon(Icons.person),
              title: Text('Profil'),
              children: <Widget>[
                CircleAvatar(
                  radius: 50,
                  child: Icon(Icons.person),
                ),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: TextFormField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person_pin),
                      labelText: 'Kullanıcı Adı',
                      hintText:
                          _usernameController.text, // Kullanıcı adı gösterilir
                    ),
                    readOnly: true,
                    enabled: false,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      labelText: 'Email',
                      hintText: _emailController.text, // Email gösterilir
                    ),
                    enabled: false,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: TextFormField(
                    controller: _genderController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.male),
                      labelText: 'Cinsiyet',
                      hintText: _genderController.text, // Cinsiyet gösterilir
                    ),
                    enabled: false,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: TextFormField(
                    controller: _ageController,
                    decoration: InputDecoration(
                      labelText: 'Yaş',
                      prefixIcon: Icon(Icons.event),
                      hintText: _ageController.text, // Yaş gösterilir
                    ),
                    readOnly: true,
                    enabled: false,
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            SwitchListTile(
              title: Text('Tema'),
              value: isSwitchedTheme,
              onChanged: (bool value) {
                setState(() {
                  isSwitchedTheme = value;
                });
                // Implement theme logic here
              },
              secondary: Icon(Icons.lightbulb_outline),
            ),
            SwitchListTile(
              title: Text('Bildirimler'),
              value: isSwitchedNotifications,
              onChanged: (bool value) {
                setState(() {
                  isSwitchedNotifications = value;
                });
                // Implement notification logic here
              },
              secondary: Icon(Icons.notifications_none),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => SignUpPage()),
            );
          },
          child: Icon(Icons.logout),
        )
        // bottomNavigationBar: bottomNavigationBar()
        );
  }
}
