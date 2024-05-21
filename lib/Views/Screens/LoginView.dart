// import 'package:flutter/material.dart';
// import 'package:livelife/Models/user_model.dart';
// import 'package:livelife/Screens/MyHomePage.dart';
// import 'package:livelife/Screens/homePage.dart';
// import 'package:livelife/Screens/SignUPView.dart';
// import 'package:livelife/main.dart';

// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();

//   Future<void> _login() async {
//     // Giriş işlemlerini burada gerçekleştir
//     // Örnek olarak kullanıcı adı ve şifreyi yazdır
//     Navigator.pop(context);

//     // ! in here must be login logic and depend on the result navigate to the home page
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(
//           builder: (context) => MyHomePage(
//                 userId: "123", //! "123" is example not real data
//               )),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//             icon: Icon(Icons.chevron_left),
//             onPressed: () {
//               _goToBackSignUPPage(context);
//             }),
//         title: Center(child: Text('Giriş Yap')),
//         actions: [Text("            ")],
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: <Widget>[
//             TextField(
//               controller: _emailController,
//               decoration: InputDecoration(
//                 prefixIcon: Icon(Icons.mail),
//                 labelText: 'E-Mail',
//                 border: OutlineInputBorder(),
//               ),
//               keyboardType: TextInputType.emailAddress,
//             ),
//             SizedBox(height: 16.0),
//             TextField(
//               controller: _passwordController,
//               decoration: InputDecoration(
//                 prefixIcon: Icon(Icons.lock),
//                 labelText: 'Şifre',
//                 border: OutlineInputBorder(),
//               ),
//               obscureText: true, // Şifreyi gizlemek için
//             ),
//             SizedBox(height: 24.0),
//             ElevatedButton(
//               child: Text('Giriş'),
//               onPressed: _login,
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void _goToBackSignUPPage(BuildContext context) {
//     // Navigator.pushReplacement(
//     //   context,
//     //   MaterialPageRoute(builder: (context) => SignUpPage()),
//     // );
//     Navigator.pop(context);
//   }
// }



import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final VoidCallback onLoginPressed;
  final VoidCallback onGoToBackSignUpPressed;

  LoginView({
    required this.emailController,
    required this.passwordController,
    required this.onLoginPressed,
    required this.onGoToBackSignUpPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.chevron_left),
          onPressed: onGoToBackSignUpPressed,
        ),
        title: Center(child: Text('Giriş Yap')),
        actions: [Text("            ")],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.mail),
                labelText: 'E-Mail',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock),
                labelText: 'Şifre',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              child: Text('Giriş'),
              onPressed: onLoginPressed,
            ),
          ],
        ),
      ),
    );
  }
}