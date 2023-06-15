import 'package:dartz/dartz.dart';
import 'package:great_wall/domain/entity/wallpaper.dart';

import '../base/base_failture.dart';

abstract class WallhavenRepository {
  Future<Either<List<Wallpaper>, Failure>> search();
}
