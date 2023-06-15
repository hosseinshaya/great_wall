import 'package:flutter/material.dart';
import 'package:great_wall/common/styles/appTheme/app_theme_helper.dart';
import 'package:great_wall/utils/locale_helper.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerComponent extends StatelessWidget {
  const ShimmerComponent(
      {Key? key,
      required this.child,
      this.loading = true,
      this.background,
      this.foreground})
      : super(key: key);

  final Widget child;
  final bool loading;
  final Color? background;
  final Color? foreground;

  @override
  Widget build(BuildContext context) => loading
      ? Shimmer.fromColors(
          baseColor: background ?? context.colorScheme.surface,
          highlightColor:
              foreground ?? context.colorScheme.outline.withOpacity(0.5),
          direction: context.localeDirection == TextDirection.rtl
              ? ShimmerDirection.rtl
              : ShimmerDirection.ltr,
          child: child,
        )
      : child;
}
