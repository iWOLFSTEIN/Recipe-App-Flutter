part of 'theme_bloc.dart';

sealed class ThemeState extends Equatable {
  const ThemeState();

  @override
  List<Object> get props => [];
}

final class InitialThemeState extends ThemeState {
  const InitialThemeState();
}

final class DarkThemeState extends ThemeState {
  const DarkThemeState();
}

final class LightThemeState extends ThemeState {
  const LightThemeState();
}
