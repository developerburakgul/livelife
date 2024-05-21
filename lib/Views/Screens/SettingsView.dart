// import 'package:flutter/material.dart';
// import 'package:livelife/Screens/SignUPView.dart';

// import 'package:livelife/main.dart';

// class SettingsPage extends StatefulWidget {
//   SettingsPage() {
//     print('SettingsPage constructor called');
//   }
//   @override
//   _SettingsPageState createState() => _SettingsPageState();
// }

// class _SettingsPageState extends State<SettingsPage> {
  


//   bool isProfileExpanded = false;
//   bool isSwitchedTheme = false;
//   bool isSwitchedNotifications = false;
//   final _usernameController = TextEditingController();
//   final _passwordController = TextEditingController();
//   final _emailController = TextEditingController();
//   final _ageController = TextEditingController();
//   final _genderController = TextEditingController();

//   void dispose() {
//     // Kontrolleri dispose edin
//     _usernameController.dispose();
//     _passwordController.dispose();
//     _emailController.dispose();
//     _ageController.dispose();
//     _genderController.dispose();
//     super.dispose();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Center(child: Text('Live Life')),
//         ),
//         body: ListView(
//           children: <Widget>[
//             ExpansionTile(
//               leading: Icon(Icons.person),
//               title: Text('Profil'),
//               children: <Widget>[
//                 CircleAvatar(
//                   radius: 50,
//                   child: Icon(Icons.person),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(6.0),
//                   child: TextFormField(
//                     controller: _usernameController,
//                     decoration: InputDecoration(
//                       prefixIcon: Icon(Icons.person_pin),
//                       labelText: 'Kullanıcı Adı',
//                       border: OutlineInputBorder(),
//                       hintText:
//                           _usernameController.text, // Kullanıcı adı gösterilir
//                     ),
//                     readOnly: true,
//                     enabled: false,
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(6.0),
//                   child: TextFormField(
//                     controller: _emailController,
//                     decoration: InputDecoration(
//                       prefixIcon: Icon(Icons.email),
//                       border: OutlineInputBorder(),
//                       labelText: 'Email',
//                       hintText: _emailController.text, // Email gösterilir
//                     ),
//                     enabled: false,
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(6.0),
//                   child: TextFormField(
//                     controller: _genderController,
//                     decoration: InputDecoration(
//                       prefixIcon: Icon(Icons.male),
//                       border: OutlineInputBorder(),
//                       labelText: 'Cinsiyet',
//                       hintText: _genderController.text, // Cinsiyet gösterilir
//                     ),
//                     enabled: false,
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(6.0),
//                   child: TextFormField(
//                     controller: _ageController,
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(),
//                       labelText: 'Yaş',
//                       prefixIcon: Icon(Icons.event),
//                       hintText: _ageController.text, // Yaş gösterilir
//                     ),
//                     readOnly: true,
//                     enabled: false,
//                     keyboardType: TextInputType.number,
//                   ),
//                 ),
//               ],
//             ),
//             SwitchListTile(
//               title: Text('Tema'),
//               value: isSwitchedTheme,
//               onChanged: (bool value) {
//                 setState(() {
//                   isSwitchedTheme = value;
//                 });
//                 // Implement theme logic here
//               },
//               secondary: Icon(Icons.lightbulb_outline),
//             ),
//             SwitchListTile(
//               title: Text('Bildirimler'),
//               value: isSwitchedNotifications,
//               onChanged: (bool value) {
//                 setState(() {
//                   isSwitchedNotifications = value;
//                 });
//                 // Implement notification logic here
//               },
//               secondary: Icon(Icons.notifications_none),
//             ),
//           ],
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {
//             Navigator.pushReplacement(
//               context,
//               MaterialPageRoute(builder: (context) => SignUpPage()),
//             );
//           },
//           child: Icon(Icons.logout),
//         )
//         // bottomNavigationBar: bottomNavigationBar()
//         );
//   }
// }


import 'package:flutter/material.dart';

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
              CircleAvatar(
                radius: 50,
                child: Icon(Icons.person),
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





