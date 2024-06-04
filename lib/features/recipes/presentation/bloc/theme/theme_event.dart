part of 'theme_bloc.dart';

sealed class ThemeEvent extends Equatable {
  final BaseTheme theme;
  const ThemeEvent(this.theme);

  @override
  List<Object> get props => [];
}

class LightThemeEvent extends ThemeEvent {
  LightThemeEvent() : super(LightTheme());
}

class DarkThemeEvent extends ThemeEvent {
  DarkThemeEvent() : super(DarkTheme());
}
