import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:livelife/Controller/IntroViewController.dart';
import 'themes/app_theme.dart';
import 'Controller/ThemeController.dart';

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
