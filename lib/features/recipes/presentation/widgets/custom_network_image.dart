import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/features/recipes/presentation/bloc/theme/theme_bloc.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage(
      {super.key,
      required this.coverImage,
      this.borderRadius = 15,
      this.height = 350,
      this.width = double.infinity});

  final String coverImage;
  final double borderRadius;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    final themeBloc = context.read<ThemeBloc>();
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: themeBloc.baseTheme.placeholder,
          border: Border.all(color: themeBloc.baseTheme.border),
          borderRadius: BorderRadius.all(Radius.circular(borderRadius))),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        child: Image.network(
          coverImage,
          height: height,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return SizedBox(
              height: height,
              child: Center(
                child: SizedBox(
                    width: 100,
                    height: 2,
                    child: LinearProgressIndicator(
                      value: (loadingProgress.cumulativeBytesLoaded) /
                          (loadingProgress.expectedTotalBytes ?? 1.0),
                    )),
              ),
            );
          },
          errorBuilder: (context, error, stackTrace) => const Center(
              child: Icon(
            Icons.broken_image,
            size: 24,
          )),
        ),
      ),
    );
  }
}
