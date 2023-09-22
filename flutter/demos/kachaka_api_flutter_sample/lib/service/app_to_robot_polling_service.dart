import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kachaka_api_flutter_sample/repositories/kachaka/kachaka_repository.dart';

final appToRobotPollingService =
    Provider((ref) => AppToRobotPollingService(ref));

class AppToRobotPollingService {
  AppToRobotPollingService(this._ref);
  final Ref _ref;

  Future<void> polling<T>(
    Future<T> Function() getFunc,
    void Function(T result) onSucceeded,
    String pollingChannelId, {
    Duration sleepWhenFailed = const Duration(seconds: 5),
  }) async {
    if (!_isActiveChannel(pollingChannelId)) {
      return;
    }

    try {
      final res = await getFunc.call();
      onSucceeded(res);
    } catch (e) {
      debugPrint("Exception Occurred when polling $getFunc, error: $e");
      await Future.delayed(sleepWhenFailed);
    }

    polling(
      getFunc,
      onSucceeded,
      pollingChannelId,
      sleepWhenFailed: sleepWhenFailed,
    );
  }

  bool _isActiveChannel(String pollingChannelId) {
    final currentChannelId = _ref.read(kachakaRepositoryProvider).channelId;
    if (currentChannelId == null || currentChannelId != pollingChannelId) {
      return false;
    }
    return true;
  }
}
