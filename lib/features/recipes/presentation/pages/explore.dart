import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipes_app/config/router/app_router.dart';
import 'package:recipes_app/core/constants/app_constants.dart';

class Explore extends StatelessWidget {
  const Explore({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.pop(AppRouter.explore.id);
        return true;
      },
      child: Scaffold(
        body: SafeArea(
            child: ListView(
          padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.gap16Px, vertical: AppConstants.gap24Px),
          children: const [],
        )),
      ),
    );
  }
}
