import 'themeEntity.dart';
import 'theme_repository.dart';

class GetThemeUseCase {
  final ThemeRepository repository;

  GetThemeUseCase(this.repository);

  ThemeEntity call() {
    return repository.getTheme();
  }
}