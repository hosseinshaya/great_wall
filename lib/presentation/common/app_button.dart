import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:great_wall/common/styles/appTheme/app_theme_helper.dart';
import 'package:great_wall/presentation/common/push_down_animation.dart';
import 'package:great_wall/presentation/common/switcher.dart';
import 'package:great_wall/utils/color_helper.dart';
import 'package:great_wall/utils/log/log_helper.dart';

import 'loading_widget.dart';

enum ButtonType { primary, secondary, tertiary }

class AppButton extends StatefulWidget {
  const AppButton(
      {required this.onPressed,
      this.text,
      this.child,
      bool widthFromHeight = false,
      double? width,
      this.enabled = true,
      this.loading,
      this.height = 48,
      this.color,
      this.maxWidth,
      this.minWidth,
      this.borderSide = BorderSide.none,
      this.type = ButtonType.primary,
      Key? key,
      this.icon,
      this.iconSize = 22,
      this.foregroundColor,
      this.margin})
      : width = widthFromHeight ? height : (width ?? double.infinity),
        super(key: key);

  final Widget? child;
  final String? text;
  final AsyncCallback onPressed;
  final bool enabled;
  final bool? loading;
  final double width;
  final double height;
  final Color? color;
  final double? maxWidth;
  final double? minWidth;
  final BorderSide borderSide;
  final ButtonType type;
  final IconData? icon;
  final EdgeInsets? margin;
  final double iconSize;
  final Color? foregroundColor;

  @override
  State<AppButton> createState() => AppButtonState();
}

class AppButtonState extends State<AppButton> {
  bool loading = false;

  bool get finalLoading => widget.loading ?? loading;

  @override
  Widget build(BuildContext context) => PushDownAnimation(
        enabled: widget.enabled,
        child: Container(
          height: widget.height,
          width: widget.width,
          margin: widget.margin,
          constraints: BoxConstraints(
            maxWidth:
                widget.maxWidth == null ? double.infinity : widget.maxWidth!,
            minWidth: widget.minWidth == null ? 0 : widget.minWidth!,
          ),
          child: ElevatedButton(
            onPressed: widget.enabled
                ? (!finalLoading
                    ? () async {
                        if (mounted) {
                          setState(() => loading = true);
                        }
                        FocusScope.of(context).requestFocus(FocusNode());
                        try {
                          await widget.onPressed();
                        } catch (e) {
                          e.errLog();
                        }
                        if (mounted) {
                          setState(() => loading = false);
                        }
                      }
                    : () {})
                : null,
            style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
                  elevation: MaterialStateProperty.all(0),
                  backgroundColor: MaterialStateProperty.resolveWith(
                      (Set<MaterialState> states) =>
                          states.contains(MaterialState.disabled)
                              ? context.colorScheme.surfaceVariant
                              : widget.color ?? _getTypeColor(context, widget)),
                  shadowColor: !widget.enabled
                      ? const MaterialStatePropertyAll(Colors.transparent)
                      : MaterialStateProperty.all(
                          (widget.color ?? _getTypeColor(context, widget))
                              .withOpacity(0.4)),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: (widget.enabled && !finalLoading)
                          ? widget.borderSide
                          : widget.borderSide.copyWith(
                              color: context.colorScheme.background),
                    ),
                  ),
                  surfaceTintColor: MaterialStatePropertyAll(widget.color !=
                          null
                      ? context.colorScheme
                          .primary
                      : _getTypeColor(context, widget)),
                  overlayColor: MaterialStatePropertyAll(
                      _getTypeColor(context, widget).darken(.05)),
                  padding: MaterialStateProperty.all(const EdgeInsets.all(4)),
                ),
            child: Builder(builder: (_) {
              Color foregroundColor = widget.foregroundColor ??
                  _getOnTypeColor(context, widget.type);
              return Switcher(
                  child: finalLoading
                      ? Center(
                          key: const Key('loading'),
                          child: LoadingWidget(
                              color: foregroundColor, size: widget.height / 3))
                      : (widget.child ??
                          Center(
                            key: Key('normal${widget.text}'),
                            child: Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              spacing: 8,
                              runSpacing: 4,
                              children: <Widget>[
                                if (widget.icon != null)
                                  Icon(widget.icon,
                                      size: widget.iconSize,
                                      color: foregroundColor),
                                if (widget.text != null)
                                  Text(widget.text!,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(
                                            color: foregroundColor,
                                            fontWeight: FontWeight.w900,
                                            fontSize: 15,
                                          )),
                              ],
                            ),
                          )));
            }),
          ),
        ),
      );

  Color _getTypeColor(BuildContext context, AppButton widget) {
    if (widget.color != null) {
      return widget.color!;
    }
    if (!widget.enabled) {
      return context.colorScheme.surfaceVariant;
    }
    switch (widget.type) {
      case ButtonType.primary:
        return context.colorScheme.primary;
      case ButtonType.secondary:
        return context.colorScheme.surface;
      case ButtonType.tertiary:
        return context.colorScheme.secondary;
    }
  }

  Color _getOnTypeColor(BuildContext context, ButtonType type) {
    if (!widget.enabled) {
      return context.colorScheme.onSurfaceVariant.withOpacity(0.3);
    }
    switch (type) {
      case ButtonType.primary:
        return context.colorScheme.onPrimary;
      case ButtonType.secondary:
        return context.colorScheme.onSurfaceVariant;
      case ButtonType.tertiary:
        return context.colorScheme.onSecondary;
    }
  }
}
