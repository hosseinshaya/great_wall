import 'package:dartz/dartz.dart';
import 'package:great_wall/domain/base/base_failture.dart';
import 'package:great_wall/domain/entity/wallpaper.dart';
import 'package:great_wall/domain/repository/wallhaven_repository.dart';

class WallhavenUsecase implements WallhavenRepository {
  WallhavenUsecase({required this.wallhavenRepository});
  final WallhavenRepository wallhavenRepository;

  @override
  Future<Either<List<Wallpaper>, Failure>> search() async =>
      wallhavenRepository.search();
}
