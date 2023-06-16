import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:great_wall/domain/base/base_failture.dart';
import 'package:great_wall/domain/base/pagination.dart';
import 'package:great_wall/domain/base/pagination_meta.dart';
import 'package:great_wall/domain/entity/thumbs.dart';
import 'package:great_wall/domain/entity/wallpaper.dart';
import 'package:great_wall/domain/repository/wallhaven_repository.dart';
import 'package:great_wall/presentation/logic/home_bloc.dart';

void main() {
  HomeBloc bloc = HomeBloc(wallhavenRepository: MockWallhavenRepositoryImpl());
  test('pagination', () async {
    expect(bloc.items, []);
    expect(bloc.loading, false);
    expect(bloc.meta, null);
    bloc.load(refresh: true);
    expect(bloc.loading, true);
    expect(bloc.meta, null);
    await Future.delayed(const Duration(seconds: 1));
    expect(bloc.loading, false);
    expect(bloc.items.length, 9);
    expect(bloc.meta?.currentPage, 1);
    expect(bloc.meta?.lastPage, 3);
    expect(bloc.meta?.perPage, 10);
    expect(bloc.meta?.total, 30);
    expect(bloc.canLoadMore(), true);
    bloc.load();
    expect(bloc.loading, false);
    await Future.delayed(const Duration(seconds: 1));
    expect(bloc.items.length, 19);
    expect(bloc.meta?.currentPage, 2);
    expect(bloc.canLoadMore(), true);
    await bloc.load();
    expect(bloc.meta?.currentPage, 3);
    expect(bloc.items.length, 29);
    expect(bloc.canLoadMore(), false);
  });
}

class MockWallhavenRepositoryImpl implements WallhavenRepository {
  final List<Wallpaper> mockItems = List.generate(
    30,
    (index) => Wallpaper(
      id: 'id$index',
      views: index,
      favorites: index,
      category: 'category$index',
      resolution: '100x200',
      ratio: '16.9',
      fileSize: index,
      colors: [],
      path: 'path',
      thumbs:
          const Thumbs(small: 'small', original: 'original', large: 'large'),
    ),
  );

  @override
  Future<Either<Pagination<Wallpaper>, Failure>> search(
      {required int page}) async {
    await Future.delayed(const Duration(seconds: 1));
    switch (page) {
      case 1:
        return Left(
          Pagination<Wallpaper>(
            items: mockItems.getRange(0, 9).toList(),
            meta: PaginationMeta(
                currentPage: page,
                lastPage: 3,
                perPage: 10,
                total: mockItems.length),
          ),
        );
      case 2:
        return Left(
          Pagination<Wallpaper>(
            items: mockItems.getRange(9, 19).toList(),
            meta: PaginationMeta(
                currentPage: page,
                lastPage: 3,
                perPage: 10,
                total: mockItems.length),
          ),
        );
      case 3:
        return Left(
          Pagination<Wallpaper>(
            items: mockItems.getRange(19, 29).toList(),
            meta: PaginationMeta(
                currentPage: page,
                lastPage: 3,
                perPage: 10,
                total: mockItems.length),
          ),
        );
    }
    return const Right(BaseFailure(code: 404, message: 'not found'));
  }
}
