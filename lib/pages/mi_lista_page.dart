import 'package:flutter/material.dart';
import '../data/datos.dart';

class MiListaPage extends StatelessWidget {
  const MiListaPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Junta películas y series en una sola lista
    final todo = [...peliculas, ...series];

    return Scaffold(
      appBar: AppBar(title: const Text('Mi lista')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: todo.map((item) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Card(
              child: ListTile(
                contentPadding: const EdgeInsets.all(8),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.network(
                    item['imagen']!,
                    width: 50,
                    height: 70,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stack) => Container(
                      width: 50,
                      height: 70,
                      color: Colors.grey[800],
                      child: const Icon(Icons.broken_image),
                    ),
                  ),
                ),
                title: Text(item['titulo']!),
                subtitle: Text('${item['genero']} • ${item['anio']}'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  Navigator.pushNamed(context, '/detalle', arguments: item);
                },
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}