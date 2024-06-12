import 'package:flutter/material.dart';
import 'package:livelife/Controller/ThemeController.dart';
import 'package:provider/provider.dart';
import 'package:livelife/themes/dark_theme.dart';
import 'package:livelife/themes/light_theme.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  BottomNavigationBarWidget(
      {required this.selectedIndex, required this.onItemTapped});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.timer),
          label: 'Zamanlayıcı',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Ana Ekran',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Ayarlar',
        ),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: Theme.of(context).colorScheme.primary,
      onTap: onItemTapped,
    );
  }
}
