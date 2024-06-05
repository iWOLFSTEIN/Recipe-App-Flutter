part of 'language_bloc.dart';

sealed class LanguageEvent extends Equatable {
  final BuildContext context;
  final String name;
  final Locale locale;
  const LanguageEvent(
      {required this.context, required this.name, required this.locale});

  @override
  List<Object> get props => [context, locale];
}
