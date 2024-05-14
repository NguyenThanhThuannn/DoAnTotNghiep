import '../domain/themeEntity.dart';
import '../domain/theme_repository.dart';
import 'theme_model.dart';

class ThemeRepositoryImpl implements ThemeRepository {
  ThemeModel _currentTheme = ThemeModel.light();

  @override
  ThemeEntity getTheme() {
    return ThemeEntity(_currentTheme.themeData);
  }

  @override
  void setTheme(ThemeEntity theme) {
    _currentTheme = ThemeModel(themeData: theme.themeData);
  }
}