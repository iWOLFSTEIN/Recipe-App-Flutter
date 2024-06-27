import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/features/recipes/presentation/bloc/theme/theme_bloc.dart';

dynamic showModalSheet({
  required BuildContext context,
  required Widget content,
  Color? backgroundColor,
  bool showDragHandle = false,
  bool useSafeArea = true,
  bool isScrollControlled = false,
}) async {
  backgroundColor =
      backgroundColor ?? context.read<ThemeBloc>().baseTheme.identity;
  final result = await showModalBottomSheet(
      useRootNavigator: true,
      context: context,
      useSafeArea: useSafeArea,
      showDragHandle: showDragHandle,
      isScrollControlled: isScrollControlled,
      backgroundColor: backgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      clipBehavior: Clip.hardEdge,
      builder: (context) => content);
  return result;
}
