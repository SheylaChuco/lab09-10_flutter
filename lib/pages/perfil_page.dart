import 'package:flutter/material.dart';

class PerfilPage extends StatelessWidget {
  const PerfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    final texto = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Perfil')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const SizedBox(height: 8),
          const Center(
            child: CircleAvatar(
              radius: 48,
              backgroundColor: Color(0xFF1A1D29),
              child: Icon(Icons.person, size: 56),
            ),
          ),
          const SizedBox(height: 12),
          Center(child: Text('Usuario', style: texto.titleLarge)),
          const SizedBox(height: 24),
          _opcion(context, Icons.bookmark, 'Mi lista',
              () => Navigator.pushNamed(context, '/mi-lista')),
          _opcion(context, Icons.account_circle, 'Cuenta', () {}),
          _opcion(context, Icons.help_outline, 'Ayuda', () {}),
          _opcion(context, Icons.logout, 'Cerrar sesión', () {}),
        ],
      ),
    );
  }

  Widget _opcion(
      BuildContext context, IconData icono, String titulo, VoidCallback alTocar) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Card(
        child: ListTile(
          leading: Icon(icono),
          title: Text(titulo),
          trailing: const Icon(Icons.chevron_right),
          onTap: alTocar,
        ),
      ),
    );
  }
}