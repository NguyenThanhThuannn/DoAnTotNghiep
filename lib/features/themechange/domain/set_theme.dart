import 'themeEntity.dart';
import 'theme_repository.dart';

class SetThemeUseCase {
  final ThemeRepository repository;

  SetThemeUseCase(this.repository);

  void call(ThemeEntity theme) {
    repository.setTheme(theme);
  }
}