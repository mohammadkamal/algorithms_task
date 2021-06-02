import 'package:algorithms_task/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

const MaterialColor primaryColorForApp =
    const MaterialColor(0xFF071333, const <int, Color>{
  50: const Color(0xFF071333),
  100: const Color(0xFF071333),
  200: const Color(0xFF071333),
  300: const Color(0xFF071333),
  400: const Color(0xFF071333),
  500: const Color(0xFF071333),
  600: const Color(0xFF071333),
  700: const Color(0xFF071333),
  800: const Color(0xFF071333),
  900: const Color(0xFF071333)
});

class MyApp extends StatelessWidget {
  final _elevatedButtonThemeData = ElevatedButtonThemeData(
      style: ButtonStyle(
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0))),
          foregroundColor: MaterialStateProperty.all(Color(0xFF071333)),
          backgroundColor: MaterialStateProperty.all(Color(0xFFFFCE00))));

  final _textTheme = TextTheme(
      bodyText1: TextStyle(color: Color(0xFF071333)),
      button: TextStyle(color: Color(0xFF071333)));

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Algorithms Task',
      theme: ThemeData(
        primarySwatch: primaryColorForApp,
        scaffoldBackgroundColor: Color(0xFFEEF2FF),
        elevatedButtonTheme: _elevatedButtonThemeData,
        textTheme: _textTheme,
      ),
      home: HomePage(),
    );
  }
}
