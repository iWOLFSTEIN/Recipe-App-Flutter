import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/core/constants/app_constants.dart';
import 'package:recipes_app/core/constants/view_constants.dart';
import 'package:recipes_app/features/recipes/presentation/bloc/theme/theme_bloc.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget(
      {super.key, this.message = ViewConstants.anErrorOccured});

  final String message;

  @override
  Widget build(BuildContext context) {
    final themeBloc = context.read<ThemeBloc>();
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.font16Px * 2),
        child: Text(
          message,
          textAlign: TextAlign.center,
          style: TextStyle(color: themeBloc.baseTheme.primaryText),
        ),
      ),
    );
  }
}

class CustomLoadingWidget extends StatelessWidget {
  const CustomLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class CustomInfoWidget extends StatelessWidget {
  const CustomInfoWidget({super.key, this.message = ViewConstants.noDataFound});

  final String message;

  @override
  Widget build(BuildContext context) {
    final themeBloc = context.read<ThemeBloc>();
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.font16Px * 2),
        child: Text(
          message,
          textAlign: TextAlign.center,
          style: TextStyle(color: themeBloc.baseTheme.primaryText),
        ),
      ),
    );
  }
}
