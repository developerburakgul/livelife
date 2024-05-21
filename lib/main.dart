import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:livelife/Controller/IntroViewController.dart';
import 'package:livelife/Controller/SettingsViewController.dart';
import 'package:livelife/Views/Screens/HabitCreateView.dart';
import 'package:livelife/Views/Screens/HomeView.dart';
import 'package:livelife/Views/Screens/IntroView.dart';
import 'package:livelife/Views/Screens/LoginView.dart';
import 'package:livelife/Views/Screens/SettingsView.dart';
import 'package:livelife/Views/Screens/SignUPView.dart';
import 'package:livelife/Views/Screens/TimerView.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); 
  await Firebase.initializeApp(); // Firebase başlatılıyor
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Live Life',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: IntroViewController());
  }
}




