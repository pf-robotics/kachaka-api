import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kachaka_api_flutter_sample/repositories/kachaka/generated/kachaka-api.pb.dart';

part 'location_store.freezed.dart';

final locationStoreProvider =
    StateNotifierProvider<LocationStore, LocationStoreState>(
  (ref) => LocationStore(),
);

const _initialState = LocationStoreState(locations: null);

@freezed
class LocationStoreState with _$LocationStoreState {
  const factory LocationStoreState({
    required List<Location>? locations,
  }) = _LocationStoreState;
}

class LocationStore extends StateNotifier<LocationStoreState> {
  LocationStore() : super(_initialState);

  void setLocations(List<Location> locations) {
    state = state.copyWith(locations: locations);
  }

  void initializeState() {
    state = _initialState;
  }
}
