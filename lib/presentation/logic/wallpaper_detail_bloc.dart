import 'package:flutter/material.dart';
import 'package:great_wall/common/api/api_client.dart';
import 'package:great_wall/domain/entity/wallpaper.dart';
import 'package:great_wall/utils/log/log_helper.dart';
import 'package:path_provider/path_provider.dart';

class WallpaperDetailBloc extends ChangeNotifier {
  WallpaperDetailBloc(this.wallpaper);

  final Wallpaper wallpaper;

  bool _downloading = false;

  bool get downloading => _downloading;

  set downloading(bool loading) {
    _downloading = loading;
    notifyListeners();
  }

  int _downloadPercent = 0;

  int get downloadPercent => _downloadPercent;

  set downloadPercent(int value) {
    _downloadPercent = value;
    notifyListeners();
  }

  String? _savedPath;

  String? get savedPath => _savedPath;

  set savedPath(String? value) {
    _savedPath = value;
    notifyListeners();
  }

  Future<void> download() async {
    try {
      downloading = true;
      var tempPath = await getTemporaryDirectory();
      String savePath = '${tempPath.path}${wallpaper.id}.jpeg';
      await ApiClient().dio.download(
        wallpaper.path,
        savePath,
        onReceiveProgress: (count, total) {
          downloadPercent = (count / total * 100).toInt();
        },
      );
      savedPath = savePath;
    } catch (e) {
      e.errLog();
    }
    downloading = false;
  }
}
