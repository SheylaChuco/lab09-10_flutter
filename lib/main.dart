import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'pages/main_page.dart';
import 'pages/detalle_page.dart';
import 'pages/mi_lista_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Disney+',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.tema,
      initialRoute: '/',
      routes: {
        '/': (context) => const MainPage(),
        '/detalle': (context) => const DetallePage(),
        '/mi-lista': (context) => const MiListaPage(),
      },
    );
  }
}