import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:great_wall/presentation/common/app_button.dart';
import 'package:great_wall/utils/locale_helper.dart';
import '/common/localization/locale_keys.g.dart';

class PageComponentFooter extends StatelessWidget {
  const PageComponentFooter(
      {required this.onSubmit,
      Key? key,
      this.onCancel,
      this.submitText,
      this.cancelText,
      this.invert = false})
      : super(key: key);

  final AsyncCallback onSubmit;
  final AsyncCallback? onCancel;
  final String? submitText;
  final String? cancelText;
  final bool invert;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.fromLTRB(4, 2, 4, 4),
        child: Row(
          textDirection:
              invert ? context.invertLocaleDirection : context.localeDirection,
          children: [
            Expanded(
              flex: 3,
              child: AppButton(
                onPressed: onSubmit,
                text: submitText ?? LocaleKeys.common_button_submit.tr(),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              flex: 2,
              child: AppButton(
                onPressed: onCancel ??
                    () async {
                      Navigator.of(context).pop();
                    },
                type: ButtonType.secondary,
                text: cancelText ?? LocaleKeys.common_button_cancel.tr(),
              ),
            ),
          ],
        ),
      );
}
