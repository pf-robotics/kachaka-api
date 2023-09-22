import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kachaka_api_flutter_sample/repositories/kachaka/generated/kachaka-api.pb.dart';

part 'shelf_store.freezed.dart';

final shelfStoreProvider = StateNotifierProvider<ShelfStore, ShelfStoreState>(
  (ref) => ShelfStore(),
);

const _initialState = ShelfStoreState(shelves: null);

@freezed
class ShelfStoreState with _$ShelfStoreState {
  const factory ShelfStoreState({
    required List<Shelf>? shelves,
  }) = _ShelfStoreState;
}

class ShelfStore extends StateNotifier<ShelfStoreState> {
  ShelfStore() : super(_initialState);

  void setShelves(List<Shelf> shelves) {
    state = state.copyWith(shelves: shelves);
  }

  void initializeState() {
    state = _initialState;
  }
}
