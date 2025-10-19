import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// ...existing code...
import 'providers/receitas_provider.dart';
import 'providers/auth_provider.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const ReceitasFavoritasApp());
}

class ReceitasFavoritasApp extends StatelessWidget {
  const ReceitasFavoritasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => ReceitasProvider()),
      ],
      child: MaterialApp(
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
        home: const LoginScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
