import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:surf_flutter_summer_school_24/feature/theme/data/theme_repository.dart';

class ThemeController {
  final ThemeRepository _themeRepository;

  ThemeController({
    required ThemeRepository themeRepository,
  }) : _themeRepository = themeRepository;

  late final ValueNotifier<ThemeMode> _themeMode = ValueNotifier<ThemeMode>(
    _themeRepository.getThemeMode() ?? ThemeMode.system,
  );

  ValueListenable<ThemeMode> get themeMode => _themeMode;

  Future<void> setThemeMode(ThemeMode newThemeMode) async {
    if (newThemeMode == _themeMode.value) return;
    await _themeRepository.setThemeMode(newThemeMode);
    _themeMode.value = newThemeMode;
  }

  Future<void> switchThemeMode() async {
    final newThemeMode =
        _themeMode.value != ThemeMode.light ? ThemeMode.light : ThemeMode.dark;
    await _themeRepository.setThemeMode(newThemeMode);
    _themeMode.value = newThemeMode;
  }
}

extension ThemeModeExtension on ThemeMode {
  String get getName {
    switch (this) {
      case ThemeMode.system:
        return "Системная";
      case ThemeMode.light:
        return "Светлая";
      case ThemeMode.dark:
        return "Темная";
    }
  }
}
