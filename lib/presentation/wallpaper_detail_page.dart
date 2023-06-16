import 'package:flutter/material.dart';
import 'package:great_wall/domain/entity/wallpaper.dart';

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
          ],
        ),
      );
}
