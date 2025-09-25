import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const ReceitasFavoritasApp());
}

class ReceitasFavoritasApp extends StatelessWidget {
  const ReceitasFavoritasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Receitas Favoritas',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        cardTheme: const CardThemeData(
          elevation: 4,
        ),
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
