import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:great_wall/common/styles/appTheme/app_theme_helper.dart';

enum ToastType { error, success, info, warning }

class Toast {
  static CancelFunc? cancelFunc;

  static void show(
    BuildContext context,
    String text, {
    required ToastType type,
    EdgeInsetsGeometry? margin,
    AlignmentGeometry? align,
  }) {
    if (cancelFunc != null) {
      cancelFunc!.call();
    }
    cancelFunc = BotToast.showCustomText(
      duration: getDuration(text),
      align: align ?? AlignmentDirectional.bottomStart,
      toastBuilder: (_) => Builder(builder: (BuildContext context) {
        late Color background;
        late Color foreground;
        late IconData icon;
        switch (type) {
          case ToastType.error:
            background = context.colorScheme.errorContainer;
            foreground = context.colorScheme.onErrorContainer;
            icon = Icons.cancel_rounded;
            break;
          case ToastType.success:
            background = context.colorScheme.primaryContainer;
            foreground = context.colorScheme.onPrimaryContainer;
            icon = Icons.check_circle_rounded;
            break;
          case ToastType.info:
            background = context.colorScheme.secondaryContainer;
            foreground = context.colorScheme.onSecondaryContainer;
            icon = Icons.info_rounded;
            break;
          case ToastType.warning:
            background = context.colorScheme.tertiaryContainer;
            foreground = context.colorScheme.onTertiaryContainer;
            icon = Icons.warning_rounded;
            break;
        }
        return GestureDetector(
          onTap: getDuration(text).inMilliseconds > 3000
              ? () {
                  if (cancelFunc != null) {
                    cancelFunc!.call();
                  }
                }
              : null,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30)
                .add(margin ?? EdgeInsets.zero),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: background.withOpacity(0.9),
            ),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: IntrinsicHeight(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 13, horizontal: 12),
                  child: Row(
                    children: <Widget>[
                      Icon(icon, color: foreground.withOpacity(0.4), size: 22),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Text(text,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(color: foreground)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }),
      wrapToastAnimation:
          (AnimationController controller, CancelFunc cancel, Widget child) =>
              CustomAnimationWidget(
        controller: controller,
        child: child,
      ),
    );
  }

  static Duration getDuration(String? text) {
    int milliseconds = ((text?.length ?? 0) * 48).round();
    milliseconds = milliseconds < 2000 ? 2000 : milliseconds;
    milliseconds = milliseconds > 6000 ? 6000 : milliseconds;
    return Duration(milliseconds: milliseconds);
  }
}

class CustomAnimationWidget extends StatefulWidget {
  const CustomAnimationWidget(
      {required this.controller, required this.child, Key? key})
      : super(key: key);

  final AnimationController controller;
  final Widget child;

  @override
  _CustomAnimationWidgetState createState() => _CustomAnimationWidgetState();
}

class _CustomAnimationWidgetState extends State<CustomAnimationWidget> {
  static final Tween<Offset> tweenOffset = Tween<Offset>(
    begin: const Offset(125, 0),
    end: const Offset(0, 0),
  );

  static final Tween<double> tweenScale = Tween<double>(begin: 0.7, end: 1.0);
  late Animation<double> animation;

  @override
  void initState() {
    animation =
        CurvedAnimation(parent: widget.controller, curve: Curves.decelerate);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
        animation: animation,
        builder: (BuildContext context, Widget? child) => Transform.translate(
          offset: tweenOffset.evaluate(animation),
          child: Transform.scale(
            scale: tweenScale.evaluate(animation),
            child: Opacity(
              opacity: animation.value,
              child: child,
            ),
          ),
        ),
        child: widget.child,
      );
}
