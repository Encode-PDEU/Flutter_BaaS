import 'package:flutter/material.dart';
import 'package:notes/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notes',
      theme: ThemeData(
        brightness: Brightness.dark,
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor:Color(0xff1e1e1e),
          selectionColor: Colors.transparent, // Remove selection highlight
          selectionHandleColor: Color(0xff1e1e1e),
        ),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}