import 'package:flutter/material.dart';
import '../data/datos.dart';

class DescargasPage extends StatelessWidget {
  const DescargasPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Tomamos algunos títulos como si estuvieran descargados
    final descargas = [...peliculas.take(3), ...series.take(3)];

    return Scaffold(
      appBar: AppBar(title: const Text('Descargas')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: descargas.map((item) {
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
                trailing: const Icon(Icons.download_done, color: Colors.white70),
                onTap: () => Navigator.pushNamed(context, '/detalle',
                    arguments: item),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}