// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'map_store.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MapStoreState {
  Map_? get mapInfo => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MapStoreStateCopyWith<MapStoreState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MapStoreStateCopyWith<$Res> {
  factory $MapStoreStateCopyWith(
          MapStoreState value, $Res Function(MapStoreState) then) =
      _$MapStoreStateCopyWithImpl<$Res, MapStoreState>;
  @useResult
  $Res call({Map_? mapInfo});
}

/// @nodoc
class _$MapStoreStateCopyWithImpl<$Res, $Val extends MapStoreState>
    implements $MapStoreStateCopyWith<$Res> {
  _$MapStoreStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mapInfo = freezed,
  }) {
    return _then(_value.copyWith(
      mapInfo: freezed == mapInfo
          ? _value.mapInfo
          : mapInfo // ignore: cast_nullable_to_non_nullable
              as Map_?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MapStoreStateCopyWith<$Res>
    implements $MapStoreStateCopyWith<$Res> {
  factory _$$_MapStoreStateCopyWith(
          _$_MapStoreState value, $Res Function(_$_MapStoreState) then) =
      __$$_MapStoreStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map_? mapInfo});
}

/// @nodoc
class __$$_MapStoreStateCopyWithImpl<$Res>
    extends _$MapStoreStateCopyWithImpl<$Res, _$_MapStoreState>
    implements _$$_MapStoreStateCopyWith<$Res> {
  __$$_MapStoreStateCopyWithImpl(
      _$_MapStoreState _value, $Res Function(_$_MapStoreState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mapInfo = freezed,
  }) {
    return _then(_$_MapStoreState(
      mapInfo: freezed == mapInfo
          ? _value.mapInfo
          : mapInfo // ignore: cast_nullable_to_non_nullable
              as Map_?,
    ));
  }
}

/// @nodoc

class _$_MapStoreState implements _MapStoreState {
  const _$_MapStoreState({required this.mapInfo});

  @override
  final Map_? mapInfo;

  @override
  String toString() {
    return 'MapStoreState(mapInfo: $mapInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MapStoreState &&
            (identical(other.mapInfo, mapInfo) || other.mapInfo == mapInfo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, mapInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MapStoreStateCopyWith<_$_MapStoreState> get copyWith =>
      __$$_MapStoreStateCopyWithImpl<_$_MapStoreState>(this, _$identity);
}

abstract class _MapStoreState implements MapStoreState {
  const factory _MapStoreState({required final Map_? mapInfo}) =
      _$_MapStoreState;

  @override
  Map_? get mapInfo;
  @override
  @JsonKey(ignore: true)
  _$$_MapStoreStateCopyWith<_$_MapStoreState> get copyWith =>
      throw _privateConstructorUsedError;
}
