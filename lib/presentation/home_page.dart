import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:great_wall/common/localization/locale_keys.g.dart';
import 'package:great_wall/data/repository/wallhaven_api_repository.dart';
import 'package:great_wall/domain/usecase/wallhaven_usecase.dart';
import 'package:great_wall/presentation/common/image_component.dart';
import 'package:great_wall/presentation/common/loading_widget.dart';
import 'package:great_wall/presentation/common/push_down_clickable.dart';
import 'package:great_wall/presentation/logic/home_bloc.dart';
import 'package:great_wall/utils/log/log_helper.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../common/router/app_router.dart';

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
      builder: (context, child) => Consumer<HomeBloc>(
          builder: (context, bloc, chils) => Scaffold(
                appBar: AppBar(
                  title: Text(LocaleKeys.name.tr()),
                ),
                body: bloc.loading
                    ? const Center(
                        child: LoadingWidget(),
                      )
                    : SmartRefresher(
                        controller: _refreshController,
                        enablePullUp: context.select<HomeBloc, bool>(
                            (bloc) => bloc.canLoadMore()),
                        onLoading: () async {
                          try {
                            final response =
                                await context.read<HomeBloc>().load();
                            response?.fold(
                                (l) => _refreshController.loadComplete(),
                                (r) => _refreshController.loadFailed());
                          } catch (e) {
                            e.errLog();
                            _refreshController.loadFailed();
                          }
                        },
                        onRefresh: () async {
                          try {
                            final response = await context
                                .read<HomeBloc>()
                                .load(refresh: true);
                            response?.fold(
                                (l) => _refreshController.refreshCompleted(),
                                (r) => _refreshController.refreshFailed());
                          } catch (e) {
                            e.errLog();
                            _refreshController.refreshFailed();
                          }
                        },
                        child: MasonryGridView.count(
                          padding: const EdgeInsets.all(24),
                          crossAxisCount: 2,
                          mainAxisSpacing: 24,
                          crossAxisSpacing: 24,
                          itemCount: bloc.items.length,
                          itemBuilder: (context, index) => PushDownClickable(
                            onTap: () {
                              context.push(
                                  R.wallpaperDetail(id: bloc.items[index].id),
                                  extra: bloc.items[index]);
                            },
                            child: Hero(
                              tag: bloc.items[index].id,
                              child: LayoutBuilder(
                                  builder: (context, constraints) => ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                          constraints.maxWidth / 8),
                                      child: AspectRatio(
                                        aspectRatio: double.parse(
                                            bloc.items[index].ratio),
                                        child: ImageComponent(
                                            bloc.items[index].thumbs.original),
                                      ))),
                            ),
                          ),
                        ),
                      ),
              )));
}
