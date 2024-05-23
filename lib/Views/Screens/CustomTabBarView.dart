import 'package:flutter/material.dart';
import 'package:livelife/Views/CustomViews/BottomNavigationBarWidget.dart';

class CustomTabBarView extends StatelessWidget {
  final List<Widget> widgetOptions;
  final int selectedIndex;
  final Function(int) onItemTapped;

  CustomTabBarView({
    required this.widgetOptions,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: IndexedStack(
          index: selectedIndex,
          children: widgetOptions,
        ),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        selectedIndex: selectedIndex,
        onItemTapped: onItemTapped,
      ),
    );
  }
}




