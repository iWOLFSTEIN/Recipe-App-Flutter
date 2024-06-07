import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/core/constants/app_constants.dart';
import 'package:recipes_app/features/recipes/presentation/bloc/theme/theme_bloc.dart';

class CustomField extends StatelessWidget {
  const CustomField(
      {super.key, this.controller, this.hintText, this.suffixIcon});

  final TextEditingController? controller;
  final String? hintText;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    final ThemeBloc themeBloc = context.read<ThemeBloc>();
    final border = OutlineInputBorder(
        borderSide: BorderSide(color: themeBloc.baseTheme.border),
        borderRadius: const BorderRadius.all(Radius.circular(15)));
    return TextFormField(
      controller: controller,
      onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
      decoration: InputDecoration(
          hintText: hintText?.tr(),
          hintStyle: TextStyle(
              color: themeBloc.baseTheme.secondaryText.withOpacity(0.5)),
          filled: true,
          fillColor: themeBloc.baseTheme.surface,
          border: border,
          enabledBorder: border,
          focusedBorder: border,
          contentPadding: const EdgeInsets.symmetric(
              horizontal: AppConstants.gap16Px, vertical: AppConstants.gap16Px),
          suffixIcon: suffixIcon),
    );
  }
}
