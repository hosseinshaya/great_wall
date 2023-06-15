// ignore: depend_on_referenced_packages
import 'package:dio/dio.dart';
import 'package:great_wall/common/api/api_client.dart';
import 'package:great_wall/domain/base/pagination.dart';
import 'package:great_wall/domain/entity/wallpaper.dart';
import 'package:retrofit/retrofit.dart';

import '../../common/constants/app_config.dart';

part 'wallhaven_api.g.dart';

@RestApi(baseUrl: AppConfig.baseUrl)
abstract class WallhavenApi {
  factory WallhavenApi() => _WallhavenApi(ApiClient().dio);

  @POST('/v1/search')
  Future<HttpResponse<Pagination<Wallpaper>>> search(
      {@Query('page') required int page});
}
