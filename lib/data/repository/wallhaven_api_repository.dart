import 'package:dartz/dartz.dart';
import 'package:great_wall/data/remote/wallhaven_api.dart';
import 'package:great_wall/domain/base/base_failture.dart';
import 'package:great_wall/domain/entity/wallpaper.dart';
import 'package:great_wall/domain/repository/wallhaven_repository.dart';

import '../../domain/base/base_exception.dart';

class WallhavenApiRepository implements WallhavenRepository {
  WallhavenApiRepository(this.wallhavenApi);

  final WallhavenApi wallhavenApi;

  @override
  Future<Either<List<Wallpaper>, Failure>> search() async {
    try {
      final response = await wallhavenApi.search();
      return Left(response.data);
    } on BaseException catch (e) {
      return Right(BaseFailure(message: e.message, code: e.code!));
    }
  }
}
