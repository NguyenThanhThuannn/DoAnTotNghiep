import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../domain/get_theme.dart';
import '../domain/set_theme.dart';
import '../domain/themeEntity.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc(this._getThemeUseCase,this._setThemeUseCase) : super(ThemeState(_getThemeUseCase())) {
    on<LoadTheme>((event, emit) {
      emit(ThemeState(_getThemeUseCase()));
    });
    on<ChangeTheme>((event, emit) {
      _setThemeUseCase(event.theme);
      emit(ThemeState(event.theme));
    },);
  }
  final GetThemeUseCase _getThemeUseCase;
  final SetThemeUseCase _setThemeUseCase;
}
