import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

final isDarkmodeProvider = StateProvider<bool>((ref) => false);

final colorListProvider = Provider((ref) => colorList);

final selectedColorProvider = StateProvider<int>((ref) => 0);

final themeNotifierProvider = 
StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => 
  ThemeNotifier()
  );

class ThemeNotifier extends StateNotifier<AppTheme> {
  ThemeNotifier(): super(AppTheme());

  void toggleTheme() {
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void changeColor(int index) {
    state = state.copyWith(selectedColor: index);
  } 

}
