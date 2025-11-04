import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lista_tareas_filtros/providers/tarea_provider.dart';
import 'package:lista_tareas_filtros/routes/rutas.dart';
import 'package:provider/provider.dart';

// Punto de entrada de la aplicación
void main() async {
  // Aseguramos que los widgets de Flutter estén inicializados antes de ejecutar el código
  WidgetsFlutterBinding.ensureInitialized();

  // Creamos una instancia del proveedor de tareas y cargamos los datos iniciales
  final tareaProvider = TareaProvider();
  await tareaProvider.cargarDatos();

  // Iniciamos la aplicación con un ChangeNotifierProvider para manejar el estado global
  runApp(
    ChangeNotifierProvider.value(
      value: tareaProvider, // Proveedor que contiene el estado de las tareas
      child: const AplicacionTareas(), // Widget principal de la aplicación
    ),
  );
}

// Clase principal de la aplicación
class AplicacionTareas extends StatelessWidget {
  const AplicacionTareas({super.key});

  @override
  Widget build(BuildContext context) {
    // Obtenemos el proveedor de tareas para determinar el tema actual (claro u oscuro)
    final temaProvider = Provider.of<TareaProvider>(context);

    return MaterialApp.router(
      title: 'Lista de Tareas con Filtros', // Título de la aplicación
      // Tema claro de la aplicación
      theme: ThemeData(
        primaryColor: const Color.fromARGB(
          255,
          37,
          197,
          123,
        ), // Color principal
        scaffoldBackgroundColor: const Color.fromARGB(
          255,
          6,
          79,
          189,
        ), // Fondo de la aplicación
        colorScheme: const ColorScheme.light(
          primary: Color.fromARGB(255, 37, 197, 123), // Color primario
          secondary: Color.fromARGB(255, 245, 119, 35), // Color secundario
          surface: Color.fromARGB(255, 209, 108, 14), // Color de superficie
          onPrimary: Color.fromARGB(
            255,
            77,
            124,
            120,
          ), // Color del texto sobre el color primario
          onSecondary: Color.fromARGB(
            255,
            93,
            52,
            189,
          ), // Color del texto sobre el color secundario
          onSurface: Color(0xFF2D3748), // Color del texto sobre la superficie
          error: Color(0xFFE53E3E), // Color para errores
        ),
        textTheme: GoogleFonts.interTextTheme(
          ThemeData.light().textTheme.copyWith(
            bodyMedium: const TextStyle(
              color: Color(0xFF2D3748),
            ), // Texto de tamaño medio
            bodyLarge: const TextStyle(
              color: Color(0xFF2D3748),
            ), // Texto de tamaño grande
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(
              255,
              213,
              74,
              226,
            ), // Fondo del botón elevado
            foregroundColor: const Color.fromARGB(
              255,
              51,
              216,
              37,
            ), // Color del texto del botón
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12), // Bordes redondeados
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 12,
            ), // Espaciado interno
          ),
        ),
        cardTheme: CardThemeData(
          color: const Color.fromARGB(
            255,
            238,
            215,
            115,
          ), // Fondo de las tarjetas
          elevation: 4, // Sombra de las tarjetas
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              12,
            ), // Bordes redondeados de las tarjetas
          ),
        ),
        visualDensity:
            VisualDensity.adaptivePlatformDensity, // Densidad visual adaptativa
      ),

      // Tema oscuro de la aplicación
      darkTheme: ThemeData(
        primaryColor: const Color.fromARGB(255, 54, 143, 46), // Color principal
        scaffoldBackgroundColor: const Color.fromARGB(
          255,
          95,
          79,
          56,
        ), // Fondo oscuro
        colorScheme: const ColorScheme.dark(
          primary: Color.fromARGB(255, 196, 74, 226), // Color primario
          secondary: Color.fromARGB(255, 245, 35, 151), // Color secundario
          surface: Color.fromARGB(255, 120, 158, 59), // Color de superficie
          onPrimary: Color.fromARGB(
            255,
            146,
            192,
            76,
          ), // Color del texto sobre el color primario
          onSecondary: Color.fromARGB(
            255,
            47,
            156,
            80,
          ), // Color del texto sobre el color secundario
          onSurface: Color(0xFFF5F7FA), // Color del texto sobre la superficie
          error: Color(0xFFE53E3E), // Color para errores
        ),
        textTheme: GoogleFonts.interTextTheme(
          ThemeData.dark().textTheme.copyWith(
            bodyMedium: const TextStyle(
              color: Color(0xFFF5F7FA),
            ), // Texto de tamaño medio
            bodyLarge: const TextStyle(
              color: Color(0xFFF5F7FA),
            ), // Texto de tamaño grande
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(
              255,
              37,
              133,
              69,
            ), // Fondo del botón elevado
            foregroundColor: const Color.fromARGB(
              255,
              194,
              14,
              158,
            ), // Color del texto del botón
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12), // Bordes redondeados
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 12,
            ), // Espaciado interno
          ),
        ),
        cardTheme: CardThemeData(
          color: const Color(0xFF2D3748), // Fondo de las tarjetas
          elevation: 4, // Sombra de las tarjetas
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              12,
            ), // Bordes redondeados de las tarjetas
          ),
        ),
        visualDensity:
            VisualDensity.adaptivePlatformDensity, // Densidad visual adaptativa
      ),

      // Determinamos el tema actual (claro u oscuro) según el estado del proveedor
      themeMode: temaProvider.isDarkTheme ? ThemeMode.dark : ThemeMode.light,

      // Configuración del enrutador (GoRouter)
      routerConfig: router,
    );
  }
}
