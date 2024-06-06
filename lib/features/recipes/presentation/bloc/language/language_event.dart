part of 'language_bloc.dart';

sealed class LanguageEvent extends Equatable {
  final BuildContext context;
  final Language language;
  const LanguageEvent({required this.context, required this.language});

  @override
  List<Object> get props => [context, language];
}

class ChangedLanguageEvent extends LanguageEvent {
  const ChangedLanguageEvent({required super.context, required super.language});
}
