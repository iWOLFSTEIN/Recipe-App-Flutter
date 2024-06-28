import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:recipes_app/config/languages/language.dart';
import 'package:recipes_app/core/constants/app_constants.dart';
import 'package:recipes_app/core/constants/view_constants.dart';
import 'package:recipes_app/features/recipes/presentation/bloc/language/language_bloc.dart';
import 'package:recipes_app/features/recipes/presentation/bloc/theme/theme_bloc.dart';
import 'package:recipes_app/features/recipes/presentation/widgets/translated_text.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeBloc themeBloc = context.read<ThemeBloc>();
    final LanguageBloc languageBloc = context.watch<LanguageBloc>();
    final List<Language> languages = languageBloc.languages;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: themeBloc.baseTheme.border.withOpacity(0.2)),
          ),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.gap16Px, vertical: AppConstants.gap24Px),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              TranslatedText(
                ViewConstants.languages,
                style: TextStyle(
                    color: themeBloc.baseTheme.primaryText,
                    fontSize: AppConstants.font18Px,
                    fontWeight: FontWeight.w600),
              ),
              const Gap(AppConstants.font14Px),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: languages
                    .map((language) => LanguageTile(language: language))
                    .toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class LanguageTile extends StatelessWidget {
  const LanguageTile({
    super.key,
    required this.language,
  });

  final Language language;

  @override
  Widget build(BuildContext context) {
    final ThemeBloc themeBloc = context.read<ThemeBloc>();
    final LanguageBloc languageBloc = context.watch<LanguageBloc>();
    final List<Language> languages = languageBloc.languages;
    return Column(
      children: [
        GestureDetector(
          onTap: () => onTap(context),
          child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(AppConstants.font18Px),
              decoration: BoxDecoration(
                  color: themeBloc.baseTheme.background,
                  border: Border.all(color: themeBloc.baseTheme.border),
                  borderRadius: const BorderRadius.all(Radius.circular(20))),
              child: Row(
                children: [
                  Text(
                    language.name,
                    style: TextStyle(color: themeBloc.baseTheme.primaryText),
                  ),
                  const Spacer(),
                  if (language == languageBloc.selectedLanguage)
                    const TileSelectedIcon()
                ],
              )),
        ),
        if (language != languages.last) const Gap(AppConstants.gap10Px)
      ],
    );
  }

  void onTap(BuildContext context) {
    context
        .read<LanguageBloc>()
        .add(ChangedLanguageEvent(context: context, language: language));
    Navigator.pop(context);
  }
}

class TileSelectedIcon extends StatelessWidget {
  const TileSelectedIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final themeBloc = context.read<ThemeBloc>();
    return Container(
      padding: const EdgeInsets.all(AppConstants.gap4Px),
      decoration: BoxDecoration(
          border: Border.all(color: themeBloc.baseTheme.border),
          color: themeBloc.baseTheme.identity,
          shape: BoxShape.circle),
      child: Center(
        child: Icon(
          Icons.check,
          color: themeBloc.baseTheme.contrast,
          size: 10,
        ),
      ),
    );
  }
}
