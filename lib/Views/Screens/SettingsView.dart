import 'package:flutter/material.dart';
import 'dart:io';

class SettingsView extends StatelessWidget {
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
  final String? profileImageUrl; // Yeni parametre

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
    this.profileImageUrl, // Yeni parametre
  }) : super(key: key);

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
              GestureDetector(
                onTap: onProfileImagePressed,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: profileImage != null
                      ? FileImage(profileImage!)
                      : (profileImageUrl != null
                          ? NetworkImage(profileImageUrl!)
                          : null) as ImageProvider?,
                  child: profileImage == null && profileImageUrl == null
                      ? Icon(Icons.person, size: 50)
                      : null,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: TextFormField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person_pin),
                    labelText: 'Kullanıcı Adı',
                    border: OutlineInputBorder(),
                    hintText: usernameController.text,
                  ),
                  readOnly: true,
                  enabled: false,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: emailController.text,
                  ),
                  enabled: false,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: TextFormField(
                  controller: genderController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.male),
                    border: OutlineInputBorder(),
                    labelText: 'Cinsiyet',
                    hintText: genderController.text,
                  ),
                  enabled: false,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: TextFormField(
                  controller: ageController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Yaş',
                    prefixIcon: Icon(Icons.event),
                    hintText: ageController.text,
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
            onChanged: onThemeChanged,
            secondary: Icon(Icons.lightbulb_outline),
          ),
          SwitchListTile(
            title: Text('Bildirimler'),
            value: isSwitchedNotifications,
            onChanged: onNotificationsChanged,
            secondary: Icon(Icons.notifications_none),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onLogoutPressed,
        child: Icon(Icons.logout),
        heroTag: null,
      ),
    );
  }
}

