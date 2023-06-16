import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:great_wall/common/api/api_client.dart';
import 'package:great_wall/domain/base/pagination_meta.dart';
import 'package:great_wall/domain/entity/thumbs.dart';
import 'package:great_wall/domain/entity/wallpaper.dart';
import 'package:great_wall/presentation/home_page.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

void main() {
  late final DioAdapter dioAdapter;
  setUp(() {
    dioAdapter = DioAdapter(dio: ApiClient().dio);
  });
  testGoldens('home page on multiple devices', (tester) async {
    final List<Wallpaper> mockItems = List.generate(
      30,
      (index) => Wallpaper(
        id: 'id$index',
        views: index,
        favorites: index,
        category: 'category$index',
        resolution: '100x200',
        ratio: '16.9',
        fileSize: index,
        colors: [],
        path: 'path',
        thumbs:
            const Thumbs(small: 'small', original: 'original', large: 'large'),
      ),
    );
    dioAdapter.onGet('v1/search', (server) {
      server.reply(200, {
        'data': mockItems,
        'meta': const PaginationMeta(
            currentPage: 1, lastPage: 3, perPage: 10, total: 30),
      });
    });
    final builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: [
        Device.phone,
        Device.iphone11,
        Device.tabletPortrait,
        Device.tabletLandscape,
      ])
      ..addScenario(
        widget: const HomePage(),
        name: 'normal page',
      );

    await tester.pumpDeviceBuilder(builder);

    await screenMatchesGolden(tester, 'home_page_multiple_devices');
  });
}
