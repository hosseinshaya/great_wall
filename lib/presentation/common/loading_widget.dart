import 'package:flutter/material.dart';
import 'package:great_wall/common/styles/appTheme/app_theme_helper.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget(
      {this.size = 24, this.strokeWidth = 3.5, Key? key, this.color})
      : super(key: key);
  final double size;
  final double strokeWidth;
  final Color? color;

  @override
  Widget build(BuildContext context) => SizedBox(
        width: size,
        height: size,
        child: CircularProgressIndicator(
          color: color ?? context.colorScheme.primary,
          strokeWidth: strokeWidth,
        ),
      );
}
