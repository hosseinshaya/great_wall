import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:great_wall/common/localization/locale_keys.g.dart';
import 'package:great_wall/presentation/common/app_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(LocaleKeys.name.tr()),
        ),
        body: ListView.separated(
          itemCount: 20,
          itemBuilder: (context, index) => AppButton(
            text: 'test',
            onPressed: () async {},
          ),
          separatorBuilder: (context, index) => const SizedBox(height: 12),
          padding: const EdgeInsets.all(12),
        ),
      );
}
