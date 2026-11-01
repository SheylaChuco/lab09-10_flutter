import 'package:flutter/material.dart';
import '../data/datos.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Espacio para que el contenido no quede debajo de la barra superior
    final espacioArriba =
        kToolbarHeight + MediaQuery.of(context).padding.top + 8;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Disney+'),
        actions: const [
          Icon(Icons.cast),
          SizedBox(width: 12),
          Icon(Icons.search),
          SizedBox(width: 16),
        ],
      ),
      // Fondo con degradado azul
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF0E1E4D), Color(0xFF040714)],
          ),
        ),
        child: ListView(
          padding: EdgeInsets.only(top: espacioArriba, bottom: 24),
          children: [
            _banner(context),
            const SizedBox(height: 24),
            _filaMarcas(context),
            const SizedBox(height: 24),
            _seccion(context, 'Películas', peliculas),
            const SizedBox(height: 24),
            _seccion(context, 'Series', series),
          ],
        ),
      ),
      
    );
  }

  // Banner con imagen LOCAL, degradado oscuro abajo y botón
  Widget _banner(BuildContext context) {
    final texto = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: SizedBox(
          height: 220,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                'assets/images/banner.jpg',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stack) => Container(
                  color: Colors.grey[800],
                  child: const Icon(Icons.broken_image, size: 40),
                ),
              ),
              // Degradado oscuro para que se lea el texto
              const DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Color(0xE6040714)],
                  ),
                ),
              ),
              Positioned(
                left: 16,
                right: 16,
                bottom: 16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Estreno de la semana', style: texto.titleLarge),
                    const SizedBox(height: 10),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.play_arrow),
                      label: const Text('VER AHORA'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

    // Fila horizontal de marcas: cada una con su color y su fuente
  Widget _filaMarcas(BuildContext context) {
    final fondos = [
      const Color(0xFF0B3D91), // Disney
      const Color(0xFF1CA9E6), // Pixar
      const Color(0xFFB71C1C), // Marvel
      const Color(0xFF000000), // Star Wars
      const Color(0xFFFFC107), // National Geographic
    ];
    final coloresTexto = [
      Colors.white,
      Colors.white,
      Colors.white,
      const Color(0xFFFFE81F),
      Colors.black,
    ];
    final fuentes = [
      GoogleFonts.mulish(
          fontSize: 20, fontWeight: FontWeight.w800, letterSpacing: 1),
      GoogleFonts.nunitoSans(fontSize: 22, fontWeight: FontWeight.w900),
      GoogleFonts.lato(
          fontSize: 22, fontWeight: FontWeight.w900, letterSpacing: 1),
      GoogleFonts.lato(
          fontSize: 14, fontWeight: FontWeight.w700, letterSpacing: 4),
      GoogleFonts.mulish(
          fontSize: 13, fontWeight: FontWeight.w800, letterSpacing: 1.5),
    ];

    return SizedBox(
      height: 90,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: marcas.length,
        itemBuilder: (context, i) {
          final n = i % fondos.length;
          return Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Card(
              color: fondos[n],
              child: Container(
                width: 150,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(8),
                child: Text(
                  marcas[i]['nombre']!.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: fuentes[n].copyWith(color: coloresTexto[n]),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
  // Sección con título y fila horizontal de pósters (imágenes de la NUBE)
  Widget _seccion(
      BuildContext context, String titulo, List<Map<String, String>> datos) {
    final texto = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(titulo, style: texto.titleLarge),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: datos.length,
            itemBuilder: (context, i) {
              final item = datos[i];
              return Padding(
                padding: const EdgeInsets.only(right: 12),
                child: GestureDetector(
                  // Al tocar el póster se abre el detalle
                  onTap: () => Navigator.pushNamed(
                    context,
                    '/detalle',
                    arguments: item,
                  ),
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    child: Image.network(
                      item['imagen']!,
                      width: 130,
                      height: 200,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stack) => Container(
                        width: 130,
                        color: Colors.grey[800],
                        child: const Icon(Icons.broken_image),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}