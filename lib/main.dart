import 'package:flutter/material.dart';
import 'package:quiz_app/home_screen.dart';
import 'package:quiz_app/quiz.dart';
import 'package:floating_navbar/floating_navbar.dart';
import 'package:floating_navbar/floating_navbar_item.dart';

import 'package:quiz_app/report_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FloatingNavBar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: FloatingNavBar(
        resizeToAvoidBottomInset: false,
        color: Colors.green,
        selectedIconColor: Colors.white,
        unselectedIconColor: Colors.white.withOpacity(0.6),
        items: [
          FloatingNavBarItem(
              iconData: Icons.home_outlined, page: const Quiz(), title: 'Home'),
          FloatingNavBarItem(
              iconData: Icons.local_hospital_outlined,
              page: const ReportScreen(),
              title: 'Doctors'),
          FloatingNavBarItem(
              iconData: Icons.local_hospital_outlined,
              page: const WidgetOne(key: PageStorageKey('widget-one')),
              title: 'Doctors'),
        ],
        horizontalPadding: 10.0,
        hapticFeedback: true,
        showTitle: true,
      ),
    );
  }
}
