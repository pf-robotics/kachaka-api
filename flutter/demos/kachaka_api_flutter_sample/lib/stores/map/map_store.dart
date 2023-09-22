import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kachaka_api_flutter_sample/repositories/kachaka/generated/kachaka-api.pb.dart';

part 'map_store.freezed.dart';

final mapStoreProvider = StateNotifierProvider<MapStore, MapStoreState>(
  (ref) => MapStore(),
);

const _initialState = MapStoreState(mapInfo: null);

@freezed
class MapStoreState with _$MapStoreState {
  const factory MapStoreState({
    required Map_? mapInfo,
  }) = _MapStoreState;
}

class MapStore extends StateNotifier<MapStoreState> {
  MapStore() : super(_initialState);

  void setMap(Map_ map) {
    state = state.copyWith(mapInfo: map);
  }

  void initializeState() {
    state = _initialState;
  }
}
