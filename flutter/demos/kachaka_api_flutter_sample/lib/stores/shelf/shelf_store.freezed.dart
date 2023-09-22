// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shelf_store.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ShelfStoreState {
  List<Shelf>? get shelves => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ShelfStoreStateCopyWith<ShelfStoreState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShelfStoreStateCopyWith<$Res> {
  factory $ShelfStoreStateCopyWith(
          ShelfStoreState value, $Res Function(ShelfStoreState) then) =
      _$ShelfStoreStateCopyWithImpl<$Res, ShelfStoreState>;
  @useResult
  $Res call({List<Shelf>? shelves});
}

/// @nodoc
class _$ShelfStoreStateCopyWithImpl<$Res, $Val extends ShelfStoreState>
    implements $ShelfStoreStateCopyWith<$Res> {
  _$ShelfStoreStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shelves = freezed,
  }) {
    return _then(_value.copyWith(
      shelves: freezed == shelves
          ? _value.shelves
          : shelves // ignore: cast_nullable_to_non_nullable
              as List<Shelf>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ShelfStoreStateCopyWith<$Res>
    implements $ShelfStoreStateCopyWith<$Res> {
  factory _$$_ShelfStoreStateCopyWith(
          _$_ShelfStoreState value, $Res Function(_$_ShelfStoreState) then) =
      __$$_ShelfStoreStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Shelf>? shelves});
}

/// @nodoc
class __$$_ShelfStoreStateCopyWithImpl<$Res>
    extends _$ShelfStoreStateCopyWithImpl<$Res, _$_ShelfStoreState>
    implements _$$_ShelfStoreStateCopyWith<$Res> {
  __$$_ShelfStoreStateCopyWithImpl(
      _$_ShelfStoreState _value, $Res Function(_$_ShelfStoreState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shelves = freezed,
  }) {
    return _then(_$_ShelfStoreState(
      shelves: freezed == shelves
          ? _value._shelves
          : shelves // ignore: cast_nullable_to_non_nullable
              as List<Shelf>?,
    ));
  }
}

/// @nodoc

class _$_ShelfStoreState implements _ShelfStoreState {
  const _$_ShelfStoreState({required final List<Shelf>? shelves})
      : _shelves = shelves;

  final List<Shelf>? _shelves;
  @override
  List<Shelf>? get shelves {
    final value = _shelves;
    if (value == null) return null;
    if (_shelves is EqualUnmodifiableListView) return _shelves;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ShelfStoreState(shelves: $shelves)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ShelfStoreState &&
            const DeepCollectionEquality().equals(other._shelves, _shelves));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_shelves));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ShelfStoreStateCopyWith<_$_ShelfStoreState> get copyWith =>
      __$$_ShelfStoreStateCopyWithImpl<_$_ShelfStoreState>(this, _$identity);
}

abstract class _ShelfStoreState implements ShelfStoreState {
  const factory _ShelfStoreState({required final List<Shelf>? shelves}) =
      _$_ShelfStoreState;

  @override
  List<Shelf>? get shelves;
  @override
  @JsonKey(ignore: true)
  _$$_ShelfStoreStateCopyWith<_$_ShelfStoreState> get copyWith =>
      throw _privateConstructorUsedError;
}
