import 'package:flutter/material.dart';
import 'dart:io';
import 'package:provider/provider.dart';
import 'package:livelife/Controller/SettingsViewController.dart';
import 'package:livelife/Controller/ThemeController.dart';
import 'package:livelife/Views/Screens/SignUPView.dart';

class SettingsView extends StatefulWidget {
  final bool isSwitchedTheme;
  final bool isSwitchedNotifications;
  final TextEditingController usernameController;
  final TextEditingController emailController;
  final TextEditingController genderController;
  final TextEditingController ageController;
  final ValueChanged<bool> onThemeChanged;
  final ValueChanged<bool> onNotificationsChanged;
  final VoidCallback onLogoutPressed;
  final VoidCallback onProfileImagePressed;
  final File? profileImage;
  final String? profileImageUrl;

  const SettingsView({
    Key? key,
    required this.isSwitchedTheme,
    required this.isSwitchedNotifications,
    required this.usernameController,
    required this.emailController,
    required this.genderController,
    required this.ageController,
    required this.onThemeChanged,
    required this.onNotificationsChanged,
    required this.onLogoutPressed,
    required this.onProfileImagePressed,
    required this.profileImage,
    this.profileImageUrl,
  }) : super(key: key);

  @override
  _SettingsViewState createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    final themeController = Provider.of<ThemeController>(context);
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
              GestureDetector(
                onTap: widget.onProfileImagePressed,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: widget.profileImage != null
                      ? FileImage(widget.profileImage!)
                      : (widget.profileImageUrl != null
                          ? NetworkImage(widget.profileImageUrl!)
                          : null) as ImageProvider?,
                  child: widget.profileImage == null &&
                          widget.profileImageUrl == null
                      ? Icon(Icons.person, size: 50)
                      : null,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: TextFormField(
                  controller: widget.usernameController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person_pin),
                    labelText: 'Kullanıcı Adı',
                    border: OutlineInputBorder(),
                    hintText: widget.usernameController.text,
                  ),
                  readOnly: true,
                  enabled: false,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: TextFormField(
                  controller: widget.emailController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: widget.emailController.text,
                  ),
                  enabled: false,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: TextFormField(
                  controller: widget.genderController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(widget.genderController == 'male'
                        ? Icons.male
                        : Icons.female),
                    border: OutlineInputBorder(),
                    labelText: 'Cinsiyet',
                    hintText: widget.genderController.text,
                  ),
                  enabled: false,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: TextFormField(
                  controller: widget.ageController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Yaş',
                    prefixIcon: Icon(Icons.event),
                    hintText: widget.ageController.text,
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
            onChanged: (bool value) {
              themeController.toggleTheme(value);
              setState(() {
                print("theme changed");
              });
            },
            value: themeController.isDarkMode,
            secondary: Icon(Icons.lightbulb_outline),
          ),
          SwitchListTile(
            title: Text('Bildirimler'),
            value: widget.isSwitchedNotifications,
            onChanged: widget.onNotificationsChanged,
            secondary: Icon(Icons.notifications_none),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: widget.onLogoutPressed,
        child: Icon(Icons.logout),
        heroTag: null,
      ),
    );
  }
}
