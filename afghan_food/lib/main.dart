import 'package:afghan_food/presentation/screens/home/favorite_screen.dart';
import 'package:afghan_food/presentation/screens/home/fileter_sittings.dart';
import 'package:afghan_food/presentation/widgets/favorite_screen.dart';
import 'package:afghan_food/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//light mode
var gLightModeColor = ColorScheme.fromSeed(
  brightness: Brightness.light,
  seedColor: const Color.fromARGB(255, 8, 32, 50),
  primary:
      const Color.fromARGB(255, 8, 32, 50), // Dark blue for primary elements
  secondary:
      const Color.fromARGB(255, 128, 128, 128), // Gray for secondary elements
  surface: const Color.fromARGB(
      255, 240, 240, 240), // Slightly lighter gray for surfaces
  onSurface: const Color.fromARGB(255, 0, 0, 0), // Black for text on surfaces
  error: Colors.red,
  onError: Colors.white,
  onPrimary: Colors.white,
  onSecondary: Colors.black,
);

///dark mode
var gDarkModeColor = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 8, 32, 50),
  primary:
      const Color.fromARGB(255, 255, 255, 255), // White for primary elements
  secondary:
      const Color.fromARGB(255, 128, 128, 128), // Gray for secondary elements
  surface: const Color.fromARGB(
      255, 48, 48, 48), // Slightly lighter gray for surfaces
  onSurface:
      const Color.fromARGB(255, 255, 255, 255), // White for text on surfaces
  error: Colors.red,
  onError: Colors.white,
  onPrimary: Colors.black,
  onSecondary: Colors.white,
);
void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themes = ref.watch(themeProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: gDarkModeColor,
        cardTheme: const CardTheme().copyWith(
          color: gDarkModeColor.secondaryContainer,
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: gDarkModeColor.primaryContainer,
            foregroundColor: gDarkModeColor.onPrimaryContainer,
          ),
        ),
      ),
      theme: ThemeData().copyWith(
          colorScheme: gLightModeColor,
          appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: gLightModeColor.onPrimaryContainer,
            foregroundColor: gLightModeColor.primaryContainer,
          ),
          cardTheme: const CardTheme().copyWith(
            color: gLightModeColor.secondaryContainer,
            margin: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: gLightModeColor.primaryContainer,
            ),
          ),
          textTheme: ThemeData().textTheme.copyWith(
                titleLarge: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: gLightModeColor.onSecondaryContainer,
                  fontSize: 16,
                ),
              ),
          textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
            backgroundColor: gLightModeColor.primary,
          ))),
      themeMode: themes.currentTheme,
      initialRoute: FavoriteItem.id,
      routes: {
        FavoriteItem.id: (context) => const FavoriteItem(),
        FavoriteScreen.id: (context) => const FavoriteScreen(),
        FilterScreen.id: (context) => const FilterScreen(),
      },
    );
  }
}
