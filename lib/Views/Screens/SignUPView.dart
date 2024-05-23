// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:livelife/Models/gender.dart';
// import 'package:livelife/Models/user_model.dart';
// import 'package:livelife/Screens/MyHomePage.dart';
// import 'package:livelife/Screens/homePage.dart';
// import 'package:livelife/Screens/IntroView.dart';
// import 'package:livelife/Screens/login.dart';

// class SignUpPage extends StatefulWidget {
//   @override
//   _SignUpPageState createState() => _SignUpPageState();
// }

// class _SignUpPageState extends State<SignUpPage> {
//   FocusNode focusNodeTexFieldOne = FocusNode();
//   FocusNode focusNodeTexFieldTwo = FocusNode();
//   FocusNode focusNodeTexFieldThree = FocusNode();
//   FocusNode focusNodeTexFieldFour = FocusNode();
//   final TextEditingController _usernameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _ageController = TextEditingController();
//   Gender _gender = Gender.male; // Varsayılan cinsiyet

//   // SignUpPage içindeki _signUP fonksiyonu

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Center(child: Text('Kayıt Ol')),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: <Widget>[
//               SizedBox(
//                 height: 10,
//               ),
//               TextField(
//                 focusNode: focusNodeTexFieldOne,
//                 textInputAction: TextInputAction.next,
//                 maxLength: 33,
//                 controller: _usernameController,
//                 decoration: InputDecoration(
//                   prefixIcon: Icon(Icons.person_pin),
//                   labelText: 'Kullanıcı Adı',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               SizedBox(height: 16.0),
//               TextField(
//                 focusNode: focusNodeTexFieldTwo,
//                 textInputAction: TextInputAction.next,
//                 controller: _emailController,
//                 decoration: InputDecoration(
//                   prefixIcon: Icon(Icons.email),
//                   labelText: 'E-Mail',
//                   border: OutlineInputBorder(),
//                 ),
//                 keyboardType: TextInputType.emailAddress,
//               ),
//               SizedBox(height: 16.0),
//               TextField(
//                 focusNode: focusNodeTexFieldThree,
//                 textInputAction: TextInputAction.next,
//                 controller: _passwordController,
//                 decoration: InputDecoration(
//                   prefixIcon: Icon(Icons.lock),
//                   labelText: 'Şifre',
//                   border: OutlineInputBorder(),
//                 ),
//                 obscureText: true,
//               ),
//               SizedBox(height: 16.0),
//               TextField(
//                 focusNode: focusNodeTexFieldFour,
//                 textInputAction: TextInputAction.next,
//                 controller: _ageController,
//                 decoration: InputDecoration(
//                   prefixIcon: Icon(Icons.event),
//                   labelText: 'Yaş',
//                   border: OutlineInputBorder(),
//                 ),
//                 keyboardType: TextInputType.number,
//               ),
//               SizedBox(height: 16.0),
//               DropdownButtonFormField(
//                 value: _gender.name,
//                 decoration: InputDecoration(
//                   prefixIcon: Icon(Icons.male),
//                   labelText: 'Cinsiyet',
//                   border: OutlineInputBorder(),
//                 ),
//                 items: Gender.values.map((gender) {
//                   return DropdownMenuItem(
//                     value: gender.name,
//                     child: Text(gender.turkishName),
//                   );
//                 }).toList(),
//                 onChanged: (String? newValue) {
//                   setState(() {
//                     _gender = GenderExtension.fromString(newValue!);
//                   });
//                 },
//               ),
//               SizedBox(height: 24.0),
//               ElevatedButton(
//                 child: Text('Kayıt Ol'),
//                 onPressed: _signUP,
//               ),
//               TextButton(
//                 child: Text('Zaten hesabım var'),
//                 onPressed: _goToLoginPage,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   void _goToLoginPage() {
//     Navigator.push(
//         context, MaterialPageRoute(builder: (context) => LoginPage()));
//   }

//   void _signUP() async {
//     // ! in here must be signUP logic and depend on this result there must be route to the home page
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(builder: (context) => MyHomePage(userId: "123")),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:livelife/Models/gender.dart';

class SignUpView extends StatelessWidget {
  final TextEditingController usernameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController ageController;
  final Gender gender;
  final Function(Gender) onGenderChanged;
  final VoidCallback onSignUpPressed;
  final VoidCallback onGoToLoginPressed;

  SignUpView({
    required this.usernameController,
    required this.emailController,
    required this.passwordController,
    required this.ageController,
    required this.gender,
    required this.onGenderChanged,
    required this.onSignUpPressed,
    required this.onGoToLoginPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Kayıt Ol')),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: 10),
              TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person_pin),
                  labelText: 'Kullanıcı Adı',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
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
              SizedBox(height: 16.0),
              TextField(
                controller: ageController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.event),
                  labelText: 'Yaş',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16.0),
              DropdownButtonFormField(
                value: gender.name,
                decoration: InputDecoration(
                  prefixIcon:
                      Icon(gender == Gender.male ? Icons.male : Icons.female),
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
                  onGenderChanged(GenderExtension.fromString(newValue!));
                },
              ),
              SizedBox(height: 24.0),
              ElevatedButton(
                child: Text('Kayıt Ol'),
                onPressed: onSignUpPressed,
              ),
              TextButton(
                child: Text('Zaten hesabım var'),
                onPressed: onGoToLoginPressed,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
