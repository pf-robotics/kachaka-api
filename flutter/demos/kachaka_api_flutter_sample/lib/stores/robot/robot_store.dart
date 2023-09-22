import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kachaka_api_flutter_sample/repositories/kachaka/generated/kachaka-api.pb.dart';

part 'robot_store.freezed.dart';

final robotStoreProvider = StateNotifierProvider<RobotStore, RobotStoreState>(
  (ref) => RobotStore(),
);

const _initialState = RobotStoreState(pose: null);

@freezed
class RobotStoreState with _$RobotStoreState {
  const factory RobotStoreState({
    required Pose? pose,
  }) = _RobotStoreState;
}

class RobotStore extends StateNotifier<RobotStoreState> {
  RobotStore() : super(_initialState);

  void setRobotPose(Pose robotPose) {
    state = state.copyWith(pose: robotPose);
  }

  void initializeState() {
    state = _initialState;
  }
}
