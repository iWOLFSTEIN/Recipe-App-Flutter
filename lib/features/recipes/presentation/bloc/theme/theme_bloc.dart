import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:recipes_app/config/theme/base.dart';
import 'package:recipes_app/config/theme/dark.dart';
import 'package:recipes_app/config/theme/light.dart';
import 'package:recipes_app/core/constants/app_constants.dart';
import 'package:recipes_app/features/recipes/domain/usecases/theme/get_theme.dart';
import 'package:recipes_app/features/recipes/domain/usecases/theme/set_theme.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final GetThemeUseCase _getThemeUseCase;
  final SetThemeUseCase _setThemeUseCase;
  late BaseTheme baseTheme;

  ThemeBloc(this._getThemeUseCase, this._setThemeUseCase)
      : super(const InitialThemeState()) {
    _setInitialTheme();
    on<ThemeEvent>(_setTheme);
  }

  void _setInitialTheme() {
    final String storedTheme = _getThemeUseCase();
    if (storedTheme == AppConstants.light) {
      baseTheme = LightTheme();
    } else if (storedTheme == AppConstants.dark) {
      baseTheme = DarkTheme();
    }
  }

  void _setTheme(ThemeEvent event, Emitter<ThemeState> emit) async {
    baseTheme = event.theme;
    if (event is LightThemeEvent) {
      _setThemeUseCase.call(theme: AppConstants.light);
      return emit(const LightThemeState());
    } else if (event is DarkThemeEvent) {
      _setThemeUseCase.call(theme: AppConstants.dark);
      return emit(const DarkThemeState());
    }
  }
}
