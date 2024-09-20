import 'package:afghan_food/theme/themes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeProvider = ChangeNotifierProvider<ThemeModel>((ref) {
  return ThemeModel();
});
