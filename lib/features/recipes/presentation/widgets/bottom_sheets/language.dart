import 'package:flutter/material.dart';
import 'package:recipes_app/core/constants/view_constants.dart';
import 'package:recipes_app/features/recipes/presentation/widgets/translated_text.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [TranslatedText(ViewConstants.languages)],
      ),
    );
  }
}
