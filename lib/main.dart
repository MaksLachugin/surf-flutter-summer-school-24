import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:surf_flutter_summer_school_24/feature/theme/data/theme_repository.dart';
import 'package:surf_flutter_summer_school_24/feature/theme/di/theme_inherited.dart';
import 'package:surf_flutter_summer_school_24/feature/theme/domain/theme_controller.dart';
import 'package:surf_flutter_summer_school_24/feature/theme/ui/theme_builder.dart';
import 'package:surf_flutter_summer_school_24/screen/grid/grid_page.dart';
import 'package:surf_flutter_summer_school_24/storage/theme/theme_storage.dart';
import 'package:surf_flutter_summer_school_24/uikit/theme/theme_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final themeStorage = ThemeStorage(
    prefs: prefs,
  );
  final themeRepository = ThemeRepository(
    themeStorage: themeStorage,
  );
  final themeController = ThemeController(
    themeRepository: themeRepository,
  );

  runApp(MainApp(
    themeController: themeController,
  ));
}

class MainApp extends StatelessWidget {
  final ThemeController themeController;

  const MainApp({
    required this.themeController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ThemeInherited(
      themeController: themeController,
      child: ThemeBuilder(
        builder: (_, themeMode) {
          return MaterialApp(
            theme: AppThemeData.lightTheme,
            darkTheme: AppThemeData.darkTheme,
            themeMode: themeMode,
            home: const GridPage(),
          );
        },
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Center(
          child: Column(
            children: [
              const Spacer(),
              const SizedBox(height: 16),
              OutlinedButton(
                onPressed: () {
                  ThemeInherited.of(context).switchThemeMode();
                },
                child: const Text('Switch theme'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  ThemeInherited.of(context).setThemeMode(
                    ThemeMode.light,
                  );
                },
                child: const Text('Set light theme'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  ThemeInherited.of(context).setThemeMode(
                    ThemeMode.dark,
                  );
                },
                child: const Text('Set dark theme'),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  ThemeInherited.of(context).setThemeMode(
                    ThemeMode.system,
                  );
                },
                child: const Text('Set system theme'),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
