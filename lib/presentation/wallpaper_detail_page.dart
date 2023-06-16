import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:great_wall/common/localization/locale_keys.g.dart';
import 'package:great_wall/domain/entity/wallpaper.dart';
import 'package:great_wall/presentation/common/app_button.dart';

import 'common/image_component.dart';

class WallpaperDetailPage extends StatelessWidget {
  const WallpaperDetailPage(this.wallpaper, {super.key});

  final Wallpaper wallpaper;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: ListView(
          padding: const EdgeInsets.fromLTRB(24, 65, 24, 24),
          children: [
            Hero(
              tag: wallpaper.id,
              child: LayoutBuilder(
                  builder: (context, constraints) => ClipRRect(
                        borderRadius:
                            BorderRadius.circular(constraints.maxWidth / 8),
                        child: AspectRatio(
                          aspectRatio: double.parse(wallpaper.ratio),
                          child: ImageComponent(
                            wallpaper.path,
                            placeholder: (context, url) =>
                                ImageComponent(wallpaper.thumbs.original),
                          ),
                        ),
                      )),
            ),
            const SizedBox(height: 24),
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: SizedBox(
                height: 15,
                child: Row(
                  children: wallpaper.colors
                      .map((color) => Expanded(
                              child: Container(
                            color: color,
                          )))
                      .toList(),
                ),
              ),
            ),
            const SizedBox(height: 24),
            AppButton(
              text: LocaleKeys.common_button_download.tr(),
              onPressed: () async {},
            ),
            const SizedBox(height: 24),
            const SizedBox(height: 24),
          ],
        ),
      );
}
