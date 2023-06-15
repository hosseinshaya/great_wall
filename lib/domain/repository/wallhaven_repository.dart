import 'package:dartz/dartz.dart';
import 'package:great_wall/domain/entity/wallpaper.dart';

import '../base/base_failture.dart';
import '../base/pagination.dart';

abstract class WallhavenRepository {
  Future<Either<Pagination<Wallpaper>, Failure>> search({required int page});
}
