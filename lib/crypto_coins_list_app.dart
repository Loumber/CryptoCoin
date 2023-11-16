import 'package:flutter/material.dart';
import 'package:pop/theme/dark_theme.dart';
import 'router/router.dart';

class CryptoCoinsListApp extends StatelessWidget {
  const CryptoCoinsListApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: darkTheme,
      routes: routes,
    );
  }
}