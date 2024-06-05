part of 'language_bloc.dart';

sealed class LanguageState extends Equatable {
  const LanguageState();

  @override
  List<Object> get props => [];
}

final class InitialLanguageState extends LanguageState {
  const InitialLanguageState();
}

final class ChangedLanguageState extends LanguageState {
  const ChangedLanguageState();
}
