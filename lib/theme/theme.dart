import 'package:flutter/material.dart';
final theme = ThemeData(
    appBarTheme: AppBarTheme(
        backgroundColor: Color(0xFF1F1F1F),
        titleTextStyle: TextStyle(
          color:Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.w700,)
    ),
    listTileTheme: ListTileThemeData(iconColor: Colors.white),
    dividerColor: Colors.white,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
    scaffoldBackgroundColor: Color(0xFF1F1F1F),
    useMaterial3: true,
    textTheme: TextTheme(
        bodyMedium: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: 20,
        ),
        labelSmall:TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w700,
          fontSize: 14,
        )
    )
);