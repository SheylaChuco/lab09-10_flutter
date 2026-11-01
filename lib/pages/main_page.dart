import 'package:flutter/material.dart';
import 'home_page.dart';
import 'buscar_page.dart';
import 'descargas_page.dart';
import 'perfil_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _indice = 0;

  final List<Widget> _vistas = const [
    HomePage(),
    BuscarPage(),
    DescargasPage(),
    PerfilPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // IndexedStack muestra solo la vista elegida
      body: IndexedStack(index: _indice, children: _vistas),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indice,
        onTap: (i) => setState(() => _indice = i),
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFF040714),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Buscar'),
          BottomNavigationBarItem(
              icon: Icon(Icons.download), label: 'Descargas'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
        ],
      ),
    );
  }
}