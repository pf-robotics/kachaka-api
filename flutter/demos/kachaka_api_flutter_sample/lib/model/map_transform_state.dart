class MapTransformState {
  final double scale;

  MapTransformState._({required this.scale});

  factory MapTransformState.init() {
    return MapTransformState._(scale: 1.0);
  }

  MapTransformState copyWith({double? scale}) {
    return MapTransformState._(scale: scale ?? this.scale);
  }
}
