import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:livelife/Views/Screens/HabitEditView.dart';
import 'package:provider/provider.dart';
import 'package:livelife/Controller/IntroViewController.dart';
import 'package:livelife/Controller/SettingsViewController.dart';
import 'package:livelife/Views/Screens/HabitCreateView.dart';
import 'package:livelife/Views/Screens/HomeView.dart';
import 'package:livelife/Views/Screens/IntroView.dart';
import 'package:livelife/Views/Screens/LoginView.dart';
import 'package:livelife/Views/Screens/SettingsView.dart';
import 'package:livelife/Views/Screens/SignUPView.dart';
import 'package:livelife/Views/Screens/TimerView.dart';
import 'themes/app_theme.dart';
import 'Controller/ThemeController.dart';
import 'package:livelife/Controller/IntroViewController.dart';
import 'package:livelife/Views/Screens/HabitEditView.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Firebase başlatılıyor
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeController(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Live Life',
      theme: Provider.of<ThemeController>(context)
          .currentTheme, // Varsayılan tema light
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
      // Sistem temasına göre otomatik geçiş
      debugShowCheckedModeBanner: false,
      home: IntroViewController(),
    );
  }
}
