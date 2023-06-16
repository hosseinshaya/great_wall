import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:great_wall/common/localization/locale_keys.g.dart';
import 'package:great_wall/common/styles/appTheme/app_theme_helper.dart';
import 'package:great_wall/domain/entity/wallpaper.dart';
import 'package:great_wall/presentation/common/app_button.dart';
import 'package:great_wall/presentation/logic/wallpaper_detail_bloc.dart';
import 'package:great_wall/utils/toast.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

import 'common/image_component.dart';

class WallpaperDetailPage extends StatelessWidget {
  const WallpaperDetailPage(this.wallpaper, {super.key});

  final Wallpaper wallpaper;

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => WallpaperDetailBloc(wallpaper),
      builder: (context, child) => Scaffold(
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
                Consumer<WallpaperDetailBloc>(
                    builder: (context, bloc, child) => AppButton(
                          enabled: bloc.downloadPercent < 100,
                          text: bloc.downloadPercent == 100
                              ? LocaleKeys.wallpaperDetail_saved.tr()
                              : bloc.downloading
                                  ? '${bloc.downloadPercent}%'
                                  : LocaleKeys.common_button_download.tr(),
                          onPressed: () async {
                            if (await Permission.storage.request().isGranted) {
                              bloc.download().then((_) {
                                Toast.show(
                                    context,
                                    LocaleKeys
                                        .wallpaperDetail_downloadedSuccessfully
                                        .tr(),
                                    type: ToastType.success);
                              });
                            } else {
                              // ignore: use_build_context_synchronously
                              Toast.show(
                                  context,
                                  LocaleKeys.wallpaperDetail_permissionError
                                      .tr(),
                                  type: ToastType.warning);
                            }
                          },
                        )),
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
                Wrap(
                  spacing: 40,
                  runSpacing: 24,
                  children: [
                    Text(wallpaper.category.toUpperCase()),
                    Text(wallpaper.resolution),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.visibility_rounded,
                          color: context.colorScheme.outline,
                        ),
                        const SizedBox(width: 8),
                        Text(wallpaper.views.toString()),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.favorite_rounded,
                          color: context.colorScheme.outline,
                        ),
                        const SizedBox(width: 8),
                        Text(wallpaper.favorites.toString()),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 24),
              ],
            ),
          ));
}
