import 'package:flutter/material.dart';
import 'package:recipes_app/core/constants/app_constants.dart';
import 'package:recipes_app/core/constants/view_constants.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        padding: const EdgeInsets.symmetric(
            horizontal: AppConstants.gap16Px, vertical: AppConstants.gap24Px),
        children: [
          Container(
            child: Row(
              children: [Text(ViewConstants.theme)],
            ),
          )
        ],
      )),
    );
  }
}
