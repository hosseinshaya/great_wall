import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:great_wall/domain/base/base_failture.dart';
import 'package:great_wall/domain/base/pagination.dart';
import 'package:great_wall/domain/base/pagination_meta.dart';
import 'package:great_wall/domain/entity/wallpaper.dart';
import 'package:great_wall/domain/repository/wallhaven_repository.dart';
import 'package:great_wall/utils/log/log_helper.dart';

class HomeBloc extends ChangeNotifier {
  HomeBloc({required this.wallhavenRepository});

  final WallhavenRepository wallhavenRepository;

  PaginationMeta? _meta;

  PaginationMeta? get meta => _meta;

  List<Wallpaper> _items = <Wallpaper>[];

  List<Wallpaper> get items => _items;

  set items(List<Wallpaper> value) {
    _items = value;
    notifyListeners();
  }

  bool _loading = false;

  bool get loading => _loading;

  set loading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  bool _lock = false;

  Future<Either<Pagination<Wallpaper>, Failure>?> load(
      {bool refresh = false}) async {
    if (!_lock) {
      if (refresh && _items.isEmpty) {
        loading = true;
      }
      _lock = true;
      try {
        final response = await wallhavenRepository.search(
            page: refresh ? 1 : ((_meta?.currentPage ?? 0) + 1));
        if (response.isRight()) {
          if (refresh) {
            loading = false;
          }
          _lock = false;
          return response;
        } else {
          response.leftMap((left) {
            _meta = left.meta;
            if (refresh) {
              _items = left.items ?? [];
            } else {
              _items.addAll(left.items ?? []);
            }
          });
          _loading = false;
          notifyListeners();
          _lock = false;
          return response;
        }
      } catch (e, s) {
        e.errLog(e, s);
      }
      _lock = false;
      if (refresh) {
        loading = false;
      }
    }
    return null;
  }

  bool canLoadMore() {
    if ((_meta?.currentPage ?? 0) >= (_meta?.lastPage ?? 0)) {
      return false;
    } else {
      return true;
    }
  }
}
