import 'package:flutter/material.dart';

class DetallePage extends StatelessWidget {
  const DetallePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Recibe el mapa de la película por la ruta
    final item =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final texto = Theme.of(context).textTheme;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          // Póster grande (imagen de la nube)
          Image.network(
            item['imagen']!,
            height: 420,
            width: double.infinity,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stack) => Container(
              height: 420,
              color: Colors.grey[800],
              child: const Icon(Icons.broken_image, size: 40),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item['titulo']!, style: texto.titleLarge),
                    const SizedBox(height: 6),
                    Text('${item['anio']} • ${item['genero']}',
                        style: texto.titleMedium),
                    const SizedBox(height: 12),
                    Text(
                      'Una historia llena de aventura y emoción para disfrutar en familia. Disponible ahora en tu lista.',
                      style: texto.bodyMedium,
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.play_arrow),
                          label: const Text('VER AHORA'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                          ),
                        ),
                        const SizedBox(width: 12),
                        OutlinedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.add),
                          label: const Text('MI LISTA'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}