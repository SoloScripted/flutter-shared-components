import 'package:flutter/material.dart';
import 'package:flutter_shared_components/screens/home_screen.dart';

class SoloScriptedApp extends StatelessWidget {
  const SoloScriptedApp({
    super.key,
    required title,
    required localizationsDelegates,
    required supportedLocales,
    required mainScreen
  });

  final String title;
  final List<LocalizationsDelegate<dynamic>> localizationsDelegates;
  final List<Locale> supportedLocales;
  final Widget mainScreen;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:title,
      theme: ThemeData(
        colorSchemeSeed: Colors.blue,
        useMaterial3: true,
      ),
      localizationsDelegates: localizationsDelegates,
      supportedLocales: supportedLocales,
      home: HomeScreen(
        nextScreen: mainScreen,
      ),
    );
  }
}
