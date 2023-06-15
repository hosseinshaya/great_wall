import 'package:dartz/dartz.dart';
import 'package:great_wall/data/remote/wallhaven_api.dart';
import 'package:great_wall/domain/base/base_failture.dart';
import 'package:great_wall/domain/base/pagination.dart';
import 'package:great_wall/domain/entity/wallpaper.dart';
import 'package:great_wall/domain/repository/wallhaven_repository.dart';

import '../../domain/base/base_exception.dart';

class WallhavenApiRepository implements WallhavenRepository {
  final WallhavenApi wallhavenApi = WallhavenApi();

  @override
  Future<Either<Pagination<Wallpaper>, Failure>> search({required int page}) async {
    try {
      final response = await wallhavenApi.search(page: page);
      return Left(response.data);
    } on BaseException catch (e) {
      return Right(BaseFailure(message: e.message, code: e.code!));
    }
  }
}
