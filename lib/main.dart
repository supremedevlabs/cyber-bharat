import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:floating_navbar/floating_navbar.dart';
import 'package:floating_navbar/floating_navbar_item.dart';

import 'home_screen.dart';
import 'quiz.dart';
import 'report_screen.dart';



void main() {
   WidgetsFlutterBinding.ensureInitialized();
   SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.black, // Transparent status bar
      systemNavigationBarColor: Colors.transparent, // Navigation bar color
      systemNavigationBarIconBrightness: Brightness.dark, // Light icons
      systemNavigationBarDividerColor: Colors.transparent,
    ),
  );
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
      home: Scaffold(
        body: SafeArea(
          child: FloatingNavBar(
            resizeToAvoidBottomInset: true,
            color: Colors.green,
            selectedIconColor: Colors.white,
            unselectedIconColor: Colors.white.withOpacity(0.6),
            items: [
              FloatingNavBarItem(
                  iconData: Icons.home_outlined, page: const Quiz(), title: 'Home'),
                   FloatingNavBarItem(
                  iconData: Icons.insights,
                  page: const HomeScreen(),
                  title: 'Insights'),
              FloatingNavBarItem(
                  iconData: Icons.phone,
                  page: const ReportScreen(),
                  title: 'Contact'),
             
            ],
            horizontalPadding: 10.0,
            hapticFeedback: true,
            showTitle: true,
          ),
        ),
      ),
    );
  }
}
