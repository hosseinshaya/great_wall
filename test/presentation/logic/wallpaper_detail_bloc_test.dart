import 'package:flutter_test/flutter_test.dart';
import 'package:great_wall/domain/entity/thumbs.dart';
import 'package:great_wall/domain/entity/wallpaper.dart';
import 'package:great_wall/presentation/logic/wallpaper_detail_bloc.dart';

void main() {
  const mockWallpaper = Wallpaper(
    id: 'id',
    views: 5,
    favorites: 2,
    category: 'anime',
    resolution: '100x400',
    ratio: '16.9',
    fileSize: 1234,
    colors: [],
    path: 'path',
    thumbs: Thumbs(small: 'small', original: 'original', large: 'large'),
  );
  WallpaperDetailBloc bloc = WallpaperDetailBloc(mockWallpaper);

  test('description', () async {
    expect(bloc.savedPath, null);
    expect(bloc.downloading, false);
    bloc.download();
    expect(bloc.downloading, true);
  });
}
