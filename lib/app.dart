import 'package:bot_toast/bot_toast.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:great_wall/common/styles/appTheme/app_theme_helper.dart';
import 'package:great_wall/utils/app_scroll_behavior.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'common/constants/app_config.dart';
import 'common/localization/locale_keys.g.dart';
import 'common/router/app_router.dart';
import 'common/styles/appTheme/app_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          Provider<AppRouter>(
            lazy: false,
            create: (BuildContext createContext) => AppRouter(),
          ),
        ],
        child: EasyLocalization(
          supportedLocales: AppConfig.supportedLocales,
          path: AppConfig.localePath,
          startLocale: AppConfig.startLocale,
          fallbackLocale: AppConfig.startLocale,
          useOnlyLangCode: true,
          child: RefreshConfiguration(
            headerBuilder: () => const MaterialClassicHeader(),
            footerBuilder: () => CustomFooter(
              builder: (BuildContext context, LoadStatus? mode) {
                if (mode == LoadStatus.loading) {
                  return SizedBox(
                    height: 65,
                    child: Center(
                      child: SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                              color: context.colorScheme.primary)),
                    ),
                  );
                } else if (mode == LoadStatus.failed) {
                  return SizedBox(
                    height: 55,
                    child: Center(
                      child: Text(
                        LocaleKeys.err_tryAgain.tr(),
                        style:
                            Theme.of(context).textTheme.labelMedium,
                      ),
                    ),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
            child: Builder(
              builder: (BuildContext context) => MaterialApp.router(
                title: LocaleKeys.name.tr(),
                theme: AppTheme.light,
                darkTheme: AppTheme.dark,
                scrollBehavior: const AppScrollBehavior(),
                localizationsDelegates: context.localizationDelegates,
                supportedLocales: context.supportedLocales,
                locale: context.locale,
                builder: appWidget,
                routeInformationProvider:
                    context.read<AppRouter>().router.routeInformationProvider,
                routeInformationParser:
                    context.read<AppRouter>().router.routeInformationParser,
                routerDelegate: context.read<AppRouter>().router.routerDelegate,
                debugShowCheckedModeBanner: false,
              ),
            ),
          ),
        ),
      );

  Widget appWidget(BuildContext context, Widget? child) => BotToastInit()(
      context,
      child ?? const SizedBox.shrink());
}
