// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'robot_store.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RobotStoreState {
  Pose? get pose => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RobotStoreStateCopyWith<RobotStoreState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RobotStoreStateCopyWith<$Res> {
  factory $RobotStoreStateCopyWith(
          RobotStoreState value, $Res Function(RobotStoreState) then) =
      _$RobotStoreStateCopyWithImpl<$Res, RobotStoreState>;
  @useResult
  $Res call({Pose? pose});
}

/// @nodoc
class _$RobotStoreStateCopyWithImpl<$Res, $Val extends RobotStoreState>
    implements $RobotStoreStateCopyWith<$Res> {
  _$RobotStoreStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pose = freezed,
  }) {
    return _then(_value.copyWith(
      pose: freezed == pose
          ? _value.pose
          : pose // ignore: cast_nullable_to_non_nullable
              as Pose?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RobotStoreStateCopyWith<$Res>
    implements $RobotStoreStateCopyWith<$Res> {
  factory _$$_RobotStoreStateCopyWith(
          _$_RobotStoreState value, $Res Function(_$_RobotStoreState) then) =
      __$$_RobotStoreStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Pose? pose});
}

/// @nodoc
class __$$_RobotStoreStateCopyWithImpl<$Res>
    extends _$RobotStoreStateCopyWithImpl<$Res, _$_RobotStoreState>
    implements _$$_RobotStoreStateCopyWith<$Res> {
  __$$_RobotStoreStateCopyWithImpl(
      _$_RobotStoreState _value, $Res Function(_$_RobotStoreState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pose = freezed,
  }) {
    return _then(_$_RobotStoreState(
      pose: freezed == pose
          ? _value.pose
          : pose // ignore: cast_nullable_to_non_nullable
              as Pose?,
    ));
  }
}

/// @nodoc

class _$_RobotStoreState implements _RobotStoreState {
  const _$_RobotStoreState({required this.pose});

  @override
  final Pose? pose;

  @override
  String toString() {
    return 'RobotStoreState(pose: $pose)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RobotStoreState &&
            (identical(other.pose, pose) || other.pose == pose));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pose);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RobotStoreStateCopyWith<_$_RobotStoreState> get copyWith =>
      __$$_RobotStoreStateCopyWithImpl<_$_RobotStoreState>(this, _$identity);
}

abstract class _RobotStoreState implements RobotStoreState {
  const factory _RobotStoreState({required final Pose? pose}) =
      _$_RobotStoreState;

  @override
  Pose? get pose;
  @override
  @JsonKey(ignore: true)
  _$$_RobotStoreStateCopyWith<_$_RobotStoreState> get copyWith =>
      throw _privateConstructorUsedError;
}
