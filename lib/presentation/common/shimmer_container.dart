// ignore_for_file: sort_constructors_first

import 'package:flutter/material.dart';
import 'package:great_wall/presentation/common/shimmer_component.dart';

class ShimmerContainer extends StatelessWidget {
  final double? height;
  final double? width;
  final EdgeInsets margin;
  final double radius;
  final Color? background;
  final Color? foreground;

  const ShimmerContainer(
      {Key? key,
      this.height,
      this.width,
      this.margin = EdgeInsets.zero,
      this.radius = 12,
      this.background,
      this.foreground})
      : super(key: key);

  @override
  Widget build(BuildContext context) => ShimmerComponent(
        background: background,
        foreground: foreground,
        child: Container(
          margin: margin,
          height: height,
          width: width ?? double.infinity,
          decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(radius)),
        ),
      );
}
