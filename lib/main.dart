import 'package:flutter/material.dart';

import 'core/app_theme.dart';
import 'screens/home/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const FloraIdentifyApp());
}

class FloraIdentifyApp extends StatelessWidget {
  const FloraIdentifyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,

      title: "Flora Identify",

      theme: AppTheme.lightTheme,

      home: const HomeScreen(),
    );
  }
}