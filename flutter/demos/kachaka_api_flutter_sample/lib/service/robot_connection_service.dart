import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kachaka_api_flutter_sample/repositories/kachaka/kachaka_repository.dart';
import 'package:kachaka_api_flutter_sample/service/app_to_robot_polling_service.dart';
import 'package:kachaka_api_flutter_sample/stores/location/location_store.dart';
import 'package:kachaka_api_flutter_sample/stores/map/map_store.dart';
import 'package:kachaka_api_flutter_sample/stores/robot/robot_store.dart';
import 'package:kachaka_api_flutter_sample/stores/shelf/shelf_store.dart';

final robotConnectionServiceProvider =
    Provider((ref) => RobotConnectionService(ref));

class RobotConnectionService {
  RobotConnectionService(this._ref);

  final Ref _ref;

  Future<void> connect(String ipAddress) async {
    await dispose();

    _ref.read(kachakaRepositoryProvider).initializeChannel(ipAddress);

    startPolling();
  }

  Future<void> dispose() async {
    await _ref.read(kachakaRepositoryProvider).terminate();
    _ref.invalidate(kachakaRepositoryProvider);
  }

  Future<void> startPolling() async {
    final pollingChannelId = _ref.read(kachakaRepositoryProvider).channelId!;
    _ref.read(appToRobotPollingService).polling(
          _ref.read(kachakaRepositoryProvider).getLocations,
          (res) => _ref
              .read(locationStoreProvider.notifier)
              .setLocations(res.locations),
          pollingChannelId,
        );
    _ref.read(appToRobotPollingService).polling(
          _ref.read(kachakaRepositoryProvider).getShelves,
          (res) =>
              _ref.read(shelfStoreProvider.notifier).setShelves(res.shelves),
          pollingChannelId,
        );
    _ref.read(appToRobotPollingService).polling(
          _ref.read(kachakaRepositoryProvider).getPngMap,
          (res) => _ref.read(mapStoreProvider.notifier).setMap(res.map),
          pollingChannelId,
        );
    _ref.read(appToRobotPollingService).polling(
          _ref.read(kachakaRepositoryProvider).getRobotPose,
          (res) =>
              _ref.read(robotStoreProvider.notifier).setRobotPose(res.pose),
          pollingChannelId,
        );
  }
}
