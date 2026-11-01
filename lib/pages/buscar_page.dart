import 'package:flutter/material.dart';
import '../data/datos.dart';

class BuscarPage extends StatelessWidget {
  const BuscarPage({super.key});

  @override
  Widget build(BuildContext context) {
    final todo = [...peliculas, ...series];

    return Scaffold(
      appBar: AppBar(title: const Text('Buscar')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Películas, series y más',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: const Color(0xFF1A1D29),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 2 / 3,
              ),
              itemCount: todo.length,
              itemBuilder: (context, i) {
                final item = todo[i];
                return GestureDetector(
                  onTap: () => Navigator.pushNamed(context, '/detalle',
                      arguments: item),
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    child: Image.network(
                      item['imagen']!,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stack) => Container(
                        color: Colors.grey[800],
                        child: const Icon(Icons.broken_image),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}