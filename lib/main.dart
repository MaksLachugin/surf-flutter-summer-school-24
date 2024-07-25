import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:surf_flutter_summer_school_24/feature/photo/repo/photo_repo.dart';
import 'package:surf_flutter_summer_school_24/feature/photo/repo/mock_photo_repo.dart';
import 'package:surf_flutter_summer_school_24/screen/grid/grid_page.dart';
import 'package:surf_flutter_summer_school_24/storage/theme/theme_storage.dart';
import 'package:surf_flutter_summer_school_24/uikit/theme/theme_data.dart';
import 'feature/theme/theme.dart';

GetIt getIt = GetIt.instance;
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

  getIt.registerSingleton<PhotoRepo>(MockPhotoRepo());
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
