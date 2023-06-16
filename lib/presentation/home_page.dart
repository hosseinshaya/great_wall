import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:great_wall/common/localization/locale_keys.g.dart';
import 'package:great_wall/data/repository/wallhaven_api_repository.dart';
import 'package:great_wall/domain/entity/wallpaper.dart';
import 'package:great_wall/domain/usecase/wallhaven_usecase.dart';
import 'package:great_wall/presentation/common/image_component.dart';
import 'package:great_wall/presentation/common/loading_widget.dart';
import 'package:great_wall/presentation/logic/home_bloc.dart';
import 'package:great_wall/utils/log/log_helper.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final RefreshController _refreshController = RefreshController();

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => HomeBloc(
            wallhavenUsecase: WallhavenUsecase(
              wallhavenRepository: WallhavenApiRepository(),
            ),
          )..load(refresh: true),
      builder: (context, child) => Scaffold(
            appBar: AppBar(
              title: Text(LocaleKeys.name.tr()),
            ),
            body: SmartRefresher(
              controller: _refreshController,
              enablePullUp:
                  context.select<HomeBloc, bool>((bloc) => bloc.canLoadMore()),
              onLoading: () async {
                try {
                  final response = await context.read<HomeBloc>().load();
                  response?.fold((l) => _refreshController.loadComplete(),
                      (r) => _refreshController.loadFailed());
                } catch (e) {
                  e.errLog();
                  _refreshController.loadFailed();
                }
              },
              onRefresh: () async {
                try {
                  final response =
                      await context.read<HomeBloc>().load(refresh: true);
                  response?.fold((l) => _refreshController.refreshCompleted(),
                      (r) => _refreshController.refreshFailed());
                } catch (e) {
                  e.errLog();
                  _refreshController.refreshFailed();
                }
              },
              child: Consumer<HomeBloc>(
                builder: (context, bloc, child) => bloc.loading
                    ? const Padding(
                        padding: EdgeInsets.all(50),
                        child: Center(child: LoadingWidget()),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(24),
                        child: StaggeredGrid.count(
                          crossAxisCount: 2,
                          mainAxisSpacing: 24,
                          crossAxisSpacing: 24,
                          children: context
                              .select<HomeBloc, List<Wallpaper>>(
                                  (bloc) => bloc.items)
                              .map(
                                (item) => ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: LayoutBuilder(
                                        builder: (context, constraints) =>
                                            AspectRatio(
                                              aspectRatio:
                                                  double.parse(item.ratio),
                                              child: ImageComponent(
                                                  item.thumbs.original),
                                            ))),
                              )
                              .toList(),
                        ),
                      ),
              ),
            ),
          ));
}
