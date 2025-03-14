import 'package:flutter/material.dart';
import 'language_selection.dart';

void main() {
  runApp(BNPLApp());
}

class BNPLApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BNPL App',
      debugShowCheckedModeBanner: false, // Disable the debug banner
      theme: ThemeData(
        primaryColor: Color(0xFF00C2FF),
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Color(0xFFE67026)),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: LanguageSelectionPage(),
    );
  }
}
