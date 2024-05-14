import 'themeEntity.dart';

abstract class ThemeRepository {
  ThemeEntity getTheme();
  void setTheme(ThemeEntity theme);
}