///
//  Generated code. Do not modify.
//  source: kachaka-api.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'kachaka-api.pbenum.dart';

export 'kachaka-api.pbenum.dart';

class Metadata extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Metadata', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'kachaka_api'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'cursor', $pb.PbFieldType.OSF6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  Metadata._() : super();
  factory Metadata({
    $fixnum.Int64? cursor,
  }) {
    final _result = create();
    if (cursor != null) {
      _result.cursor = cursor;
    }
    return _result;
  }
  factory Metadata.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Metadata.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Metadata clone() => Metadata()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Metadata copyWith(void Function(Metadata) updates) => super.copyWith((message) => updates(message as Metadata)) as Metadata; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Metadata create() => Metadata._();
  Metadata createEmptyInstance() => create();
  static $pb.PbList<Metadata> createRepeated() => $pb.PbList<Metadata>();
  @$core.pragma('dart2js:noInline')
  static Metadata getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Metadata>(create);
  static Metadata? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get cursor => $_getI64(0);
  @$pb.TagNumber(1)
  set cursor($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCursor() => $_has(0);
  @$pb.TagNumber(1)
  void clearCursor() => clearField(1);
}

class Result extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Result', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'kachaka_api'), createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'success')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'errorCode', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  Result._() : super();
  factory Result({
    $core.bool? success,
    $core.int? errorCode,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (errorCode != null) {
      _result.errorCode = errorCode;
    }
    return _result;
  }
  factory Result.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Result.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Result clone() => Result()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Result copyWith(void Function(Result) updates) => super.copyWith((message) => updates(message as Result)) as Result; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Result create() => Result._();
  Result createEmptyInstance() => create();
  static $pb.PbList<Result> createRepeated() => $pb.PbList<Result>();
  @$core.pragma('dart2js:noInline')
  static Result getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Result>(create);
  static Result? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);

  @$pb.TagNumber(3)
  $core.int get errorCode => $_getIZ(1);
  @$pb.TagNumber(3)
  set errorCode($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(3)
  $core.bool hasErrorCode() => $_has(1);
  @$pb.TagNumber(3)
  void clearErrorCode() => clearField(3);
}

class Error extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Error', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'kachaka_api'), createEmptyInstance: create)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'errorCode', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  Error._() : super();
  factory Error({
    $core.int? errorCode,
  }) {
    final _result = create();
    if (errorCode != null) {
      _result.errorCode = errorCode;
    }
    return _result;
  }
  factory Error.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Error.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Error clone() => Error()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Error copyWith(void Function(Error) updates) => super.copyWith((message) => updates(message as Error)) as Error; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Error create() => Error._();
  Error createEmptyInstance() => create();
  static $pb.PbList<Error> createRepeated() => $pb.PbList<Error>();
  @$core.pragma('dart2js:noInline')
  static Error getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Error>(create);
  static Error? _defaultInstance;

  @$pb.TagNumber(2)
  $core.int get errorCode => $_getIZ(0);
  @$pb.TagNumber(2)
  set errorCode($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(2)
  $core.bool hasErrorCode() => $_has(0);
  @$pb.TagNumber(2)
  void clearErrorCode() => clearField(2);
}

class RosHeader extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RosHeader', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'kachaka_api'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'stampNsec')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'frameId')
    ..hasRequiredFields = false
  ;

  RosHeader._() : super();
  factory RosHeader({
    $fixnum.Int64? stampNsec,
    $core.String? frameId,
  }) {
    final _result = create();
    if (stampNsec != null) {
      _result.stampNsec = stampNsec;
    }
    if (frameId != null) {
      _result.frameId = frameId;
    }
    return _result;
  }
  factory RosHeader.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RosHeader.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RosHeader clone() => RosHeader()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RosHeader copyWith(void Function(RosHeader) updates) => super.copyWith((message) => updates(message as RosHeader)) as RosHeader; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RosHeader create() => RosHeader._();
  RosHeader createEmptyInstance() => create();
  static $pb.PbList<RosHeader> createRepeated() => $pb.PbList<RosHeader>();
  @$core.pragma('dart2js:noInline')
  static RosHeader getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RosHeader>(create);
  static RosHeader? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get stampNsec => $_getI64(0);
  @$pb.TagNumber(1)
  set stampNsec($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStampNsec() => $_has(0);
  @$pb.TagNumber(1)
  void clearStampNsec() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get frameId => $_getSZ(1);
  @$pb.TagNumber(2)
  set frameId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFrameId() => $_has(1);
  @$pb.TagNumber(2)
  void clearFrameId() => clearField(2);
}

class Pose extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Pose', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'kachaka_api'), createEmptyInstance: create)
    ..a<$core.double>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'x', $pb.PbFieldType.OD)
    ..a<$core.double>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'y', $pb.PbFieldType.OD)
    ..a<$core.double>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'theta', $pb.PbFieldType.OD)
    ..hasRequiredFields = false
  ;

  Pose._() : super();
  factory Pose({
    $core.double? x,
    $core.double? y,
    $core.double? theta,
  }) {
    final _result = create();
    if (x != null) {
      _result.x = x;
    }
    if (y != null) {
      _result.y = y;
    }
    if (theta != null) {
      _result.theta = theta;
    }
    return _result;
  }
  factory Pose.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Pose.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Pose clone() => Pose()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Pose copyWith(void Function(Pose) updates) => super.copyWith((message) => updates(message as Pose)) as Pose; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Pose create() => Pose._();
  Pose createEmptyInstance() => create();
  static $pb.PbList<Pose> createRepeated() => $pb.PbList<Pose>();
  @$core.pragma('dart2js:noInline')
  static Pose getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Pose>(create);
  static Pose? _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get x => $_getN(0);
  @$pb.TagNumber(1)
  set x($core.double v) { $_setDouble(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasX() => $_has(0);
  @$pb.TagNumber(1)
  void clearX() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get y => $_getN(1);
  @$pb.TagNumber(2)
  set y($core.double v) { $_setDouble(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasY() => $_has(1);
  @$pb.TagNumber(2)
  void clearY() => clearField(2);

  @$pb.TagNumber(3)
  $core.double get theta => $_getN(2);
  @$pb.TagNumber(3)
  set theta($core.double v) { $_setDouble(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTheta() => $_has(2);
  @$pb.TagNumber(3)
  void clearTheta() => clearField(3);
}

class Vector3 extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Vector3', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'kachaka_api'), createEmptyInstance: create)
    ..a<$core.double>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'x', $pb.PbFieldType.OD)
    ..a<$core.double>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'y', $pb.PbFieldType.OD)
    ..a<$core.double>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'z', $pb.PbFieldType.OD)
    ..hasRequiredFields = false
  ;

  Vector3._() : super();
  factory Vector3({
    $core.double? x,
    $core.double? y,
    $core.double? z,
  }) {
    final _result = create();
    if (x != null) {
      _result.x = x;
    }
    if (y != null) {
      _result.y = y;
    }
    if (z != null) {
      _result.z = z;
    }
    return _result;
  }
  factory Vector3.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Vector3.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Vector3 clone() => Vector3()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Vector3 copyWith(void Function(Vector3) updates) => super.copyWith((message) => updates(message as Vector3)) as Vector3; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Vector3 create() => Vector3._();
  Vector3 createEmptyInstance() => create();
  static $pb.PbList<Vector3> createRepeated() => $pb.PbList<Vector3>();
  @$core.pragma('dart2js:noInline')
  static Vector3 getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Vector3>(create);
  static Vector3? _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get x => $_getN(0);
  @$pb.TagNumber(1)
  set x($core.double v) { $_setDouble(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasX() => $_has(0);
  @$pb.TagNumber(1)
  void clearX() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get y => $_getN(1);
  @$pb.TagNumber(2)
  set y($core.double v) { $_setDouble(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasY() => $_has(1);
  @$pb.TagNumber(2)
  void clearY() => clearField(2);

  @$pb.TagNumber(3)
  $core.double get z => $_getN(2);
  @$pb.TagNumber(3)
  set z($core.double v) { $_setDouble(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasZ() => $_has(2);
  @$pb.TagNumber(3)
  void clearZ() => clearField(3);
}

class Quaternion extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Quaternion', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'kachaka_api'), createEmptyInstance: create)
    ..a<$core.double>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'x', $pb.PbFieldType.OD)
    ..a<$core.double>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'y', $pb.PbFieldType.OD)
    ..a<$core.double>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'z', $pb.PbFieldType.OD)
    ..a<$core.double>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'w', $pb.PbFieldType.OD)
    ..hasRequiredFields = false
  ;

  Quaternion._() : super();
  factory Quaternion({
    $core.double? x,
    $core.double? y,
    $core.double? z,
    $core.double? w,
  }) {
    final _result = create();
    if (x != null) {
      _result.x = x;
    }
    if (y != null) {
      _result.y = y;
    }
    if (z != null) {
      _result.z = z;
    }
    if (w != null) {
      _result.w = w;
    }
    return _result;
  }
  factory Quaternion.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Quaternion.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Quaternion clone() => Quaternion()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Quaternion copyWith(void Function(Quaternion) updates) => super.copyWith((message) => updates(message as Quaternion)) as Quaternion; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Quaternion create() => Quaternion._();
  Quaternion createEmptyInstance() => create();
  static $pb.PbList<Quaternion> createRepeated() => $pb.PbList<Quaternion>();
  @$core.pragma('dart2js:noInline')
  static Quaternion getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Quaternion>(create);
  static Quaternion? _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get x => $_getN(0);
  @$pb.TagNumber(1)
  set x($core.double v) { $_setDouble(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasX() => $_has(0);
  @$pb.TagNumber(1)
  void clearX() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get y => $_getN(1);
  @$pb.TagNumber(2)
  set y($core.double v) { $_setDouble(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasY() => $_has(1);
  @$pb.TagNumber(2)
  void clearY() => clearField(2);

  @$pb.TagNumber(3)
  $core.double get z => $_getN(2);
  @$pb.TagNumber(3)
  set z($core.double v) { $_setDouble(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasZ() => $_has(2);
  @$pb.TagNumber(3)
  void clearZ() => clearField(3);

  @$pb.TagNumber(4)
  $core.double get w => $_getN(3);
  @$pb.TagNumber(4)
  set w($core.double v) { $_setDouble(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasW() => $_has(3);
  @$pb.TagNumber(4)
  void clearW() => clearField(4);
}

class Pose3d extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Pose3d', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'kachaka_api'), createEmptyInstance: create)
    ..aOM<Vector3>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'position', subBuilder: Vector3.create)
    ..aOM<Quaternion>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'orientation', subBuilder: Quaternion.create)
    ..hasRequiredFields = false
  ;

  Pose3d._() : super();
  factory Pose3d({
    Vector3? position,
    Quaternion? orientation,
  }) {
    final _result = create();
    if (position != null) {
      _result.position = position;
    }
    if (orientation != null) {
      _result.orientation = orientation;
    }
    return _result;
  }
  factory Pose3d.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Pose3d.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Pose3d clone() => Pose3d()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Pose3d copyWith(void Function(Pose3d) updates) => super.copyWith((message) => updates(message as Pose3d)) as Pose3d; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Pose3d create() => Pose3d._();
  Pose3d createEmptyInstance() => create();
  static $pb.PbList<Pose3d> createRepeated() => $pb.PbList<Pose3d>();
  @$core.pragma('dart2js:noInline')
  static Pose3d getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Pose3d>(create);
  static Pose3d? _defaultInstance;

  @$pb.TagNumber(1)
  Vector3 get position => $_getN(0);
  @$pb.TagNumber(1)
  set position(Vector3 v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasPosition() => $_has(0);
  @$pb.TagNumber(1)
  void clearPosition() => clearField(1);
  @$pb.TagNumber(1)
  Vector3 ensurePosition() => $_ensure(0);

  @$pb.TagNumber(2)
  Quaternion get orientation => $_getN(1);
  @$pb.TagNumber(2)
  set orientation(Quaternion v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasOrientation() => $_has(1);
  @$pb.TagNumber(2)
  void clearOrientation() => clearField(2);
  @$pb.TagNumber(2)
  Quaternion ensureOrientation() => $_ensure(1);
}

class Twist extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Twist', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'kachaka_api'), createEmptyInstance: create)
    ..aOM<Vector3>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'linear', subBuilder: Vector3.create)
    ..aOM<Vector3>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'angular', subBuilder: Vector3.create)
    ..hasRequiredFields = false
  ;

  Twist._() : super();
  factory Twist({
    Vector3? linear,
    Vector3? angular,
  }) {
    final _result = create();
    if (linear != null) {
      _result.linear = linear;
    }
    if (angular != null) {
      _result.angular = angular;
    }
    return _result;
  }
  factory Twist.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Twist.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Twist clone() => Twist()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Twist copyWith(void Function(Twist) updates) => super.copyWith((message) => updates(message as Twist)) as Twist; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Twist create() => Twist._();
  Twist createEmptyInstance() => create();
  static $pb.PbList<Twist> createRepeated() => $pb.PbList<Twist>();
  @$core.pragma('dart2js:noInline')
  static Twist getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Twist>(create);
  static Twist? _defaultInstance;

  @$pb.TagNumber(1)
  Vector3 get linear => $_getN(0);
  @$pb.TagNumber(1)
  set linear(Vector3 v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasLinear() => $_has(0);
  @$pb.TagNumber(1)
  void clearLinear() => clearField(1);
  @$pb.TagNumber(1)
  Vector3 ensureLinear() => $_ensure(0);

  @$pb.TagNumber(2)
  Vector3 get angular => $_getN(1);
  @$pb.TagNumber(2)
  set angular(Vector3 v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasAngular() => $_has(1);
  @$pb.TagNumber(2)
  void clearAngular() => clearField(2);
  @$pb.TagNumber(2)
  Vector3 ensureAngular() => $_ensure(1);
}

class Pose3dWithCovariance extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Pose3dWithCovariance', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'kachaka_api'), createEmptyInstance: create)
    ..aOM<Pose3d>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pose', subBuilder: Pose3d.create)
    ..p<$core.double>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'covariance', $pb.PbFieldType.KD)
    ..hasRequiredFields = false
  ;

  Pose3dWithCovariance._() : super();
  factory Pose3dWithCovariance({
    Pose3d? pose,
    $core.Iterable<$core.double>? covariance,
  }) {
    final _result = create();
    if (pose != null) {
      _result.pose = pose;
    }
    if (covariance != null) {
      _result.covariance.addAll(covariance);
    }
    return _result;
  }
  factory Pose3dWithCovariance.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Pose3dWithCovariance.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Pose3dWithCovariance clone() => Pose3dWithCovariance()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Pose3dWithCovariance copyWith(void Function(Pose3dWithCovariance) updates) => super.copyWith((message) => updates(message as Pose3dWithCovariance)) as Pose3dWithCovariance; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Pose3dWithCovariance create() => Pose3dWithCovariance._();
  Pose3dWithCovariance createEmptyInstance() => create();
  static $pb.PbList<Pose3dWithCovariance> createRepeated() => $pb.PbList<Pose3dWithCovariance>();
  @$core.pragma('dart2js:noInline')
  static Pose3dWithCovariance getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Pose3dWithCovariance>(create);
  static Pose3dWithCovariance? _defaultInstance;

  @$pb.TagNumber(1)
  Pose3d get pose => $_getN(0);
  @$pb.TagNumber(1)
  set pose(Pose3d v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasPose() => $_has(0);
  @$pb.TagNumber(1)
  void clearPose() => clearField(1);
  @$pb.TagNumber(1)
  Pose3d ensurePose() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<$core.double> get covariance => $_getList(1);
}

class TwistWithCovariance extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TwistWithCovariance', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'kachaka_api'), createEmptyInstance: create)
    ..aOM<Twist>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'twist', subBuilder: Twist.create)
    ..p<$core.double>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'covariance', $pb.PbFieldType.KD)
    ..hasRequiredFields = false
  ;

  TwistWithCovariance._() : super();
  factory TwistWithCovariance({
    Twist? twist,
    $core.Iterable<$core.double>? covariance,
  }) {
    final _result = create();
    if (twist != null) {
      _result.twist = twist;
    }
    if (covariance != null) {
      _result.covariance.addAll(covariance);
    }
    return _result;
  }
  factory TwistWithCovariance.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TwistWithCovariance.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TwistWithCovariance clone() => TwistWithCovariance()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TwistWithCovariance copyWith(void Function(TwistWithCovariance) updates) => super.copyWith((message) => updates(message as TwistWithCovariance)) as TwistWithCovariance; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TwistWithCovariance create() => TwistWithCovariance._();
  TwistWithCovariance createEmptyInstance() => create();
  static $pb.PbList<TwistWithCovariance> createRepeated() => $pb.PbList<TwistWithCovariance>();
  @$core.pragma('dart2js:noInline')
  static TwistWithCovariance getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TwistWithCovariance>(create);
  static TwistWithCovariance? _defaultInstance;

  @$pb.TagNumber(1)
  Twist get twist => $_getN(0);
  @$pb.TagNumber(1)
  set twist(Twist v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasTwist() => $_has(0);
  @$pb.TagNumber(1)
  void clearTwist() => clearField(1);
  @$pb.TagNumber(1)
  Twist ensureTwist() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<$core.double> get covariance => $_getList(1);
}

class Map_ extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Map', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'kachaka_api'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'data', $pb.PbFieldType.OY)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..a<$core.double>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'resolution', $pb.PbFieldType.OD)
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'width', $pb.PbFieldType.O3)
    ..a<$core.int>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'height', $pb.PbFieldType.O3)
    ..aOM<Pose>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'origin', subBuilder: Pose.create)
    ..hasRequiredFields = false
  ;

  Map_._() : super();
  factory Map_({
    $core.List<$core.int>? data,
    $core.String? name,
    $core.double? resolution,
    $core.int? width,
    $core.int? height,
    Pose? origin,
  }) {
    final _result = create();
    if (data != null) {
      _result.data = data;
    }
    if (name != null) {
      _result.name = name;
    }
    if (resolution != null) {
      _result.resolution = resolution;
    }
    if (width != null) {
      _result.width = width;
    }
    if (height != null) {
      _result.height = height;
    }
    if (origin != null) {
      _result.origin = origin;
    }
    return _result;
  }
  factory Map_.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Map_.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Map_ clone() => Map_()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Map_ copyWith(void Function(Map_) updates) => super.copyWith((message) => updates(message as Map_)) as Map_; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Map_ create() => Map_._();
  Map_ createEmptyInstance() => create();
  static $pb.PbList<Map_> createRepeated() => $pb.PbList<Map_>();
  @$core.pragma('dart2js:noInline')
  static Map_ getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Map_>(create);
  static Map_? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get data => $_getN(0);
  @$pb.TagNumber(1)
  set data($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasData() => $_has(0);
  @$pb.TagNumber(1)
  void clearData() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.double get resolution => $_getN(2);
  @$pb.TagNumber(3)
  set resolution($core.double v) { $_setDouble(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasResolution() => $_has(2);
  @$pb.TagNumber(3)
  void clearResolution() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get width => $_getIZ(3);
  @$pb.TagNumber(4)
  set width($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasWidth() => $_has(3);
  @$pb.TagNumber(4)
  void clearWidth() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get height => $_getIZ(4);
  @$pb.TagNumber(5)
  set height($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasHeight() => $_has(4);
  @$pb.TagNumber(5)
  void clearHeight() => clearField(5);

  @$pb.TagNumber(6)
  Pose get origin => $_getN(5);
  @$pb.TagNumber(6)
  set origin(Pose v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasOrigin() => $_has(5);
  @$pb.TagNumber(6)
  void clearOrigin() => clearField(6);
  @$pb.TagNumber(6)
  Pose ensureOrigin() => $_ensure(5);
}

class Location extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Location', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'kachaka_api'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOM<Pose>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pose', subBuilder: Pose.create)
    ..e<LocationType>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: LocationType.LOCATION_TYPE_UNSPECIFIED, valueOf: LocationType.valueOf, enumValues: LocationType.values)
    ..aOB(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'undockShelfAligningToWall')
    ..aOB(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'undockShelfAvoidingObstacles')
    ..aOB(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ignoreVoiceRecognition')
    ..hasRequiredFields = false
  ;

  Location._() : super();
  factory Location({
    $core.String? id,
    $core.String? name,
    Pose? pose,
    LocationType? type,
    $core.bool? undockShelfAligningToWall,
    $core.bool? undockShelfAvoidingObstacles,
    $core.bool? ignoreVoiceRecognition,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (name != null) {
      _result.name = name;
    }
    if (pose != null) {
      _result.pose = pose;
    }
    if (type != null) {
      _result.type = type;
    }
    if (undockShelfAligningToWall != null) {
      _result.undockShelfAligningToWall = undockShelfAligningToWall;
    }
    if (undockShelfAvoidingObstacles != null) {
      _result.undockShelfAvoidingObstacles = undockShelfAvoidingObstacles;
    }
    if (ignoreVoiceRecognition != null) {
      _result.ignoreVoiceRecognition = ignoreVoiceRecognition;
    }
    return _result;
  }
  factory Location.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Location.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Location clone() => Location()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Location copyWith(void Function(Location) updates) => super.copyWith((message) => updates(message as Location)) as Location; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Location create() => Location._();
  Location createEmptyInstance() => create();
  static $pb.PbList<Location> createRepeated() => $pb.PbList<Location>();
  @$core.pragma('dart2js:noInline')
  static Location getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Location>(create);
  static Location? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  Pose get pose => $_getN(2);
  @$pb.TagNumber(3)
  set pose(Pose v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasPose() => $_has(2);
  @$pb.TagNumber(3)
  void clearPose() => clearField(3);
  @$pb.TagNumber(3)
  Pose ensurePose() => $_ensure(2);

  @$pb.TagNumber(4)
  LocationType get type => $_getN(3);
  @$pb.TagNumber(4)
  set type(LocationType v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasType() => $_has(3);
  @$pb.TagNumber(4)
  void clearType() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get undockShelfAligningToWall => $_getBF(4);
  @$pb.TagNumber(5)
  set undockShelfAligningToWall($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasUndockShelfAligningToWall() => $_has(4);
  @$pb.TagNumber(5)
  void clearUndockShelfAligningToWall() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get undockShelfAvoidingObstacles => $_getBF(5);
  @$pb.TagNumber(6)
  set undockShelfAvoidingObstacles($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasUndockShelfAvoidingObstacles() => $_has(5);
  @$pb.TagNumber(6)
  void clearUndockShelfAvoidingObstacles() => clearField(6);

  @$pb.TagNumber(7)
  $core.bool get ignoreVoiceRecognition => $_getBF(6);
  @$pb.TagNumber(7)
  set ignoreVoiceRecognition($core.bool v) { $_setBool(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasIgnoreVoiceRecognition() => $_has(6);
  @$pb.TagNumber(7)
  void clearIgnoreVoiceRecognition() => clearField(7);
}

class ShelfSize extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ShelfSize', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'kachaka_api'), createEmptyInstance: create)
    ..a<$core.double>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'width', $pb.PbFieldType.OD)
    ..a<$core.double>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'depth', $pb.PbFieldType.OD)
    ..a<$core.double>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'height', $pb.PbFieldType.OD)
    ..hasRequiredFields = false
  ;

  ShelfSize._() : super();
  factory ShelfSize({
    $core.double? width,
    $core.double? depth,
    $core.double? height,
  }) {
    final _result = create();
    if (width != null) {
      _result.width = width;
    }
    if (depth != null) {
      _result.depth = depth;
    }
    if (height != null) {
      _result.height = height;
    }
    return _result;
  }
  factory ShelfSize.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ShelfSize.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ShelfSize clone() => ShelfSize()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ShelfSize copyWith(void Function(ShelfSize) updates) => super.copyWith((message) => updates(message as ShelfSize)) as ShelfSize; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ShelfSize create() => ShelfSize._();
  ShelfSize createEmptyInstance() => create();
  static $pb.PbList<ShelfSize> createRepeated() => $pb.PbList<ShelfSize>();
  @$core.pragma('dart2js:noInline')
  static ShelfSize getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ShelfSize>(create);
  static ShelfSize? _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get width => $_getN(0);
  @$pb.TagNumber(1)
  set width($core.double v) { $_setDouble(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasWidth() => $_has(0);
  @$pb.TagNumber(1)
  void clearWidth() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get depth => $_getN(1);
  @$pb.TagNumber(2)
  set depth($core.double v) { $_setDouble(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDepth() => $_has(1);
  @$pb.TagNumber(2)
  void clearDepth() => clearField(2);

  @$pb.TagNumber(3)
  $core.double get height => $_getN(2);
  @$pb.TagNumber(3)
  set height($core.double v) { $_setDouble(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasHeight() => $_has(2);
  @$pb.TagNumber(3)
  void clearHeight() => clearField(3);
}

class RecognizableName extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RecognizableName', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'kachaka_api'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOB(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deletable')
    ..hasRequiredFields = false
  ;

  RecognizableName._() : super();
  factory RecognizableName({
    $core.String? name,
    $core.bool? deletable,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (deletable != null) {
      _result.deletable = deletable;
    }
    return _result;
  }
  factory RecognizableName.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RecognizableName.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RecognizableName clone() => RecognizableName()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RecognizableName copyWith(void Function(RecognizableName) updates) => super.copyWith((message) => updates(message as RecognizableName)) as RecognizableName; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RecognizableName create() => RecognizableName._();
  RecognizableName createEmptyInstance() => create();
  static $pb.PbList<RecognizableName> createRepeated() => $pb.PbList<RecognizableName>();
  @$core.pragma('dart2js:noInline')
  static RecognizableName getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RecognizableName>(create);
  static RecognizableName? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get deletable => $_getBF(1);
  @$pb.TagNumber(2)
  set deletable($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDeletable() => $_has(1);
  @$pb.TagNumber(2)
  void clearDeletable() => clearField(2);
}

class Shelf extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Shelf', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'kachaka_api'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOM<Pose>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pose', subBuilder: Pose.create)
    ..aOM<ShelfSize>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'size', subBuilder: ShelfSize.create)
    ..e<ShelfAppearance>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'appearance', $pb.PbFieldType.OE, defaultOrMaker: ShelfAppearance.SHELF_APPEARANCE_UNSPECIFIED, valueOf: ShelfAppearance.valueOf, enumValues: ShelfAppearance.values)
    ..pc<RecognizableName>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'recognizableNames', $pb.PbFieldType.PM, subBuilder: RecognizableName.create)
    ..aOS(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'homeLocationId')
    ..e<ShelfSpeedMode>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'speedMode', $pb.PbFieldType.OE, defaultOrMaker: ShelfSpeedMode.SHELF_SPEED_MODE_UNSPECIFIED, valueOf: ShelfSpeedMode.valueOf, enumValues: ShelfSpeedMode.values)
    ..aOB(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ignoreVoiceRecognition')
    ..hasRequiredFields = false
  ;

  Shelf._() : super();
  factory Shelf({
    $core.String? id,
    $core.String? name,
    Pose? pose,
    ShelfSize? size,
    ShelfAppearance? appearance,
    $core.Iterable<RecognizableName>? recognizableNames,
    $core.String? homeLocationId,
    ShelfSpeedMode? speedMode,
    $core.bool? ignoreVoiceRecognition,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (name != null) {
      _result.name = name;
    }
    if (pose != null) {
      _result.pose = pose;
    }
    if (size != null) {
      _result.size = size;
    }
    if (appearance != null) {
      _result.appearance = appearance;
    }
    if (recognizableNames != null) {
      _result.recognizableNames.addAll(recognizableNames);
    }
    if (homeLocationId != null) {
      _result.homeLocationId = homeLocationId;
    }
    if (speedMode != null) {
      _result.speedMode = speedMode;
    }
    if (ignoreVoiceRecognition != null) {
      _result.ignoreVoiceRecognition = ignoreVoiceRecognition;
    }
    return _result;
  }
  factory Shelf.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Shelf.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Shelf clone() => Shelf()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Shelf copyWith(void Function(Shelf) updates) => super.copyWith((message) => updates(message as Shelf)) as Shelf; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Shelf create() => Shelf._();
  Shelf createEmptyInstance() => create();
  static $pb.PbList<Shelf> createRepeated() => $pb.PbList<Shelf>();
  @$core.pragma('dart2js:noInline')
  static Shelf getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Shelf>(create);
  static Shelf? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  Pose get pose => $_getN(2);
  @$pb.TagNumber(3)
  set pose(Pose v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasPose() => $_has(2);
  @$pb.TagNumber(3)
  void clearPose() => clearField(3);
  @$pb.TagNumber(3)
  Pose ensurePose() => $_ensure(2);

  @$pb.TagNumber(4)
  ShelfSize get size => $_getN(3);
  @$pb.TagNumber(4)
  set size(ShelfSize v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasSize() => $_has(3);
  @$pb.TagNumber(4)
  void clearSize() => clearField(4);
  @$pb.TagNumber(4)
  ShelfSize ensureSize() => $_ensure(3);

  @$pb.TagNumber(5)
  ShelfAppearance get appearance => $_getN(4);
  @$pb.TagNumber(5)
  set appearance(ShelfAppearance v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasAppearance() => $_has(4);
  @$pb.TagNumber(5)
  void clearAppearance() => clearField(5);

  @$pb.TagNumber(7)
  $core.List<RecognizableName> get recognizableNames => $_getList(5);

  @$pb.TagNumber(8)
  $core.String get homeLocationId => $_getSZ(6);
  @$pb.TagNumber(8)
  set homeLocationId($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(8)
  $core.bool hasHomeLocationId() => $_has(6);
  @$pb.TagNumber(8)
  void clearHomeLocationId() => clearField(8);

  @$pb.TagNumber(9)
  ShelfSpeedMode get speedMode => $_getN(7);
  @$pb.TagNumber(9)
  set speedMode(ShelfSpeedMode v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasSpeedMode() => $_has(7);
  @$pb.TagNumber(9)
  void clearSpeedMode() => clearField(9);

  @$pb.TagNumber(10)
  $core.bool get ignoreVoiceRecognition => $_getBF(8);
  @$pb.TagNumber(10)
  set ignoreVoiceRecognition($core.bool v) { $_setBool(8, v); }
  @$pb.TagNumber(10)
  $core.bool hasIgnoreVoiceRecognition() => $_has(8);
  @$pb.TagNumber(10)
  void clearIgnoreVoiceRecognition() => clearField(10);
}

class RosImu extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RosImu', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'kachaka_api'), createEmptyInstance: create)
    ..aOM<RosHeader>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'header', subBuilder: RosHeader.create)
    ..aOM<Quaternion>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'orientation', subBuilder: Quaternion.create)
    ..p<$core.double>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'orientationCovariance', $pb.PbFieldType.KD)
    ..aOM<Vector3>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'angularVelocity', subBuilder: Vector3.create)
    ..p<$core.double>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'angularVelocityCovariance', $pb.PbFieldType.KD)
    ..aOM<Vector3>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'linearAcceleration', subBuilder: Vector3.create)
    ..p<$core.double>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'linearAccelerationCovariance', $pb.PbFieldType.KD)
    ..hasRequiredFields = false
  ;

  RosImu._() : super();
  factory RosImu({
    RosHeader? header,
    Quaternion? orientation,
    $core.Iterable<$core.double>? orientationCovariance,
    Vector3? angularVelocity,
    $core.Iterable<$core.double>? angularVelocityCovariance,
    Vector3? linearAcceleration,
    $core.Iterable<$core.double>? linearAccelerationCovariance,
  }) {
    final _result = create();
    if (header != null) {
      _result.header = header;
    }
    if (orientation != null) {
      _result.orientation = orientation;
    }
    if (orientationCovariance != null) {
      _result.orientationCovariance.addAll(orientationCovariance);
    }
    if (angularVelocity != null) {
      _result.angularVelocity = angularVelocity;
    }
    if (angularVelocityCovariance != null) {
      _result.angularVelocityCovariance.addAll(angularVelocityCovariance);
    }
    if (linearAcceleration != null) {
      _result.linearAcceleration = linearAcceleration;
    }
    if (linearAccelerationCovariance != null) {
      _result.linearAccelerationCovariance.addAll(linearAccelerationCovariance);
    }
    return _result;
  }
  factory RosImu.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RosImu.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RosImu clone() => RosImu()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RosImu copyWith(void Function(RosImu) updates) => super.copyWith((message) => updates(message as RosImu)) as RosImu; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RosImu create() => RosImu._();
  RosImu createEmptyInstance() => create();
  static $pb.PbList<RosImu> createRepeated() => $pb.PbList<RosImu>();
  @$core.pragma('dart2js:noInline')
  static RosImu getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RosImu>(create);
  static RosImu? _defaultInstance;

  @$pb.TagNumber(1)
  RosHeader get header => $_getN(0);
  @$pb.TagNumber(1)
  set header(RosHeader v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasHeader() => $_has(0);
  @$pb.TagNumber(1)
  void clearHeader() => clearField(1);
  @$pb.TagNumber(1)
  RosHeader ensureHeader() => $_ensure(0);

  @$pb.TagNumber(2)
  Quaternion get orientation => $_getN(1);
  @$pb.TagNumber(2)
  set orientation(Quaternion v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasOrientation() => $_has(1);
  @$pb.TagNumber(2)
  void clearOrientation() => clearField(2);
  @$pb.TagNumber(2)
  Quaternion ensureOrientation() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.List<$core.double> get orientationCovariance => $_getList(2);

  @$pb.TagNumber(4)
  Vector3 get angularVelocity => $_getN(3);
  @$pb.TagNumber(4)
  set angularVelocity(Vector3 v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasAngularVelocity() => $_has(3);
  @$pb.TagNumber(4)
  void clearAngularVelocity() => clearField(4);
  @$pb.TagNumber(4)
  Vector3 ensureAngularVelocity() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.List<$core.double> get angularVelocityCovariance => $_getList(4);

  @$pb.TagNumber(6)
  Vector3 get linearAcceleration => $_getN(5);
  @$pb.TagNumber(6)
  set linearAcceleration(Vector3 v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasLinearAcceleration() => $_has(5);
  @$pb.TagNumber(6)
  void clearLinearAcceleration() => clearField(6);
  @$pb.TagNumber(6)
  Vector3 ensureLinearAcceleration() => $_ensure(5);

  @$pb.TagNumber(7)
  $core.List<$core.double> get linearAccelerationCovariance => $_getList(6);
}

class RosOdometry extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RosOdometry', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'kachaka_api'), createEmptyInstance: create)
    ..aOM<RosHeader>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'header', subBuilder: RosHeader.create)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'childFrameId')
    ..aOM<Pose3dWithCovariance>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pose', subBuilder: Pose3dWithCovariance.create)
    ..aOM<TwistWithCovariance>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'twist', subBuilder: TwistWithCovariance.create)
    ..hasRequiredFields = false
  ;

  RosOdometry._() : super();
  factory RosOdometry({
    RosHeader? header,
    $core.String? childFrameId,
    Pose3dWithCovariance? pose,
    TwistWithCovariance? twist,
  }) {
    final _result = create();
    if (header != null) {
      _result.header = header;
    }
    if (childFrameId != null) {
      _result.childFrameId = childFrameId;
    }
    if (pose != null) {
      _result.pose = pose;
    }
    if (twist != null) {
      _result.twist = twist;
    }
    return _result;
  }
  factory RosOdometry.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RosOdometry.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RosOdometry clone() => RosOdometry()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RosOdometry copyWith(void Function(RosOdometry) updates) => super.copyWith((message) => updates(message as RosOdometry)) as RosOdometry; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RosOdometry create() => RosOdometry._();
  RosOdometry createEmptyInstance() => create();
  static $pb.PbList<RosOdometry> createRepeated() => $pb.PbList<RosOdometry>();
  @$core.pragma('dart2js:noInline')
  static RosOdometry getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RosOdometry>(create);
  static RosOdometry? _defaultInstance;

  @$pb.TagNumber(1)
  RosHeader get header => $_getN(0);
  @$pb.TagNumber(1)
  set header(RosHeader v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasHeader() => $_has(0);
  @$pb.TagNumber(1)
  void clearHeader() => clearField(1);
  @$pb.TagNumber(1)
  RosHeader ensureHeader() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get childFrameId => $_getSZ(1);
  @$pb.TagNumber(2)
  set childFrameId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasChildFrameId() => $_has(1);
  @$pb.TagNumber(2)
  void clearChildFrameId() => clearField(2);

  @$pb.TagNumber(3)
  Pose3dWithCovariance get pose => $_getN(2);
  @$pb.TagNumber(3)
  set pose(Pose3dWithCovariance v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasPose() => $_has(2);
  @$pb.TagNumber(3)
  void clearPose() => clearField(3);
  @$pb.TagNumber(3)
  Pose3dWithCovariance ensurePose() => $_ensure(2);

  @$pb.TagNumber(4)
  TwistWithCovariance get twist => $_getN(3);
  @$pb.TagNumber(4)
  set twist(TwistWithCovariance v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasTwist() => $_has(3);
  @$pb.TagNumber(4)
  void clearTwist() => clearField(4);
  @$pb.TagNumber(4)
  TwistWithCovariance ensureTwist() => $_ensure(3);
}

class RosLaserScan extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RosLaserScan', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'kachaka_api'), createEmptyInstance: create)
    ..aOM<RosHeader>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'header', subBuilder: RosHeader.create)
    ..a<$core.double>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'angleMin', $pb.PbFieldType.OD)
    ..a<$core.double>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'angleMax', $pb.PbFieldType.OD)
    ..a<$core.double>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'angleIncrement', $pb.PbFieldType.OD)
    ..a<$core.double>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'timeIncrement', $pb.PbFieldType.OD)
    ..a<$core.double>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'scanTime', $pb.PbFieldType.OD)
    ..a<$core.double>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'rangeMin', $pb.PbFieldType.OD)
    ..a<$core.double>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'rangeMax', $pb.PbFieldType.OD)
    ..p<$core.double>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ranges', $pb.PbFieldType.KD)
    ..p<$core.double>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'intensities', $pb.PbFieldType.KD)
    ..hasRequiredFields = false
  ;

  RosLaserScan._() : super();
  factory RosLaserScan({
    RosHeader? header,
    $core.double? angleMin,
    $core.double? angleMax,
    $core.double? angleIncrement,
    $core.double? timeIncrement,
    $core.double? scanTime,
    $core.double? rangeMin,
    $core.double? rangeMax,
    $core.Iterable<$core.double>? ranges,
    $core.Iterable<$core.double>? intensities,
  }) {
    final _result = create();
    if (header != null) {
      _result.header = header;
    }
    if (angleMin != null) {
      _result.angleMin = angleMin;
    }
    if (angleMax != null) {
      _result.angleMax = angleMax;
    }
    if (angleIncrement != null) {
      _result.angleIncrement = angleIncrement;
    }
    if (timeIncrement != null) {
      _result.timeIncrement = timeIncrement;
    }
    if (scanTime != null) {
      _result.scanTime = scanTime;
    }
    if (rangeMin != null) {
      _result.rangeMin = rangeMin;
    }
    if (rangeMax != null) {
      _result.rangeMax = rangeMax;
    }
    if (ranges != null) {
      _result.ranges.addAll(ranges);
    }
    if (intensities != null) {
      _result.intensities.addAll(intensities);
    }
    return _result;
  }
  factory RosLaserScan.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RosLaserScan.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RosLaserScan clone() => RosLaserScan()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RosLaserScan copyWith(void Function(RosLaserScan) updates) => super.copyWith((message) => updates(message as RosLaserScan)) as RosLaserScan; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RosLaserScan create() => RosLaserScan._();
  RosLaserScan createEmptyInstance() => create();
  static $pb.PbList<RosLaserScan> createRepeated() => $pb.PbList<RosLaserScan>();
  @$core.pragma('dart2js:noInline')
  static RosLaserScan getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RosLaserScan>(create);
  static RosLaserScan? _defaultInstance;

  @$pb.TagNumber(1)
  RosHeader get header => $_getN(0);
  @$pb.TagNumber(1)
  set header(RosHeader v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasHeader() => $_has(0);
  @$pb.TagNumber(1)
  void clearHeader() => clearField(1);
  @$pb.TagNumber(1)
  RosHeader ensureHeader() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.double get angleMin => $_getN(1);
  @$pb.TagNumber(2)
  set angleMin($core.double v) { $_setDouble(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAngleMin() => $_has(1);
  @$pb.TagNumber(2)
  void clearAngleMin() => clearField(2);

  @$pb.TagNumber(3)
  $core.double get angleMax => $_getN(2);
  @$pb.TagNumber(3)
  set angleMax($core.double v) { $_setDouble(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAngleMax() => $_has(2);
  @$pb.TagNumber(3)
  void clearAngleMax() => clearField(3);

  @$pb.TagNumber(4)
  $core.double get angleIncrement => $_getN(3);
  @$pb.TagNumber(4)
  set angleIncrement($core.double v) { $_setDouble(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasAngleIncrement() => $_has(3);
  @$pb.TagNumber(4)
  void clearAngleIncrement() => clearField(4);

  @$pb.TagNumber(5)
  $core.double get timeIncrement => $_getN(4);
  @$pb.TagNumber(5)
  set timeIncrement($core.double v) { $_setDouble(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasTimeIncrement() => $_has(4);
  @$pb.TagNumber(5)
  void clearTimeIncrement() => clearField(5);

  @$pb.TagNumber(6)
  $core.double get scanTime => $_getN(5);
  @$pb.TagNumber(6)
  set scanTime($core.double v) { $_setDouble(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasScanTime() => $_has(5);
  @$pb.TagNumber(6)
  void clearScanTime() => clearField(6);

  @$pb.TagNumber(7)
  $core.double get rangeMin => $_getN(6);
  @$pb.TagNumber(7)
  set rangeMin($core.double v) { $_setDouble(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasRangeMin() => $_has(6);
  @$pb.TagNumber(7)
  void clearRangeMin() => clearField(7);

  @$pb.TagNumber(8)
  $core.double get rangeMax => $_getN(7);
  @$pb.TagNumber(8)
  set rangeMax($core.double v) { $_setDouble(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasRangeMax() => $_has(7);
  @$pb.TagNumber(8)
  void clearRangeMax() => clearField(8);

  @$pb.TagNumber(9)
  $core.List<$core.double> get ranges => $_getList(8);

  @$pb.TagNumber(10)
  $core.List<$core.double> get intensities => $_getList(9);
}

class RegionOfInterest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RegionOfInterest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'kachaka_api'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'xOffset', $pb.PbFieldType.OU3)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'yOffset', $pb.PbFieldType.OU3)
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'height', $pb.PbFieldType.OU3)
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'width', $pb.PbFieldType.OU3)
    ..aOB(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'doRectify')
    ..hasRequiredFields = false
  ;

  RegionOfInterest._() : super();
  factory RegionOfInterest({
    $core.int? xOffset,
    $core.int? yOffset,
    $core.int? height,
    $core.int? width,
    $core.bool? doRectify,
  }) {
    final _result = create();
    if (xOffset != null) {
      _result.xOffset = xOffset;
    }
    if (yOffset != null) {
      _result.yOffset = yOffset;
    }
    if (height != null) {
      _result.height = height;
    }
    if (width != null) {
      _result.width = width;
    }
    if (doRectify != null) {
      _result.doRectify = doRectify;
    }
    return _result;
  }
  factory RegionOfInterest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RegionOfInterest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RegionOfInterest clone() => RegionOfInterest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RegionOfInterest copyWith(void Function(RegionOfInterest) updates) => super.copyWith((message) => updates(message as RegionOfInterest)) as RegionOfInterest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RegionOfInterest create() => RegionOfInterest._();
  RegionOfInterest createEmptyInstance() => create();
  static $pb.PbList<RegionOfInterest> createRepeated() => $pb.PbList<RegionOfInterest>();
  @$core.pragma('dart2js:noInline')
  static RegionOfInterest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RegionOfInterest>(create);
  static RegionOfInterest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get xOffset => $_getIZ(0);
  @$pb.TagNumber(1)
  set xOffset($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasXOffset() => $_has(0);
  @$pb.TagNumber(1)
  void clearXOffset() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get yOffset => $_getIZ(1);
  @$pb.TagNumber(2)
  set yOffset($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasYOffset() => $_has(1);
  @$pb.TagNumber(2)
  void clearYOffset() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get height => $_getIZ(2);
  @$pb.TagNumber(3)
  set height($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasHeight() => $_has(2);
  @$pb.TagNumber(3)
  void clearHeight() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get width => $_getIZ(3);
  @$pb.TagNumber(4)
  set width($core.int v) { $_setUnsignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasWidth() => $_has(3);
  @$pb.TagNumber(4)
  void clearWidth() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get doRectify => $_getBF(4);
  @$pb.TagNumber(5)
  set doRectify($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasDoRectify() => $_has(4);
  @$pb.TagNumber(5)
  void clearDoRectify() => clearField(5);
}

class RosCameraInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RosCameraInfo', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'kachaka_api'), createEmptyInstance: create)
    ..aOM<RosHeader>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'header', subBuilder: RosHeader.create)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'height', $pb.PbFieldType.OU3)
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'width', $pb.PbFieldType.OU3)
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'distortionModel')
    ..p<$core.double>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'D', $pb.PbFieldType.KD, protoName: 'D')
    ..p<$core.double>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'K', $pb.PbFieldType.KD, protoName: 'K')
    ..p<$core.double>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'R', $pb.PbFieldType.KD, protoName: 'R')
    ..p<$core.double>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'P', $pb.PbFieldType.KD, protoName: 'P')
    ..a<$core.int>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'binningX', $pb.PbFieldType.OU3)
    ..a<$core.int>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'binningY', $pb.PbFieldType.OU3)
    ..aOM<RegionOfInterest>(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roi', subBuilder: RegionOfInterest.create)
    ..hasRequiredFields = false
  ;

  RosCameraInfo._() : super();
  factory RosCameraInfo({
    RosHeader? header,
    $core.int? height,
    $core.int? width,
    $core.String? distortionModel,
    $core.Iterable<$core.double>? d,
    $core.Iterable<$core.double>? k,
    $core.Iterable<$core.double>? r,
    $core.Iterable<$core.double>? p,
    $core.int? binningX,
    $core.int? binningY,
    RegionOfInterest? roi,
  }) {
    final _result = create();
    if (header != null) {
      _result.header = header;
    }
    if (height != null) {
      _result.height = height;
    }
    if (width != null) {
      _result.width = width;
    }
    if (distortionModel != null) {
      _result.distortionModel = distortionModel;
    }
    if (d != null) {
      _result.d.addAll(d);
    }
    if (k != null) {
      _result.k.addAll(k);
    }
    if (r != null) {
      _result.r.addAll(r);
    }
    if (p != null) {
      _result.p.addAll(p);
    }
    if (binningX != null) {
      _result.binningX = binningX;
    }
    if (binningY != null) {
      _result.binningY = binningY;
    }
    if (roi != null) {
      _result.roi = roi;
    }
    return _result;
  }
  factory RosCameraInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RosCameraInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RosCameraInfo clone() => RosCameraInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RosCameraInfo copyWith(void Function(RosCameraInfo) updates) => super.copyWith((message) => updates(message as RosCameraInfo)) as RosCameraInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RosCameraInfo create() => RosCameraInfo._();
  RosCameraInfo createEmptyInstance() => create();
  static $pb.PbList<RosCameraInfo> createRepeated() => $pb.PbList<RosCameraInfo>();
  @$core.pragma('dart2js:noInline')
  static RosCameraInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RosCameraInfo>(create);
  static RosCameraInfo? _defaultInstance;

  @$pb.TagNumber(1)
  RosHeader get header => $_getN(0);
  @$pb.TagNumber(1)
  set header(RosHeader v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasHeader() => $_has(0);
  @$pb.TagNumber(1)
  void clearHeader() => clearField(1);
  @$pb.TagNumber(1)
  RosHeader ensureHeader() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.int get height => $_getIZ(1);
  @$pb.TagNumber(2)
  set height($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasHeight() => $_has(1);
  @$pb.TagNumber(2)
  void clearHeight() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get width => $_getIZ(2);
  @$pb.TagNumber(3)
  set width($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasWidth() => $_has(2);
  @$pb.TagNumber(3)
  void clearWidth() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get distortionModel => $_getSZ(3);
  @$pb.TagNumber(4)
  set distortionModel($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasDistortionModel() => $_has(3);
  @$pb.TagNumber(4)
  void clearDistortionModel() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<$core.double> get d => $_getList(4);

  @$pb.TagNumber(6)
  $core.List<$core.double> get k => $_getList(5);

  @$pb.TagNumber(7)
  $core.List<$core.double> get r => $_getList(6);

  @$pb.TagNumber(8)
  $core.List<$core.double> get p => $_getList(7);

  @$pb.TagNumber(9)
  $core.int get binningX => $_getIZ(8);
  @$pb.TagNumber(9)
  set binningX($core.int v) { $_setUnsignedInt32(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasBinningX() => $_has(8);
  @$pb.TagNumber(9)
  void clearBinningX() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get binningY => $_getIZ(9);
  @$pb.TagNumber(10)
  set binningY($core.int v) { $_setUnsignedInt32(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasBinningY() => $_has(9);
  @$pb.TagNumber(10)
  void clearBinningY() => clearField(10);

  @$pb.TagNumber(11)
  RegionOfInterest get roi => $_getN(10);
  @$pb.TagNumber(11)
  set roi(RegionOfInterest v) { setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasRoi() => $_has(10);
  @$pb.TagNumber(11)
  void clearRoi() => clearField(11);
  @$pb.TagNumber(11)
  RegionOfInterest ensureRoi() => $_ensure(10);
}

class RosImage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RosImage', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'kachaka_api'), createEmptyInstance: create)
    ..aOM<RosHeader>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'header', subBuilder: RosHeader.create)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'height', $pb.PbFieldType.OU3)
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'width', $pb.PbFieldType.OU3)
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'encoding')
    ..aOB(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'isBigendian')
    ..a<$core.int>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'step', $pb.PbFieldType.OU3)
    ..a<$core.List<$core.int>>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'data', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  RosImage._() : super();
  factory RosImage({
    RosHeader? header,
    $core.int? height,
    $core.int? width,
    $core.String? encoding,
    $core.bool? isBigendian,
    $core.int? step,
    $core.List<$core.int>? data,
  }) {
    final _result = create();
    if (header != null) {
      _result.header = header;
    }
    if (height != null) {
      _result.height = height;
    }
    if (width != null) {
      _result.width = width;
    }
    if (encoding != null) {
      _result.encoding = encoding;
    }
    if (isBigendian != null) {
      _result.isBigendian = isBigendian;
    }
    if (step != null) {
      _result.step = step;
    }
    if (data != null) {
      _result.data = data;
    }
    return _result;
  }
  factory RosImage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RosImage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RosImage clone() => RosImage()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RosImage copyWith(void Function(RosImage) updates) => super.copyWith((message) => updates(message as RosImage)) as RosImage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RosImage create() => RosImage._();
  RosImage createEmptyInstance() => create();
  static $pb.PbList<RosImage> createRepeated() => $pb.PbList<RosImage>();
  @$core.pragma('dart2js:noInline')
  static RosImage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RosImage>(create);
  static RosImage? _defaultInstance;

  @$pb.TagNumber(1)
  RosHeader get header => $_getN(0);
  @$pb.TagNumber(1)
  set header(RosHeader v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasHeader() => $_has(0);
  @$pb.TagNumber(1)
  void clearHeader() => clearField(1);
  @$pb.TagNumber(1)
  RosHeader ensureHeader() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.int get height => $_getIZ(1);
  @$pb.TagNumber(2)
  set height($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasHeight() => $_has(1);
  @$pb.TagNumber(2)
  void clearHeight() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get width => $_getIZ(2);
  @$pb.TagNumber(3)
  set width($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasWidth() => $_has(2);
  @$pb.TagNumber(3)
  void clearWidth() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get encoding => $_getSZ(3);
  @$pb.TagNumber(4)
  set encoding($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasEncoding() => $_has(3);
  @$pb.TagNumber(4)
  void clearEncoding() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get isBigendian => $_getBF(4);
  @$pb.TagNumber(5)
  set isBigendian($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasIsBigendian() => $_has(4);
  @$pb.TagNumber(5)
  void clearIsBigendian() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get step => $_getIZ(5);
  @$pb.TagNumber(6)
  set step($core.int v) { $_setUnsignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasStep() => $_has(5);
  @$pb.TagNumber(6)
  void clearStep() => clearField(6);

  @$pb.TagNumber(7)
  $core.List<$core.int> get data => $_getN(6);
  @$pb.TagNumber(7)
  set data($core.List<$core.int> v) { $_setBytes(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasData() => $_has(6);
  @$pb.TagNumber(7)
  void clearData() => clearField(7);
}

class RosTransformStamped extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RosTransformStamped', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'kachaka_api'), createEmptyInstance: create)
    ..aOM<RosHeader>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'header', subBuilder: RosHeader.create)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'childFrameId')
    ..aOM<Vector3>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'translation', subBuilder: Vector3.create)
    ..aOM<Quaternion>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'rotation', subBuilder: Quaternion.create)
    ..hasRequiredFields = false
  ;

  RosTransformStamped._() : super();
  factory RosTransformStamped({
    RosHeader? header,
    $core.String? childFrameId,
    Vector3? translation,
    Quaternion? rotation,
  }) {
    final _result = create();
    if (header != null) {
      _result.header = header;
    }
    if (childFrameId != null) {
      _result.childFrameId = childFrameId;
    }
    if (translation != null) {
      _result.translation = translation;
    }
    if (rotation != null) {
      _result.rotation = rotation;
    }
    return _result;
  }
  factory RosTransformStamped.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RosTransformStamped.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RosTransformStamped clone() => RosTransformStamped()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RosTransformStamped copyWith(void Function(RosTransformStamped) updates) => super.copyWith((message) => updates(message as RosTransformStamped)) as RosTransformStamped; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RosTransformStamped create() => RosTransformStamped._();
  RosTransformStamped createEmptyInstance() => create();
  static $pb.PbList<RosTransformStamped> createRepeated() => $pb.PbList<RosTransformStamped>();
  @$core.pragma('dart2js:noInline')
  static RosTransformStamped getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RosTransformStamped>(create);
  static RosTransformStamped? _defaultInstance;

  @$pb.TagNumber(1)
  RosHeader get header => $_getN(0);
  @$pb.TagNumber(1)
  set header(RosHeader v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasHeader() => $_has(0);
  @$pb.TagNumber(1)
  void clearHeader() => clearField(1);
  @$pb.TagNumber(1)
  RosHeader ensureHeader() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get childFrameId => $_getSZ(1);
  @$pb.TagNumber(2)
  set childFrameId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasChildFrameId() => $_has(1);
  @$pb.TagNumber(2)
  void clearChildFrameId() => clearField(2);

  @$pb.TagNumber(3)
  Vector3 get translation => $_getN(2);
  @$pb.TagNumber(3)
  set translation(Vector3 v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasTranslation() => $_has(2);
  @$pb.TagNumber(3)
  void clearTranslation() => clearField(3);
  @$pb.TagNumber(3)
  Vector3 ensureTranslation() => $_ensure(2);

  @$pb.TagNumber(4)
  Quaternion get rotation => $_getN(3);
  @$pb.TagNumber(4)
  set rotation(Quaternion v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasRotation() => $_has(3);
  @$pb.TagNumber(4)
  void clearRotation() => clearField(4);
  @$pb.TagNumber(4)
  Quaternion ensureRotation() => $_ensure(3);
}

class RosCompressedImage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RosCompressedImage', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'kachaka_api'), createEmptyInstance: create)
    ..aOM<RosHeader>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'header', subBuilder: RosHeader.create)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'format')
    ..a<$core.List<$core.int>>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'data', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  RosCompressedImage._() : super();
  factory RosCompressedImage({
    RosHeader? header,
    $core.String? format,
    $core.List<$core.int>? data,
  }) {
    final _result = create();
    if (header != null) {
      _result.header = header;
    }
    if (format != null) {
      _result.format = format;
    }
    if (data != null) {
      _result.data = data;
    }
    return _result;
  }
  factory RosCompressedImage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RosCompressedImage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RosCompressedImage clone() => RosCompressedImage()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RosCompressedImage copyWith(void Function(RosCompressedImage) updates) => super.copyWith((message) => updates(message as RosCompressedImage)) as RosCompressedImage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RosCompressedImage create() => RosCompressedImage._();
  RosCompressedImage createEmptyInstance() => create();
  static $pb.PbList<RosCompressedImage> createRepeated() => $pb.PbList<RosCompressedImage>();
  @$core.pragma('dart2js:noInline')
  static RosCompressedImage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RosCompressedImage>(create);
  static RosCompressedImage? _defaultInstance;

  @$pb.TagNumber(1)
  RosHeader get header => $_getN(0);
  @$pb.TagNumber(1)
  set header(RosHeader v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasHeader() => $_has(0);
  @$pb.TagNumber(1)
  void clearHeader() => clearField(1);
  @$pb.TagNumber(1)
  RosHeader ensureHeader() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get format => $_getSZ(1);
  @$pb.TagNumber(2)
  set format($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFormat() => $_has(1);
  @$pb.TagNumber(2)
  void clearFormat() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get data => $_getN(2);
  @$pb.TagNumber(3)
  set data($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
}

class ObjectDetection extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ObjectDetection', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'kachaka_api'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'label', $pb.PbFieldType.OU3)
    ..aOM<RegionOfInterest>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roi', subBuilder: RegionOfInterest.create)
    ..a<$core.double>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'score', $pb.PbFieldType.OF)
    ..a<$core.double>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'distanceMedian', $pb.PbFieldType.OD)
    ..hasRequiredFields = false
  ;

  ObjectDetection._() : super();
  factory ObjectDetection({
    $core.int? label,
    RegionOfInterest? roi,
    $core.double? score,
    $core.double? distanceMedian,
  }) {
    final _result = create();
    if (label != null) {
      _result.label = label;
    }
    if (roi != null) {
      _result.roi = roi;
    }
    if (score != null) {
      _result.score = score;
    }
    if (distanceMedian != null) {
      _result.distanceMedian = distanceMedian;
    }
    return _result;
  }
  factory ObjectDetection.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ObjectDetection.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ObjectDetection clone() => ObjectDetection()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ObjectDetection copyWith(void Function(ObjectDetection) updates) => super.copyWith((message) => updates(message as ObjectDetection)) as ObjectDetection; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ObjectDetection create() => ObjectDetection._();
  ObjectDetection createEmptyInstance() => create();
  static $pb.PbList<ObjectDetection> createRepeated() => $pb.PbList<ObjectDetection>();
  @$core.pragma('dart2js:noInline')
  static ObjectDetection getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ObjectDetection>(create);
  static ObjectDetection? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get label => $_getIZ(0);
  @$pb.TagNumber(1)
  set label($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLabel() => $_has(0);
  @$pb.TagNumber(1)
  void clearLabel() => clearField(1);

  @$pb.TagNumber(2)
  RegionOfInterest get roi => $_getN(1);
  @$pb.TagNumber(2)
  set roi(RegionOfInterest v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasRoi() => $_has(1);
  @$pb.TagNumber(2)
  void clearRoi() => clearField(2);
  @$pb.TagNumber(2)
  RegionOfInterest ensureRoi() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.double get score => $_getN(2);
  @$pb.TagNumber(3)
  set score($core.double v) { $_setFloat(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasScore() => $_has(2);
  @$pb.TagNumber(3)
  void clearScore() => clearField(3);

  @$pb.TagNumber(4)
  $core.double get distanceMedian => $_getN(3);
  @$pb.TagNumber(4)
  set distanceMedian($core.double v) { $_setDouble(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasDistanceMedian() => $_has(3);
  @$pb.TagNumber(4)
  void clearDistanceMedian() => clearField(4);
}

enum Command_Command {
  moveShelfCommand, 
  returnShelfCommand, 
  undockShelfCommand, 
  moveToLocationCommand, 
  returnHomeCommand, 
  dockShelfCommand, 
  speakCommand, 
  moveToPoseCommand, 
  notSet
}

class Command extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, Command_Command> _Command_CommandByTag = {
    1 : Command_Command.moveShelfCommand,
    2 : Command_Command.returnShelfCommand,
    5 : Command_Command.undockShelfCommand,
    7 : Command_Command.moveToLocationCommand,
    8 : Command_Command.returnHomeCommand,
    9 : Command_Command.dockShelfCommand,
    12 : Command_Command.speakCommand,
    13 : Command_Command.moveToPoseCommand,
    0 : Command_Command.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Command', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'kachaka_api'), createEmptyInstance: create)
    ..oo(0, [1, 2, 5, 7, 8, 9, 12, 13])
    ..aOM<MoveShelfCommand>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'moveShelfCommand', subBuilder: MoveShelfCommand.create)
    ..aOM<ReturnShelfCommand>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'returnShelfCommand', subBuilder: ReturnShelfCommand.create)
    ..aOM<UndockShelfCommand>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'undockShelfCommand', subBuilder: UndockShelfCommand.create)
    ..aOM<MoveToLocationCommand>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'moveToLocationCommand', subBuilder: MoveToLocationCommand.create)
    ..aOM<ReturnHomeCommand>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'returnHomeCommand', subBuilder: ReturnHomeCommand.create)
    ..aOM<DockShelfCommand>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'dockShelfCommand', subBuilder: DockShelfCommand.create)
    ..aOM<SpeakCommand>(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'speakCommand', subBuilder: SpeakCommand.create)
    ..aOM<MoveToPoseCommand>(13, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'moveToPoseCommand', subBuilder: MoveToPoseCommand.create)
    ..hasRequiredFields = false
  ;

  Command._() : super();
  factory Command({
    MoveShelfCommand? moveShelfCommand,
    ReturnShelfCommand? returnShelfCommand,
    UndockShelfCommand? undockShelfCommand,
    MoveToLocationCommand? moveToLocationCommand,
    ReturnHomeCommand? returnHomeCommand,
    DockShelfCommand? dockShelfCommand,
    SpeakCommand? speakCommand,
    MoveToPoseCommand? moveToPoseCommand,
  }) {
    final _result = create();
    if (moveShelfCommand != null) {
      _result.moveShelfCommand = moveShelfCommand;
    }
    if (returnShelfCommand != null) {
      _result.returnShelfCommand = returnShelfCommand;
    }
    if (undockShelfCommand != null) {
      _result.undockShelfCommand = undockShelfCommand;
    }
    if (moveToLocationCommand != null) {
      _result.moveToLocationCommand = moveToLocationCommand;
    }
    if (returnHomeCommand != null) {
      _result.returnHomeCommand = returnHomeCommand;
    }
    if (dockShelfCommand != null) {
      _result.dockShelfCommand = dockShelfCommand;
    }
    if (speakCommand != null) {
      _result.speakCommand = speakCommand;
    }
    if (moveToPoseCommand != null) {
      _result.moveToPoseCommand = moveToPoseCommand;
    }
    return _result;
  }
  factory Command.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Command.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Command clone() => Command()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Command copyWith(void Function(Command) updates) => super.copyWith((message) => updates(message as Command)) as Command; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Command create() => Command._();
  Command createEmptyInstance() => create();
  static $pb.PbList<Command> createRepeated() => $pb.PbList<Command>();
  @$core.pragma('dart2js:noInline')
  static Command getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Command>(create);
  static Command? _defaultInstance;

  Command_Command whichCommand() => _Command_CommandByTag[$_whichOneof(0)]!;
  void clearCommand() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  MoveShelfCommand get moveShelfCommand => $_getN(0);
  @$pb.TagNumber(1)
  set moveShelfCommand(MoveShelfCommand v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasMoveShelfCommand() => $_has(0);
  @$pb.TagNumber(1)
  void clearMoveShelfCommand() => clearField(1);
  @$pb.TagNumber(1)
  MoveShelfCommand ensureMoveShelfCommand() => $_ensure(0);

  @$pb.TagNumber(2)
  ReturnShelfCommand get returnShelfCommand => $_getN(1);
  @$pb.TagNumber(2)
  set returnShelfCommand(ReturnShelfCommand v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasReturnShelfCommand() => $_has(1);
  @$pb.TagNumber(2)
  void clearReturnShelfCommand() => clearField(2);
  @$pb.TagNumber(2)
  ReturnShelfCommand ensureReturnShelfCommand() => $_ensure(1);

  @$pb.TagNumber(5)
  UndockShelfCommand get undockShelfCommand => $_getN(2);
  @$pb.TagNumber(5)
  set undockShelfCommand(UndockShelfCommand v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasUndockShelfCommand() => $_has(2);
  @$pb.TagNumber(5)
  void clearUndockShelfCommand() => clearField(5);
  @$pb.TagNumber(5)
  UndockShelfCommand ensureUndockShelfCommand() => $_ensure(2);

  @$pb.TagNumber(7)
  MoveToLocationCommand get moveToLocationCommand => $_getN(3);
  @$pb.TagNumber(7)
  set moveToLocationCommand(MoveToLocationCommand v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasMoveToLocationCommand() => $_has(3);
  @$pb.TagNumber(7)
  void clearMoveToLocationCommand() => clearField(7);
  @$pb.TagNumber(7)
  MoveToLocationCommand ensureMoveToLocationCommand() => $_ensure(3);

  @$pb.TagNumber(8)
  ReturnHomeCommand get returnHomeCommand => $_getN(4);
  @$pb.TagNumber(8)
  set returnHomeCommand(ReturnHomeCommand v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasReturnHomeCommand() => $_has(4);
  @$pb.TagNumber(8)
  void clearReturnHomeCommand() => clearField(8);
  @$pb.TagNumber(8)
  ReturnHomeCommand ensureReturnHomeCommand() => $_ensure(4);

  @$pb.TagNumber(9)
  DockShelfCommand get dockShelfCommand => $_getN(5);
  @$pb.TagNumber(9)
  set dockShelfCommand(DockShelfCommand v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasDockShelfCommand() => $_has(5);
  @$pb.TagNumber(9)
  void clearDockShelfCommand() => clearField(9);
  @$pb.TagNumber(9)
  DockShelfCommand ensureDockShelfCommand() => $_ensure(5);

  @$pb.TagNumber(12)
  SpeakCommand get speakCommand => $_getN(6);
  @$pb.TagNumber(12)
  set speakCommand(SpeakCommand v) { setField(12, v); }
  @$pb.TagNumber(12)
  $core.bool hasSpeakCommand() => $_has(6);
  @$pb.TagNumber(12)
  void clearSpeakCommand() => clearField(12);
  @$pb.TagNumber(12)
  SpeakCommand ensureSpeakCommand() => $_ensure(6);

  @$pb.TagNumber(13)
  MoveToPoseCommand get moveToPoseCommand => $_getN(7);
  @$pb.TagNumber(13)
  set moveToPoseCommand(MoveToPoseCommand v) { setField(13, v); }
  @$pb.TagNumber(13)
  $core.bool hasMoveToPoseCommand() => $_has(7);
  @$pb.TagNumber(13)
  void clearMoveToPoseCommand() => clearField(13);
  @$pb.TagNumber(13)
  MoveToPoseCommand ensureMoveToPoseCommand() => $_ensure(7);
}

class MoveShelfCommand extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MoveShelfCommand', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'kachaka_api'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'targetShelfId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'destinationLocationId')
    ..hasRequiredFields = false
  ;

  MoveShelfCommand._() : super();
  factory MoveShelfCommand({
    $core.String? targetShelfId,
    $core.String? destinationLocationId,
  }) {
    final _result = create();
    if (targetShelfId != null) {
      _result.targetShelfId = targetShelfId;
    }
    if (destinationLocationId != null) {
      _result.destinationLocationId = destinationLocationId;
    }
    return _result;
  }
  factory MoveShelfCommand.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MoveShelfCommand.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MoveShelfCommand clone() => MoveShelfCommand()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MoveShelfCommand copyWith(void Function(MoveShelfCommand) updates) => super.copyWith((message) => updates(message as MoveShelfCommand)) as MoveShelfCommand; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MoveShelfCommand create() => MoveShelfCommand._();
  MoveShelfCommand createEmptyInstance() => create();
  static $pb.PbList<MoveShelfCommand> createRepeated() => $pb.PbList<MoveShelfCommand>();
  @$core.pragma('dart2js:noInline')
  static MoveShelfCommand getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MoveShelfCommand>(create);
  static MoveShelfCommand? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get targetShelfId => $_getSZ(0);
  @$pb.TagNumber(1)
  set targetShelfId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTargetShelfId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTargetShelfId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get destinationLocationId => $_getSZ(1);
  @$pb.TagNumber(2)
  set destinationLocationId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDestinationLocationId() => $_has(1);
  @$pb.TagNumber(2)
  void clearDestinationLocationId() => clearField(2);
}

class ReturnShelfCommand extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ReturnShelfCommand', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'kachaka_api'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'targetShelfId')
    ..hasRequiredFields = false
  ;

  ReturnShelfCommand._() : super();
  factory ReturnShelfCommand({
    $core.String? targetShelfId,
  }) {
    final _result = create();
    if (targetShelfId != null) {
      _result.targetShelfId = targetShelfId;
    }
    return _result;
  }
  factory ReturnShelfCommand.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReturnShelfCommand.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReturnShelfCommand clone() => ReturnShelfCommand()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReturnShelfCommand copyWith(void Function(ReturnShelfCommand) updates) => super.copyWith((message) => updates(message as ReturnShelfCommand)) as ReturnShelfCommand; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ReturnShelfCommand create() => ReturnShelfCommand._();
  ReturnShelfCommand createEmptyInstance() => create();
  static $pb.PbList<ReturnShelfCommand> createRepeated() => $pb.PbList<ReturnShelfCommand>();
  @$core.pragma('dart2js:noInline')
  static ReturnShelfCommand getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReturnShelfCommand>(create);
  static ReturnShelfCommand? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get targetShelfId => $_getSZ(0);
  @$pb.TagNumber(1)
  set targetShelfId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTargetShelfId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTargetShelfId() => clearField(1);
}

class UndockShelfCommand extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UndockShelfCommand', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'kachaka_api'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'targetShelfId')
    ..hasRequiredFields = false
  ;

  UndockShelfCommand._() : super();
  factory UndockShelfCommand({
    $core.String? targetShelfId,
  }) {
    final _result = create();
    if (targetShelfId != null) {
      _result.targetShelfId = targetShelfId;
    }
    return _result;
  }
  factory UndockShelfCommand.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UndockShelfCommand.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UndockShelfCommand clone() => UndockShelfCommand()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UndockShelfCommand copyWith(void Function(UndockShelfCommand) updates) => super.copyWith((message) => updates(message as UndockShelfCommand)) as UndockShelfCommand; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UndockShelfCommand create() => UndockShelfCommand._();
  UndockShelfCommand createEmptyInstance() => create();
  static $pb.PbList<UndockShelfCommand> createRepeated() => $pb.PbList<UndockShelfCommand>();
  @$core.pragma('dart2js:noInline')
  static UndockShelfCommand getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UndockShelfCommand>(create);
  static UndockShelfCommand? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get targetShelfId => $_getSZ(0);
  @$pb.TagNumber(1)
  set targetShelfId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTargetShelfId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTargetShelfId() => clearField(1);
}

class MoveToLocationCommand extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MoveToLocationCommand', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'kachaka_api'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'targetLocationId')
    ..hasRequiredFields = false
  ;

  MoveToLocationCommand._() : super();
  factory MoveToLocationCommand({
    $core.String? targetLocationId,
  }) {
    final _result = create();
    if (targetLocationId != null) {
      _result.targetLocationId = targetLocationId;
    }
    return _result;
  }
  factory MoveToLocationCommand.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MoveToLocationCommand.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MoveToLocationCommand clone() => MoveToLocationCommand()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MoveToLocationCommand copyWith(void Function(MoveToLocationCommand) updates) => super.copyWith((message) => updates(message as MoveToLocationCommand)) as MoveToLocationCommand; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MoveToLocationCommand create() => MoveToLocationCommand._();
  MoveToLocationCommand createEmptyInstance() => create();
  static $pb.PbList<MoveToLocationCommand> createRepeated() => $pb.PbList<MoveToLocationCommand>();
  @$core.pragma('dart2js:noInline')
  static MoveToLocationCommand getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MoveToLocationCommand>(create);
  static MoveToLocationCommand? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get targetLocationId => $_getSZ(0);
  @$pb.TagNumber(1)
  set targetLocationId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTargetLocationId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTargetLocationId() => clearField(1);
}

class ReturnHomeCommand extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ReturnHomeCommand', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'kachaka_api'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  ReturnHomeCommand._() : super();
  factory ReturnHomeCommand() => create();
  factory ReturnHomeCommand.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReturnHomeCommand.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReturnHomeCommand clone() => ReturnHomeCommand()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReturnHomeCommand copyWith(void Function(ReturnHomeCommand) updates) => super.copyWith((message) => updates(message as ReturnHomeCommand)) as ReturnHomeCommand; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ReturnHomeCommand create() => ReturnHomeCommand._();
  ReturnHomeCommand createEmptyInstance() => create();
  static $pb.PbList<ReturnHomeCommand> createRepeated() => $pb.PbList<ReturnHomeCommand>();
  @$core.pragma('dart2js:noInline')
  static ReturnHomeCommand getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReturnHomeCommand>(create);
  static ReturnHomeCommand? _defaultInstance;
}

class DockShelfCommand extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DockShelfCommand', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'kachaka_api'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  DockShelfCommand._() : super();
  factory DockShelfCommand() => create();
  factory DockShelfCommand.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DockShelfCommand.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DockShelfCommand clone() => DockShelfCommand()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DockShelfCommand copyWith(void Function(DockShelfCommand) updates) => super.copyWith((message) => updates(message as DockShelfCommand)) as DockShelfCommand; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DockShelfCommand create() => DockShelfCommand._();
  DockShelfCommand createEmptyInstance() => create();
  static $pb.PbList<DockShelfCommand> createRepeated() => $pb.PbList<DockShelfCommand>();
  @$core.pragma('dart2js:noInline')
  static DockShelfCommand getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DockShelfCommand>(create);
  static DockShelfCommand? _defaultInstance;
}

class SpeakCommand extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SpeakCommand', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'kachaka_api'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'text')
    ..hasRequiredFields = false
  ;

  SpeakCommand._() : super();
  factory SpeakCommand({
    $core.String? text,
  }) {
    final _result = create();
    if (text != null) {
      _result.text = text;
    }
    return _result;
  }
  factory SpeakCommand.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SpeakCommand.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SpeakCommand clone() => SpeakCommand()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SpeakCommand copyWith(void Function(SpeakCommand) updates) => super.copyWith((message) => updates(message as SpeakCommand)) as SpeakCommand; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SpeakCommand create() => SpeakCommand._();
  SpeakCommand createEmptyInstance() => create();
  static $pb.PbList<SpeakCommand> createRepeated() => $pb.PbList<SpeakCommand>();
  @$core.pragma('dart2js:noInline')
  static SpeakCommand getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SpeakCommand>(create);
  static SpeakCommand? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get text => $_getSZ(0);
  @$pb.TagNumber(1)
  set text($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasText() => $_has(0);
  @$pb.TagNumber(1)
  void clearText() => clearField(1);
}

class MoveToPoseCommand extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MoveToPoseCommand', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'kachaka_api'), createEmptyInstance: create)
    ..a<$core.double>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'x', $pb.PbFieldType.OD)
    ..a<$core.double>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'y', $pb.PbFieldType.OD)
    ..a<$core.double>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'yaw', $pb.PbFieldType.OD)
    ..hasRequiredFields = false
  ;

  MoveToPoseCommand._() : super();
  factory MoveToPoseCommand({
    $core.double? x,
    $core.double? y,
    $core.double? yaw,
  }) {
    final _result = create();
    if (x != null) {
      _result.x = x;
    }
    if (y != null) {
      _result.y = y;
    }
    if (yaw != null) {
      _result.yaw = yaw;
    }
    return _result;
  }
  factory MoveToPoseCommand.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MoveToPoseCommand.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MoveToPoseCommand clone() => MoveToPoseCommand()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MoveToPoseCommand copyWith(void Function(MoveToPoseCommand) updates) => super.copyWith((message) => updates(message as MoveToPoseCommand)) as MoveToPoseCommand; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MoveToPoseCommand create() => MoveToPoseCommand._();
  MoveToPoseCommand createEmptyInstance() => create();
  static $pb.PbList<MoveToPoseCommand> createRepeated() => $pb.PbList<MoveToPoseCommand>();
  @$core.pragma('dart2js:noInline')
  static MoveToPoseCommand getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MoveToPoseCommand>(create);
  static MoveToPoseCommand? _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get x => $_getN(0);
  @$pb.TagNumber(1)
  set x($core.double v) { $_setDouble(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasX() => $_has(0);
  @$pb.TagNumber(1)
  void clearX() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get y => $_getN(1);
  @$pb.TagNumber(2)
  set y($core.double v) { $_setDouble(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasY() => $_has(1);
  @$pb.TagNumber(2)
  void clearY() => clearField(2);

  @$pb.TagNumber(3)
  $core.double get yaw => $_getN(2);
  @$pb.TagNumber(3)
  set yaw($core.double v) { $_setDouble(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasYaw() => $_has(2);
  @$pb.TagNumber(3)
  void clearYaw() => clearField(3);
}

class EmptyRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'EmptyRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'kachaka_api'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  EmptyRequest._() : super();
  factory EmptyRequest() => create();
  factory EmptyRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EmptyRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  EmptyRequest clone() => EmptyRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EmptyRequest copyWith(void Function(EmptyRequest) updates) => super.copyWith((message) => updates(message as EmptyRequest)) as EmptyRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static EmptyRequest create() => EmptyRequest._();
  EmptyRequest createEmptyInstance() => create();
  static $pb.PbList<EmptyRequest> createRepeated() => $pb.PbList<EmptyRequest>();
  @$core.pragma('dart2js:noInline')
  static EmptyRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EmptyRequest>(create);
  static EmptyRequest? _defaultInstance;
}

class GetRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'kachaka_api'), createEmptyInstance: create)
    ..aOM<Metadata>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'metadata', subBuilder: Metadata.create)
    ..hasRequiredFields = false
  ;

  GetRequest._() : super();
  factory GetRequest({
    Metadata? metadata,
  }) {
    final _result = create();
    if (metadata != null) {
      _result.metadata = metadata;
    }
    return _result;
  }
  factory GetRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetRequest clone() => GetRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetRequest copyWith(void Function(GetRequest) updates) => super.copyWith((message) => updates(message as GetRequest)) as GetRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetRequest create() => GetRequest._();
  GetRequest createEmptyInstance() => create();
  static $pb.PbList<GetRequest> createRepeated() => $pb.PbList<GetRequest>();
  @$core.pragma('dart2js:noInline')
  static GetRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetRequest>(create);
  static GetRequest? _defaultInstance;

  @$pb.TagNumber(1)
  Metadata get metadata => $_getN(0);
  @$pb.TagNumber(1)
  set metadata(Metadata v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasMetadata() => $_has(0);
  @$pb.TagNumber(1)
  void clearMetadata() => clearField(1);
  @$pb.TagNumber(1)
  Metadata ensureMetadata() => $_ensure(0);
}

class GetRobotSerialNumberResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetRobotSerialNumberResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'kachaka_api'), createEmptyInstance: create)
    ..aOM<Metadata>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'metadata', subBuilder: Metadata.create)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'serialNumber')
    ..hasRequiredFields = false
  ;

  GetRobotSerialNumberResponse._() : super();
  factory GetRobotSerialNumberResponse({
    Metadata? metadata,
    $core.String? serialNumber,
  }) {
    final _result = create();
    if (metadata != null) {
      _result.metadata = metadata;
    }
    if (serialNumber != null) {
      _result.serialNumber = serialNumber;
    }
    return _result;
  }
  factory GetRobotSerialNumberResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetRobotSerialNumberResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetRobotSerialNumberResponse clone() => GetRobotSerialNumberResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetRobotSerialNumberResponse copyWith(void Function(GetRobotSerialNumberResponse) updates) => super.copyWith((message) => updates(message as GetRobotSerialNumberResponse)) as GetRobotSerialNumberResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetRobotSerialNumberResponse create() => GetRobotSerialNumberResponse._();
  GetRobotSerialNumberResponse createEmptyInstance() => create();
  static $pb.PbList<GetRobotSerialNumberResponse> createRepeated() => $pb.PbList<GetRobotSerialNumberResponse>();
  @$core.pragma('dart2js:noInline')
  static GetRobotSerialNumberResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetRobotSerialNumberResponse>(create);
  static GetRobotSerialNumberResponse? _defaultInstance;

  @$pb.TagNumber(1)
  Metadata get metadata => $_getN(0);
  @$pb.TagNumber(1)
  set metadata(Metadata v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasMetadata() => $_has(0);
  @$pb.TagNumber(1)
  void clearMetadata() => clearField(1);
  @$pb.TagNumber(1)
  Metadata ensureMetadata() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get serialNumber => $_getSZ(1);
  @$pb.TagNumber(2)
  set serialNumber($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSerialNumber() => $_has(1);
  @$pb.TagNumber(2)
  void clearSerialNumber() => clearField(2);
}

class GetRobotVersionResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetRobotVersionResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'kachaka_api'), createEmptyInstance: create)
    ..aOM<Metadata>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'metadata', subBuilder: Metadata.create)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'version')
    ..hasRequiredFields = false
  ;

  GetRobotVersionResponse._() : super();
  factory GetRobotVersionResponse({
    Metadata? metadata,
    $core.String? version,
  }) {
    final _result = create();
    if (metadata != null) {
      _result.metadata = metadata;
    }
    if (version != null) {
      _result.version = version;
    }
    return _result;
  }
  factory GetRobotVersionResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetRobotVersionResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetRobotVersionResponse clone() => GetRobotVersionResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetRobotVersionResponse copyWith(void Function(GetRobotVersionResponse) updates) => super.copyWith((message) => updates(message as GetRobotVersionResponse)) as GetRobotVersionResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetRobotVersionResponse create() => GetRobotVersionResponse._();
  GetRobotVersionResponse createEmptyInstance() => create();
  static $pb.PbList<GetRobotVersionResponse> createRepeated() => $pb.PbList<GetRobotVersionResponse>();
  @$core.pragma('dart2js:noInline')
  static GetRobotVersionResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetRobotVersionResponse>(create);
  static GetRobotVersionResponse? _defaultInstance;

  @$pb.TagNumber(1)
  Metadata get metadata => $_getN(0);
  @$pb.TagNumber(1)
  set metadata(Metadata v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasMetadata() => $_has(0);
  @$pb.TagNumber(1)
  void clearMetadata() => clearField(1);
  @$pb.TagNumber(1)
  Metadata ensureMetadata() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get version => $_getSZ(1);
  @$pb.TagNumber(2)
  set version($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasVersion() => $_has(1);
  @$pb.TagNumber(2)
  void clearVersion() => clearField(2);
}

class GetRobotPoseResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetRobotPoseResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'kachaka_api'), createEmptyInstance: create)
    ..aOM<Metadata>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'metadata', subBuilder: Metadata.create)
    ..aOM<Pose>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pose', subBuilder: Pose.create)
    ..hasRequiredFields = false
  ;

  GetRobotPoseResponse._() : super();
  factory GetRobotPoseResponse({
    Metadata? metadata,
    Pose? pose,
  }) {
    final _result = create();
    if (metadata != null) {
      _result.metadata = metadata;
    }
    if (pose != null) {
      _result.pose = pose;
    }
    return _result;
  }
  factory GetRobotPoseResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetRobotPoseResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetRobotPoseResponse clone() => GetRobotPoseResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetRobotPoseResponse copyWith(void Function(GetRobotPoseResponse) updates) => super.copyWith((message) => updates(message as GetRobotPoseResponse)) as GetRobotPoseResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetRobotPoseResponse create() => GetRobotPoseResponse._();
  GetRobotPoseResponse createEmptyInstance() => create();
  static $pb.PbList<GetRobotPoseResponse> createRepeated() => $pb.PbList<GetRobotPoseResponse>();
  @$core.pragma('dart2js:noInline')
  static GetRobotPoseResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetRobotPoseResponse>(create);
  static GetRobotPoseResponse? _defaultInstance;

  @$pb.TagNumber(1)
  Metadata get metadata => $_getN(0);
  @$pb.TagNumber(1)
  set metadata(Metadata v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasMetadata() => $_has(0);
  @$pb.TagNumber(1)
  void clearMetadata() => clearField(1);
  @$pb.TagNumber(1)
  Metadata ensureMetadata() => $_ensure(0);

  @$pb.TagNumber(2)
  Pose get pose => $_getN(1);
  @$pb.TagNumber(2)
  set pose(Pose v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasPose() => $_has(1);
  @$pb.TagNumber(2)
  void clearPose() => clearField(2);
  @$pb.TagNumber(2)
  Pose ensurePose() => $_ensure(1);
}

class GetPngMapResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetPngMapResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'kachaka_api'), createEmptyInstance: create)
    ..aOM<Metadata>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'metadata', subBuilder: Metadata.create)
    ..aOM<Map_>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'map', subBuilder: Map_.create)
    ..hasRequiredFields = false
  ;

  GetPngMapResponse._() : super();
  factory GetPngMapResponse({
    Metadata? metadata,
    Map_? map,
  }) {
    final _result = create();
    if (metadata != null) {
      _result.metadata = metadata;
    }
    if (map != null) {
      _result.map = map;
    }
    return _result;
  }
  factory GetPngMapResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetPngMapResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetPngMapResponse clone() => GetPngMapResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetPngMapResponse copyWith(void Function(GetPngMapResponse) updates) => super.copyWith((message) => updates(message as GetPngMapResponse)) as GetPngMapResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetPngMapResponse create() => GetPngMapResponse._();
  GetPngMapResponse createEmptyInstance() => create();
  static $pb.PbList<GetPngMapResponse> createRepeated() => $pb.PbList<GetPngMapResponse>();
  @$core.pragma('dart2js:noInline')
  static GetPngMapResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetPngMapResponse>(create);
  static GetPngMapResponse? _defaultInstance;

  @$pb.TagNumber(1)
  Metadata get metadata => $_getN(0);
  @$pb.TagNumber(1)
  set metadata(Metadata v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasMetadata() => $_has(0);
  @$pb.TagNumber(1)
  void clearMetadata() => clearField(1);
  @$pb.TagNumber(1)
  Metadata ensureMetadata() => $_ensure(0);

  @$pb.TagNumber(2)
  Map_ get map => $_getN(1);
  @$pb.TagNumber(2)
  set map(Map_ v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasMap() => $_has(1);
  @$pb.TagNumber(2)
  void clearMap() => clearField(2);
  @$pb.TagNumber(2)
  Map_ ensureMap() => $_ensure(1);
}

class GetObjectDetectionResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetObjectDetectionResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'kachaka_api'), createEmptyInstance: create)
    ..aOM<Metadata>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'metadata', subBuilder: Metadata.create)
    ..aOM<RosHeader>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'header', subBuilder: RosHeader.create)
    ..pc<ObjectDetection>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'objects', $pb.PbFieldType.PM, subBuilder: ObjectDetection.create)
    ..hasRequiredFields = false
  ;

  GetObjectDetectionResponse._() : super();
  factory GetObjectDetectionResponse({
    Metadata? metadata,
    RosHeader? header,
    $core.Iterable<ObjectDetection>? objects,
  }) {
    final _result = create();
    if (metadata != null) {
      _result.metadata = metadata;
    }
    if (header != null) {
      _result.header = header;
    }
    if (objects != null) {
      _result.objects.addAll(objects);
    }
    return _result;
  }
  factory GetObjectDetectionResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetObjectDetectionResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetObjectDetectionResponse clone() => GetObjectDetectionResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetObjectDetectionResponse copyWith(void Function(GetObjectDetectionResponse) updates) => super.copyWith((message) => updates(message as GetObjectDetectionResponse)) as GetObjectDetectionResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetObjectDetectionResponse create() => GetObjectDetectionResponse._();
  GetObjectDetectionResponse createEmptyInstance() => create();
  static $pb.PbList<GetObjectDetectionResponse> createRepeated() => $pb.PbList<GetObjectDetectionResponse>();
  @$core.pragma('dart2js:noInline')
  static GetObjectDetectionResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetObjectDetectionResponse>(create);
  static GetObjectDetectionResponse? _defaultInstance;

  @$pb.TagNumber(1)
  Metadata get metadata => $_getN(0);
  @$pb.TagNumber(1)
  set metadata(Metadata v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasMetadata() => $_has(0);
  @$pb.TagNumber(1)
  void clearMetadata() => clearField(1);
  @$pb.TagNumber(1)
  Metadata ensureMetadata() => $_ensure(0);

  @$pb.TagNumber(2)
  RosHeader get header => $_getN(1);
  @$pb.TagNumber(2)
  set header(RosHeader v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasHeader() => $_has(1);
  @$pb.TagNumber(2)
  void clearHeader() => clearField(2);
  @$pb.TagNumber(2)
  RosHeader ensureHeader() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.List<ObjectDetection> get objects => $_getList(2);
}

class GetRosImuResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetRosImuResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'kachaka_api'), createEmptyInstance: create)
    ..aOM<Metadata>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'metadata', subBuilder: Metadata.create)
    ..aOM<RosImu>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'imu', subBuilder: RosImu.create)
    ..hasRequiredFields = false
  ;

  GetRosImuResponse._() : super();
  factory GetRosImuResponse({
    Metadata? metadata,
    RosImu? imu,
  }) {
    final _result = create();
    if (metadata != null) {
      _result.metadata = metadata;
    }
    if (imu != null) {
      _result.imu = imu;
    }
    return _result;
  }
  factory GetRosImuResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetRosImuResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetRosImuResponse clone() => GetRosImuResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetRosImuResponse copyWith(void Function(GetRosImuResponse) updates) => super.copyWith((message) => updates(message as GetRosImuResponse)) as GetRosImuResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetRosImuResponse create() => GetRosImuResponse._();
  GetRosImuResponse createEmptyInstance() => create();
  static $pb.PbList<GetRosImuResponse> createRepeated() => $pb.PbList<GetRosImuResponse>();
  @$core.pragma('dart2js:noInline')
  static GetRosImuResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetRosImuResponse>(create);
  static GetRosImuResponse? _defaultInstance;

  @$pb.TagNumber(1)
  Metadata get metadata => $_getN(0);
  @$pb.TagNumber(1)
  set metadata(Metadata v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasMetadata() => $_has(0);
  @$pb.TagNumber(1)
  void clearMetadata() => clearField(1);
  @$pb.TagNumber(1)
  Metadata ensureMetadata() => $_ensure(0);

  @$pb.TagNumber(2)
  RosImu get imu => $_getN(1);
  @$pb.TagNumber(2)
  set imu(RosImu v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasImu() => $_has(1);
  @$pb.TagNumber(2)
  void clearImu() => clearField(2);
  @$pb.TagNumber(2)
  RosImu ensureImu() => $_ensure(1);
}

class GetRosOdometryResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetRosOdometryResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'kachaka_api'), createEmptyInstance: create)
    ..aOM<Metadata>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'metadata', subBuilder: Metadata.create)
    ..aOM<RosOdometry>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'odometry', subBuilder: RosOdometry.create)
    ..hasRequiredFields = false
  ;

  GetRosOdometryResponse._() : super();
  factory GetRosOdometryResponse({
    Metadata? metadata,
    RosOdometry? odometry,
  }) {
    final _result = create();
    if (metadata != null) {
      _result.metadata = metadata;
    }
    if (odometry != null) {
      _result.odometry = odometry;
    }
    return _result;
  }
  factory GetRosOdometryResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetRosOdometryResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetRosOdometryResponse clone() => GetRosOdometryResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetRosOdometryResponse copyWith(void Function(GetRosOdometryResponse) updates) => super.copyWith((message) => updates(message as GetRosOdometryResponse)) as GetRosOdometryResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetRosOdometryResponse create() => GetRosOdometryResponse._();
  GetRosOdometryResponse createEmptyInstance() => create();
  static $pb.PbList<GetRosOdometryResponse> createRepeated() => $pb.PbList<GetRosOdometryResponse>();
  @$core.pragma('dart2js:noInline')
  static GetRosOdometryResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetRosOdometryResponse>(create);
  static GetRosOdometryResponse? _defaultInstance;

  @$pb.TagNumber(1)
  Metadata get metadata => $_getN(0);
  @$pb.TagNumber(1)
  set metadata(Metadata v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasMetadata() => $_has(0);
  @$pb.TagNumber(1)
  void clearMetadata() => clearField(1);
  @$pb.TagNumber(1)
  Metadata ensureMetadata() => $_ensure(0);

  @$pb.TagNumber(2)
  RosOdometry get odometry => $_getN(1);
  @$pb.TagNumber(2)
  set odometry(RosOdometry v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasOdometry() => $_has(1);
  @$pb.TagNumber(2)
  void clearOdometry() => clearField(2);
  @$pb.TagNumber(2)
  RosOdometry ensureOdometry() => $_ensure(1);
}

class GetRosLaserScanResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetRosLaserScanResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'kachaka_api'), createEmptyInstance: create)
    ..aOM<Metadata>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'metadata', subBuilder: Metadata.create)
    ..aOM<RosLaserScan>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'scan', subBuilder: RosLaserScan.create)
    ..hasRequiredFields = false
  ;

  GetRosLaserScanResponse._() : super();
  factory GetRosLaserScanResponse({
    Metadata? metadata,
    RosLaserScan? scan,
  }) {
    final _result = create();
    if (metadata != null) {
      _result.metadata = metadata;
    }
    if (scan != null) {
      _result.scan = scan;
    }
    return _result;
  }
  factory GetRosLaserScanResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetRosLaserScanResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetRosLaserScanResponse clone() => GetRosLaserScanResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetRosLaserScanResponse copyWith(void Function(GetRosLaserScanResponse) updates) => super.copyWith((message) => updates(message as GetRosLaserScanResponse)) as GetRosLaserScanResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetRosLaserScanResponse create() => GetRosLaserScanResponse._();
  GetRosLaserScanResponse createEmptyInstance() => create();
  static $pb.PbList<GetRosLaserScanResponse> createRepeated() => $pb.PbList<GetRosLaserScanResponse>();
  @$core.pragma('dart2js:noInline')
  static GetRosLaserScanResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetRosLaserScanResponse>(create);
  static GetRosLaserScanResponse? _defaultInstance;

  @$pb.TagNumber(1)
  Metadata get metadata => $_getN(0);
  @$pb.TagNumber(1)
  set metadata(Metadata v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasMetadata() => $_has(0);
  @$pb.TagNumber(1)
  void clearMetadata() => clearField(1);
  @$pb.TagNumber(1)
  Metadata ensureMetadata() => $_ensure(0);

  @$pb.TagNumber(2)
  RosLaserScan get scan => $_getN(1);
  @$pb.TagNumber(2)
  set scan(RosLaserScan v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasScan() => $_has(1);
  @$pb.TagNumber(2)
  void clearScan() => clearField(2);
  @$pb.TagNumber(2)
  RosLaserScan ensureScan() => $_ensure(1);
}

class GetFrontCameraRosCameraInfoResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetFrontCameraRosCameraInfoResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'kachaka_api'), createEmptyInstance: create)
    ..aOM<Metadata>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'metadata', subBuilder: Metadata.create)
    ..aOM<RosCameraInfo>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'cameraInfo', subBuilder: RosCameraInfo.create)
    ..hasRequiredFields = false
  ;

  GetFrontCameraRosCameraInfoResponse._() : super();
  factory GetFrontCameraRosCameraInfoResponse({
    Metadata? metadata,
    RosCameraInfo? cameraInfo,
  }) {
    final _result = create();
    if (metadata != null) {
      _result.metadata = metadata;
    }
    if (cameraInfo != null) {
      _result.cameraInfo = cameraInfo;
    }
    return _result;
  }
  factory GetFrontCameraRosCameraInfoResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetFrontCameraRosCameraInfoResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetFrontCameraRosCameraInfoResponse clone() => GetFrontCameraRosCameraInfoResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetFrontCameraRosCameraInfoResponse copyWith(void Function(GetFrontCameraRosCameraInfoResponse) updates) => super.copyWith((message) => updates(message as GetFrontCameraRosCameraInfoResponse)) as GetFrontCameraRosCameraInfoResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetFrontCameraRosCameraInfoResponse create() => GetFrontCameraRosCameraInfoResponse._();
  GetFrontCameraRosCameraInfoResponse createEmptyInstance() => create();
  static $pb.PbList<GetFrontCameraRosCameraInfoResponse> createRepeated() => $pb.PbList<GetFrontCameraRosCameraInfoResponse>();
  @$core.pragma('dart2js:noInline')
  static GetFrontCameraRosCameraInfoResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetFrontCameraRosCameraInfoResponse>(create);
  static GetFrontCameraRosCameraInfoResponse? _defaultInstance;

  @$pb.TagNumber(1)
  Metadata get metadata => $_getN(0);
  @$pb.TagNumber(1)
  set metadata(Metadata v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasMetadata() => $_has(0);
  @$pb.TagNumber(1)
  void clearMetadata() => clearField(1);
  @$pb.TagNumber(1)
  Metadata ensureMetadata() => $_ensure(0);

  @$pb.TagNumber(2)
  RosCameraInfo get cameraInfo => $_getN(1);
  @$pb.TagNumber(2)
  set cameraInfo(RosCameraInfo v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasCameraInfo() => $_has(1);
  @$pb.TagNumber(2)
  void clearCameraInfo() => clearField(2);
  @$pb.TagNumber(2)
  RosCameraInfo ensureCameraInfo() => $_ensure(1);
}

class GetFrontCameraRosImageResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetFrontCameraRosImageResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'kachaka_api'), createEmptyInstance: create)
    ..aOM<Metadata>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'metadata', subBuilder: Metadata.create)
    ..aOM<RosImage>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'image', subBuilder: RosImage.create)
    ..hasRequiredFields = false
  ;

  GetFrontCameraRosImageResponse._() : super();
  factory GetFrontCameraRosImageResponse({
    Metadata? metadata,
    RosImage? image,
  }) {
    final _result = create();
    if (metadata != null) {
      _result.metadata = metadata;
    }
    if (image != null) {
      _result.image = image;
    }
    return _result;
  }
  factory GetFrontCameraRosImageResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetFrontCameraRosImageResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetFrontCameraRosImageResponse clone() => GetFrontCameraRosImageResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetFrontCameraRosImageResponse copyWith(void Function(GetFrontCameraRosImageResponse) updates) => super.copyWith((message) => updates(message as GetFrontCameraRosImageResponse)) as GetFrontCameraRosImageResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetFrontCameraRosImageResponse create() => GetFrontCameraRosImageResponse._();
  GetFrontCameraRosImageResponse createEmptyInstance() => create();
  static $pb.PbList<GetFrontCameraRosImageResponse> createRepeated() => $pb.PbList<GetFrontCameraRosImageResponse>();
  @$core.pragma('dart2js:noInline')
  static GetFrontCameraRosImageResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetFrontCameraRosImageResponse>(create);
  static GetFrontCameraRosImageResponse? _defaultInstance;

  @$pb.TagNumber(1)
  Metadata get metadata => $_getN(0);
  @$pb.TagNumber(1)
  set metadata(Metadata v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasMetadata() => $_has(0);
  @$pb.TagNumber(1)
  void clearMetadata() => clearField(1);
  @$pb.TagNumber(1)
  Metadata ensureMetadata() => $_ensure(0);

  @$pb.TagNumber(2)
  RosImage get image => $_getN(1);
  @$pb.TagNumber(2)
  set image(RosImage v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasImage() => $_has(1);
  @$pb.TagNumber(2)
  void clearImage() => clearField(2);
  @$pb.TagNumber(2)
  RosImage ensureImage() => $_ensure(1);
}

class GetFrontCameraRosCompressedImageResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetFrontCameraRosCompressedImageResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'kachaka_api'), createEmptyInstance: create)
    ..aOM<Metadata>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'metadata', subBuilder: Metadata.create)
    ..aOM<RosCompressedImage>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'image', subBuilder: RosCompressedImage.create)
    ..hasRequiredFields = false
  ;

  GetFrontCameraRosCompressedImageResponse._() : super();
  factory GetFrontCameraRosCompressedImageResponse({
    Metadata? metadata,
    RosCompressedImage? image,
  }) {
    final _result = create();
    if (metadata != null) {
      _result.metadata = metadata;
    }
    if (image != null) {
      _result.image = image;
    }
    return _result;
  }
  factory GetFrontCameraRosCompressedImageResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetFrontCameraRosCompressedImageResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetFrontCameraRosCompressedImageResponse clone() => GetFrontCameraRosCompressedImageResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetFrontCameraRosCompressedImageResponse copyWith(void Function(GetFrontCameraRosCompressedImageResponse) updates) => super.copyWith((message) => updates(message as GetFrontCameraRosCompressedImageResponse)) as GetFrontCameraRosCompressedImageResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetFrontCameraRosCompressedImageResponse create() => GetFrontCameraRosCompressedImageResponse._();
  GetFrontCameraRosCompressedImageResponse createEmptyInstance() => create();
  static $pb.PbList<GetFrontCameraRosCompressedImageResponse> createRepeated() => $pb.PbList<GetFrontCameraRosCompressedImageResponse>();
  @$core.pragma('dart2js:noInline')
  static GetFrontCameraRosCompressedImageResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetFrontCameraRosCompressedImageResponse>(create);
  static GetFrontCameraRosCompressedImageResponse? _defaultInstance;

  @$pb.TagNumber(1)
  Metadata get metadata => $_getN(0);
  @$pb.TagNumber(1)
  set metadata(Metadata v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasMetadata() => $_has(0);
  @$pb.TagNumber(1)
  void clearMetadata() => clearField(1);
  @$pb.TagNumber(1)
  Metadata ensureMetadata() => $_ensure(0);

  @$pb.TagNumber(2)
  RosCompressedImage get image => $_getN(1);
  @$pb.TagNumber(2)
  set image(RosCompressedImage v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasImage() => $_has(1);
  @$pb.TagNumber(2)
  void clearImage() => clearField(2);
  @$pb.TagNumber(2)
  RosCompressedImage ensureImage() => $_ensure(1);
}

class StartCommandRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'StartCommandRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'kachaka_api'), createEmptyInstance: create)
    ..aOM<Command>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'command', subBuilder: Command.create)
    ..aOB(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'cancelAll')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ttsOnSuccess')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'title')
    ..hasRequiredFields = false
  ;

  StartCommandRequest._() : super();
  factory StartCommandRequest({
    Command? command,
    $core.bool? cancelAll,
    $core.String? ttsOnSuccess,
    $core.String? title,
  }) {
    final _result = create();
    if (command != null) {
      _result.command = command;
    }
    if (cancelAll != null) {
      _result.cancelAll = cancelAll;
    }
    if (ttsOnSuccess != null) {
      _result.ttsOnSuccess = ttsOnSuccess;
    }
    if (title != null) {
      _result.title = title;
    }
    return _result;
  }
  factory StartCommandRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StartCommandRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  StartCommandRequest clone() => StartCommandRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  StartCommandRequest copyWith(void Function(StartCommandRequest) updates) => super.copyWith((message) => updates(message as StartCommandRequest)) as StartCommandRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static StartCommandRequest create() => StartCommandRequest._();
  StartCommandRequest createEmptyInstance() => create();
  static $pb.PbList<StartCommandRequest> createRepeated() => $pb.PbList<StartCommandRequest>();
  @$core.pragma('dart2js:noInline')
  static StartCommandRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StartCommandRequest>(create);
  static StartCommandRequest? _defaultInstance;

  @$pb.TagNumber(1)
  Command get command => $_getN(0);
  @$pb.TagNumber(1)
  set command(Command v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasCommand() => $_has(0);
  @$pb.TagNumber(1)
  void clearCommand() => clearField(1);
  @$pb.TagNumber(1)
  Command ensureCommand() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.bool get cancelAll => $_getBF(1);
  @$pb.TagNumber(2)
  set cancelAll($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCancelAll() => $_has(1);
  @$pb.TagNumber(2)
  void clearCancelAll() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get ttsOnSuccess => $_getSZ(2);
  @$pb.TagNumber(3)
  set ttsOnSuccess($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTtsOnSuccess() => $_has(2);
  @$pb.TagNumber(3)
  void clearTtsOnSuccess() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get title => $_getSZ(3);
  @$pb.TagNumber(4)
  set title($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasTitle() => $_has(3);
  @$pb.TagNumber(4)
  void clearTitle() => clearField(4);
}

class StartCommandResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'StartCommandResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'kachaka_api'), createEmptyInstance: create)
    ..aOM<Result>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'result', subBuilder: Result.create)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'commandId')
    ..hasRequiredFields = false
  ;

  StartCommandResponse._() : super();
  factory StartCommandResponse({
    Result? result,
    $core.String? commandId,
  }) {
    final _result = create();
    if (result != null) {
      _result.result = result;
    }
    if (commandId != null) {
      _result.commandId = commandId;
    }
    return _result;
  }
  factory StartCommandResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StartCommandResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  StartCommandResponse clone() => StartCommandResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  StartCommandResponse copyWith(void Function(StartCommandResponse) updates) => super.copyWith((message) => updates(message as StartCommandResponse)) as StartCommandResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static StartCommandResponse create() => StartCommandResponse._();
  StartCommandResponse createEmptyInstance() => create();
  static $pb.PbList<StartCommandResponse> createRepeated() => $pb.PbList<StartCommandResponse>();
  @$core.pragma('dart2js:noInline')
  static StartCommandResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StartCommandResponse>(create);
  static StartCommandResponse? _defaultInstance;

  @$pb.TagNumber(1)
  Result get result => $_getN(0);
  @$pb.TagNumber(1)
  set result(Result v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasResult() => $_has(0);
  @$pb.TagNumber(1)
  void clearResult() => clearField(1);
  @$pb.TagNumber(1)
  Result ensureResult() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get commandId => $_getSZ(1);
  @$pb.TagNumber(2)
  set commandId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCommandId() => $_has(1);
  @$pb.TagNumber(2)
  void clearCommandId() => clearField(2);
}

class CancelCommandResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CancelCommandResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'kachaka_api'), createEmptyInstance: create)
    ..aOM<Result>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'result', subBuilder: Result.create)
    ..aOM<Command>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'command', subBuilder: Command.create)
    ..hasRequiredFields = false
  ;

  CancelCommandResponse._() : super();
  factory CancelCommandResponse({
    Result? result,
    Command? command,
  }) {
    final _result = create();
    if (result != null) {
      _result.result = result;
    }
    if (command != null) {
      _result.command = command;
    }
    return _result;
  }
  factory CancelCommandResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CancelCommandResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CancelCommandResponse clone() => CancelCommandResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CancelCommandResponse copyWith(void Function(CancelCommandResponse) updates) => super.copyWith((message) => updates(message as CancelCommandResponse)) as CancelCommandResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CancelCommandResponse create() => CancelCommandResponse._();
  CancelCommandResponse createEmptyInstance() => create();
  static $pb.PbList<CancelCommandResponse> createRepeated() => $pb.PbList<CancelCommandResponse>();
  @$core.pragma('dart2js:noInline')
  static CancelCommandResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CancelCommandResponse>(create);
  static CancelCommandResponse? _defaultInstance;

  @$pb.TagNumber(1)
  Result get result => $_getN(0);
  @$pb.TagNumber(1)
  set result(Result v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasResult() => $_has(0);
  @$pb.TagNumber(1)
  void clearResult() => clearField(1);
  @$pb.TagNumber(1)
  Result ensureResult() => $_ensure(0);

  @$pb.TagNumber(2)
  Command get command => $_getN(1);
  @$pb.TagNumber(2)
  set command(Command v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasCommand() => $_has(1);
  @$pb.TagNumber(2)
  void clearCommand() => clearField(2);
  @$pb.TagNumber(2)
  Command ensureCommand() => $_ensure(1);
}

class GetCommandStateResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetCommandStateResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'kachaka_api'), createEmptyInstance: create)
    ..aOM<Metadata>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'metadata', subBuilder: Metadata.create)
    ..e<CommandState>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'state', $pb.PbFieldType.OE, defaultOrMaker: CommandState.COMMAND_STATE_UNSPECIFIED, valueOf: CommandState.valueOf, enumValues: CommandState.values)
    ..aOM<Command>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'command', subBuilder: Command.create)
    ..hasRequiredFields = false
  ;

  GetCommandStateResponse._() : super();
  factory GetCommandStateResponse({
    Metadata? metadata,
    CommandState? state,
    Command? command,
  }) {
    final _result = create();
    if (metadata != null) {
      _result.metadata = metadata;
    }
    if (state != null) {
      _result.state = state;
    }
    if (command != null) {
      _result.command = command;
    }
    return _result;
  }
  factory GetCommandStateResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetCommandStateResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetCommandStateResponse clone() => GetCommandStateResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetCommandStateResponse copyWith(void Function(GetCommandStateResponse) updates) => super.copyWith((message) => updates(message as GetCommandStateResponse)) as GetCommandStateResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetCommandStateResponse create() => GetCommandStateResponse._();
  GetCommandStateResponse createEmptyInstance() => create();
  static $pb.PbList<GetCommandStateResponse> createRepeated() => $pb.PbList<GetCommandStateResponse>();
  @$core.pragma('dart2js:noInline')
  static GetCommandStateResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetCommandStateResponse>(create);
  static GetCommandStateResponse? _defaultInstance;

  @$pb.TagNumber(1)
  Metadata get metadata => $_getN(0);
  @$pb.TagNumber(1)
  set metadata(Metadata v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasMetadata() => $_has(0);
  @$pb.TagNumber(1)
  void clearMetadata() => clearField(1);
  @$pb.TagNumber(1)
  Metadata ensureMetadata() => $_ensure(0);

  @$pb.TagNumber(2)
  CommandState get state => $_getN(1);
  @$pb.TagNumber(2)
  set state(CommandState v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasState() => $_has(1);
  @$pb.TagNumber(2)
  void clearState() => clearField(2);

  @$pb.TagNumber(3)
  Command get command => $_getN(2);
  @$pb.TagNumber(3)
  set command(Command v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasCommand() => $_has(2);
  @$pb.TagNumber(3)
  void clearCommand() => clearField(3);
  @$pb.TagNumber(3)
  Command ensureCommand() => $_ensure(2);
}

class GetLastCommandResultResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetLastCommandResultResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'kachaka_api'), createEmptyInstance: create)
    ..aOM<Metadata>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'metadata', subBuilder: Metadata.create)
    ..aOM<Result>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'result', subBuilder: Result.create)
    ..aOM<Command>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'command', subBuilder: Command.create)
    ..hasRequiredFields = false
  ;

  GetLastCommandResultResponse._() : super();
  factory GetLastCommandResultResponse({
    Metadata? metadata,
    Result? result,
    Command? command,
  }) {
    final _result = create();
    if (metadata != null) {
      _result.metadata = metadata;
    }
    if (result != null) {
      _result.result = result;
    }
    if (command != null) {
      _result.command = command;
    }
    return _result;
  }
  factory GetLastCommandResultResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetLastCommandResultResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetLastCommandResultResponse clone() => GetLastCommandResultResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetLastCommandResultResponse copyWith(void Function(GetLastCommandResultResponse) updates) => super.copyWith((message) => updates(message as GetLastCommandResultResponse)) as GetLastCommandResultResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetLastCommandResultResponse create() => GetLastCommandResultResponse._();
  GetLastCommandResultResponse createEmptyInstance() => create();
  static $pb.PbList<GetLastCommandResultResponse> createRepeated() => $pb.PbList<GetLastCommandResultResponse>();
  @$core.pragma('dart2js:noInline')
  static GetLastCommandResultResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetLastCommandResultResponse>(create);
  static GetLastCommandResultResponse? _defaultInstance;

  @$pb.TagNumber(1)
  Metadata get metadata => $_getN(0);
  @$pb.TagNumber(1)
  set metadata(Metadata v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasMetadata() => $_has(0);
  @$pb.TagNumber(1)
  void clearMetadata() => clearField(1);
  @$pb.TagNumber(1)
  Metadata ensureMetadata() => $_ensure(0);

  @$pb.TagNumber(2)
  Result get result => $_getN(1);
  @$pb.TagNumber(2)
  set result(Result v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasResult() => $_has(1);
  @$pb.TagNumber(2)
  void clearResult() => clearField(2);
  @$pb.TagNumber(2)
  Result ensureResult() => $_ensure(1);

  @$pb.TagNumber(3)
  Command get command => $_getN(2);
  @$pb.TagNumber(3)
  set command(Command v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasCommand() => $_has(2);
  @$pb.TagNumber(3)
  void clearCommand() => clearField(3);
  @$pb.TagNumber(3)
  Command ensureCommand() => $_ensure(2);
}

class GetLocationsResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetLocationsResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'kachaka_api'), createEmptyInstance: create)
    ..aOM<Metadata>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'metadata', subBuilder: Metadata.create)
    ..pc<Location>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'locations', $pb.PbFieldType.PM, subBuilder: Location.create)
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'defaultLocationId')
    ..hasRequiredFields = false
  ;

  GetLocationsResponse._() : super();
  factory GetLocationsResponse({
    Metadata? metadata,
    $core.Iterable<Location>? locations,
    $core.String? defaultLocationId,
  }) {
    final _result = create();
    if (metadata != null) {
      _result.metadata = metadata;
    }
    if (locations != null) {
      _result.locations.addAll(locations);
    }
    if (defaultLocationId != null) {
      _result.defaultLocationId = defaultLocationId;
    }
    return _result;
  }
  factory GetLocationsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetLocationsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetLocationsResponse clone() => GetLocationsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetLocationsResponse copyWith(void Function(GetLocationsResponse) updates) => super.copyWith((message) => updates(message as GetLocationsResponse)) as GetLocationsResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetLocationsResponse create() => GetLocationsResponse._();
  GetLocationsResponse createEmptyInstance() => create();
  static $pb.PbList<GetLocationsResponse> createRepeated() => $pb.PbList<GetLocationsResponse>();
  @$core.pragma('dart2js:noInline')
  static GetLocationsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetLocationsResponse>(create);
  static GetLocationsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  Metadata get metadata => $_getN(0);
  @$pb.TagNumber(1)
  set metadata(Metadata v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasMetadata() => $_has(0);
  @$pb.TagNumber(1)
  void clearMetadata() => clearField(1);
  @$pb.TagNumber(1)
  Metadata ensureMetadata() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<Location> get locations => $_getList(1);

  @$pb.TagNumber(3)
  $core.String get defaultLocationId => $_getSZ(2);
  @$pb.TagNumber(3)
  set defaultLocationId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDefaultLocationId() => $_has(2);
  @$pb.TagNumber(3)
  void clearDefaultLocationId() => clearField(3);
}

class GetShelvesResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetShelvesResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'kachaka_api'), createEmptyInstance: create)
    ..aOM<Metadata>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'metadata', subBuilder: Metadata.create)
    ..pc<Shelf>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'shelves', $pb.PbFieldType.PM, subBuilder: Shelf.create)
    ..hasRequiredFields = false
  ;

  GetShelvesResponse._() : super();
  factory GetShelvesResponse({
    Metadata? metadata,
    $core.Iterable<Shelf>? shelves,
  }) {
    final _result = create();
    if (metadata != null) {
      _result.metadata = metadata;
    }
    if (shelves != null) {
      _result.shelves.addAll(shelves);
    }
    return _result;
  }
  factory GetShelvesResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetShelvesResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetShelvesResponse clone() => GetShelvesResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetShelvesResponse copyWith(void Function(GetShelvesResponse) updates) => super.copyWith((message) => updates(message as GetShelvesResponse)) as GetShelvesResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetShelvesResponse create() => GetShelvesResponse._();
  GetShelvesResponse createEmptyInstance() => create();
  static $pb.PbList<GetShelvesResponse> createRepeated() => $pb.PbList<GetShelvesResponse>();
  @$core.pragma('dart2js:noInline')
  static GetShelvesResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetShelvesResponse>(create);
  static GetShelvesResponse? _defaultInstance;

  @$pb.TagNumber(1)
  Metadata get metadata => $_getN(0);
  @$pb.TagNumber(1)
  set metadata(Metadata v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasMetadata() => $_has(0);
  @$pb.TagNumber(1)
  void clearMetadata() => clearField(1);
  @$pb.TagNumber(1)
  Metadata ensureMetadata() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<Shelf> get shelves => $_getList(1);
}

class SetAutoHomingEnabledRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SetAutoHomingEnabledRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'kachaka_api'), createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'enable')
    ..hasRequiredFields = false
  ;

  SetAutoHomingEnabledRequest._() : super();
  factory SetAutoHomingEnabledRequest({
    $core.bool? enable,
  }) {
    final _result = create();
    if (enable != null) {
      _result.enable = enable;
    }
    return _result;
  }
  factory SetAutoHomingEnabledRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SetAutoHomingEnabledRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SetAutoHomingEnabledRequest clone() => SetAutoHomingEnabledRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SetAutoHomingEnabledRequest copyWith(void Function(SetAutoHomingEnabledRequest) updates) => super.copyWith((message) => updates(message as SetAutoHomingEnabledRequest)) as SetAutoHomingEnabledRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SetAutoHomingEnabledRequest create() => SetAutoHomingEnabledRequest._();
  SetAutoHomingEnabledRequest createEmptyInstance() => create();
  static $pb.PbList<SetAutoHomingEnabledRequest> createRepeated() => $pb.PbList<SetAutoHomingEnabledRequest>();
  @$core.pragma('dart2js:noInline')
  static SetAutoHomingEnabledRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SetAutoHomingEnabledRequest>(create);
  static SetAutoHomingEnabledRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get enable => $_getBF(0);
  @$pb.TagNumber(1)
  set enable($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEnable() => $_has(0);
  @$pb.TagNumber(1)
  void clearEnable() => clearField(1);
}

class SetAutoHomingEnabledResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SetAutoHomingEnabledResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'kachaka_api'), createEmptyInstance: create)
    ..aOM<Result>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'result', subBuilder: Result.create)
    ..hasRequiredFields = false
  ;

  SetAutoHomingEnabledResponse._() : super();
  factory SetAutoHomingEnabledResponse({
    Result? result,
  }) {
    final _result = create();
    if (result != null) {
      _result.result = result;
    }
    return _result;
  }
  factory SetAutoHomingEnabledResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SetAutoHomingEnabledResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SetAutoHomingEnabledResponse clone() => SetAutoHomingEnabledResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SetAutoHomingEnabledResponse copyWith(void Function(SetAutoHomingEnabledResponse) updates) => super.copyWith((message) => updates(message as SetAutoHomingEnabledResponse)) as SetAutoHomingEnabledResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SetAutoHomingEnabledResponse create() => SetAutoHomingEnabledResponse._();
  SetAutoHomingEnabledResponse createEmptyInstance() => create();
  static $pb.PbList<SetAutoHomingEnabledResponse> createRepeated() => $pb.PbList<SetAutoHomingEnabledResponse>();
  @$core.pragma('dart2js:noInline')
  static SetAutoHomingEnabledResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SetAutoHomingEnabledResponse>(create);
  static SetAutoHomingEnabledResponse? _defaultInstance;

  @$pb.TagNumber(1)
  Result get result => $_getN(0);
  @$pb.TagNumber(1)
  set result(Result v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasResult() => $_has(0);
  @$pb.TagNumber(1)
  void clearResult() => clearField(1);
  @$pb.TagNumber(1)
  Result ensureResult() => $_ensure(0);
}

class GetAutoHomingEnabledResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetAutoHomingEnabledResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'kachaka_api'), createEmptyInstance: create)
    ..aOM<Metadata>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'metadata', subBuilder: Metadata.create)
    ..aOB(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'enabled')
    ..hasRequiredFields = false
  ;

  GetAutoHomingEnabledResponse._() : super();
  factory GetAutoHomingEnabledResponse({
    Metadata? metadata,
    $core.bool? enabled,
  }) {
    final _result = create();
    if (metadata != null) {
      _result.metadata = metadata;
    }
    if (enabled != null) {
      _result.enabled = enabled;
    }
    return _result;
  }
  factory GetAutoHomingEnabledResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetAutoHomingEnabledResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetAutoHomingEnabledResponse clone() => GetAutoHomingEnabledResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetAutoHomingEnabledResponse copyWith(void Function(GetAutoHomingEnabledResponse) updates) => super.copyWith((message) => updates(message as GetAutoHomingEnabledResponse)) as GetAutoHomingEnabledResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetAutoHomingEnabledResponse create() => GetAutoHomingEnabledResponse._();
  GetAutoHomingEnabledResponse createEmptyInstance() => create();
  static $pb.PbList<GetAutoHomingEnabledResponse> createRepeated() => $pb.PbList<GetAutoHomingEnabledResponse>();
  @$core.pragma('dart2js:noInline')
  static GetAutoHomingEnabledResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetAutoHomingEnabledResponse>(create);
  static GetAutoHomingEnabledResponse? _defaultInstance;

  @$pb.TagNumber(1)
  Metadata get metadata => $_getN(0);
  @$pb.TagNumber(1)
  set metadata(Metadata v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasMetadata() => $_has(0);
  @$pb.TagNumber(1)
  void clearMetadata() => clearField(1);
  @$pb.TagNumber(1)
  Metadata ensureMetadata() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.bool get enabled => $_getBF(1);
  @$pb.TagNumber(2)
  set enabled($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasEnabled() => $_has(1);
  @$pb.TagNumber(2)
  void clearEnabled() => clearField(2);
}

class SetManualControlEnabledRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SetManualControlEnabledRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'kachaka_api'), createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'enable')
    ..aOB(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'useShelfRegistration')
    ..hasRequiredFields = false
  ;

  SetManualControlEnabledRequest._() : super();
  factory SetManualControlEnabledRequest({
    $core.bool? enable,
    $core.bool? useShelfRegistration,
  }) {
    final _result = create();
    if (enable != null) {
      _result.enable = enable;
    }
    if (useShelfRegistration != null) {
      _result.useShelfRegistration = useShelfRegistration;
    }
    return _result;
  }
  factory SetManualControlEnabledRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SetManualControlEnabledRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SetManualControlEnabledRequest clone() => SetManualControlEnabledRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SetManualControlEnabledRequest copyWith(void Function(SetManualControlEnabledRequest) updates) => super.copyWith((message) => updates(message as SetManualControlEnabledRequest)) as SetManualControlEnabledRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SetManualControlEnabledRequest create() => SetManualControlEnabledRequest._();
  SetManualControlEnabledRequest createEmptyInstance() => create();
  static $pb.PbList<SetManualControlEnabledRequest> createRepeated() => $pb.PbList<SetManualControlEnabledRequest>();
  @$core.pragma('dart2js:noInline')
  static SetManualControlEnabledRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SetManualControlEnabledRequest>(create);
  static SetManualControlEnabledRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get enable => $_getBF(0);
  @$pb.TagNumber(1)
  set enable($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEnable() => $_has(0);
  @$pb.TagNumber(1)
  void clearEnable() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get useShelfRegistration => $_getBF(1);
  @$pb.TagNumber(2)
  set useShelfRegistration($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUseShelfRegistration() => $_has(1);
  @$pb.TagNumber(2)
  void clearUseShelfRegistration() => clearField(2);
}

class SetManualControlEnabledResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SetManualControlEnabledResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'kachaka_api'), createEmptyInstance: create)
    ..aOM<Result>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'result', subBuilder: Result.create)
    ..hasRequiredFields = false
  ;

  SetManualControlEnabledResponse._() : super();
  factory SetManualControlEnabledResponse({
    Result? result,
  }) {
    final _result = create();
    if (result != null) {
      _result.result = result;
    }
    return _result;
  }
  factory SetManualControlEnabledResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SetManualControlEnabledResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SetManualControlEnabledResponse clone() => SetManualControlEnabledResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SetManualControlEnabledResponse copyWith(void Function(SetManualControlEnabledResponse) updates) => super.copyWith((message) => updates(message as SetManualControlEnabledResponse)) as SetManualControlEnabledResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SetManualControlEnabledResponse create() => SetManualControlEnabledResponse._();
  SetManualControlEnabledResponse createEmptyInstance() => create();
  static $pb.PbList<SetManualControlEnabledResponse> createRepeated() => $pb.PbList<SetManualControlEnabledResponse>();
  @$core.pragma('dart2js:noInline')
  static SetManualControlEnabledResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SetManualControlEnabledResponse>(create);
  static SetManualControlEnabledResponse? _defaultInstance;

  @$pb.TagNumber(1)
  Result get result => $_getN(0);
  @$pb.TagNumber(1)
  set result(Result v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasResult() => $_has(0);
  @$pb.TagNumber(1)
  void clearResult() => clearField(1);
  @$pb.TagNumber(1)
  Result ensureResult() => $_ensure(0);
}

class GetManualControlEnabledResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetManualControlEnabledResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'kachaka_api'), createEmptyInstance: create)
    ..aOM<Metadata>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'metadata', subBuilder: Metadata.create)
    ..aOB(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'enabled')
    ..hasRequiredFields = false
  ;

  GetManualControlEnabledResponse._() : super();
  factory GetManualControlEnabledResponse({
    Metadata? metadata,
    $core.bool? enabled,
  }) {
    final _result = create();
    if (metadata != null) {
      _result.metadata = metadata;
    }
    if (enabled != null) {
      _result.enabled = enabled;
    }
    return _result;
  }
  factory GetManualControlEnabledResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetManualControlEnabledResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetManualControlEnabledResponse clone() => GetManualControlEnabledResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetManualControlEnabledResponse copyWith(void Function(GetManualControlEnabledResponse) updates) => super.copyWith((message) => updates(message as GetManualControlEnabledResponse)) as GetManualControlEnabledResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetManualControlEnabledResponse create() => GetManualControlEnabledResponse._();
  GetManualControlEnabledResponse createEmptyInstance() => create();
  static $pb.PbList<GetManualControlEnabledResponse> createRepeated() => $pb.PbList<GetManualControlEnabledResponse>();
  @$core.pragma('dart2js:noInline')
  static GetManualControlEnabledResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetManualControlEnabledResponse>(create);
  static GetManualControlEnabledResponse? _defaultInstance;

  @$pb.TagNumber(1)
  Metadata get metadata => $_getN(0);
  @$pb.TagNumber(1)
  set metadata(Metadata v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasMetadata() => $_has(0);
  @$pb.TagNumber(1)
  void clearMetadata() => clearField(1);
  @$pb.TagNumber(1)
  Metadata ensureMetadata() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.bool get enabled => $_getBF(1);
  @$pb.TagNumber(2)
  set enabled($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasEnabled() => $_has(1);
  @$pb.TagNumber(2)
  void clearEnabled() => clearField(2);
}

class SetRobotVelocityRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SetRobotVelocityRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'kachaka_api'), createEmptyInstance: create)
    ..a<$core.double>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'linear', $pb.PbFieldType.OD)
    ..a<$core.double>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'angular', $pb.PbFieldType.OD)
    ..hasRequiredFields = false
  ;

  SetRobotVelocityRequest._() : super();
  factory SetRobotVelocityRequest({
    $core.double? linear,
    $core.double? angular,
  }) {
    final _result = create();
    if (linear != null) {
      _result.linear = linear;
    }
    if (angular != null) {
      _result.angular = angular;
    }
    return _result;
  }
  factory SetRobotVelocityRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SetRobotVelocityRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SetRobotVelocityRequest clone() => SetRobotVelocityRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SetRobotVelocityRequest copyWith(void Function(SetRobotVelocityRequest) updates) => super.copyWith((message) => updates(message as SetRobotVelocityRequest)) as SetRobotVelocityRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SetRobotVelocityRequest create() => SetRobotVelocityRequest._();
  SetRobotVelocityRequest createEmptyInstance() => create();
  static $pb.PbList<SetRobotVelocityRequest> createRepeated() => $pb.PbList<SetRobotVelocityRequest>();
  @$core.pragma('dart2js:noInline')
  static SetRobotVelocityRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SetRobotVelocityRequest>(create);
  static SetRobotVelocityRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get linear => $_getN(0);
  @$pb.TagNumber(1)
  set linear($core.double v) { $_setDouble(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLinear() => $_has(0);
  @$pb.TagNumber(1)
  void clearLinear() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get angular => $_getN(1);
  @$pb.TagNumber(2)
  set angular($core.double v) { $_setDouble(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAngular() => $_has(1);
  @$pb.TagNumber(2)
  void clearAngular() => clearField(2);
}

class SetRobotVelocityResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SetRobotVelocityResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'kachaka_api'), createEmptyInstance: create)
    ..aOM<Result>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'result', subBuilder: Result.create)
    ..hasRequiredFields = false
  ;

  SetRobotVelocityResponse._() : super();
  factory SetRobotVelocityResponse({
    Result? result,
  }) {
    final _result = create();
    if (result != null) {
      _result.result = result;
    }
    return _result;
  }
  factory SetRobotVelocityResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SetRobotVelocityResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SetRobotVelocityResponse clone() => SetRobotVelocityResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SetRobotVelocityResponse copyWith(void Function(SetRobotVelocityResponse) updates) => super.copyWith((message) => updates(message as SetRobotVelocityResponse)) as SetRobotVelocityResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SetRobotVelocityResponse create() => SetRobotVelocityResponse._();
  SetRobotVelocityResponse createEmptyInstance() => create();
  static $pb.PbList<SetRobotVelocityResponse> createRepeated() => $pb.PbList<SetRobotVelocityResponse>();
  @$core.pragma('dart2js:noInline')
  static SetRobotVelocityResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SetRobotVelocityResponse>(create);
  static SetRobotVelocityResponse? _defaultInstance;

  @$pb.TagNumber(1)
  Result get result => $_getN(0);
  @$pb.TagNumber(1)
  set result(Result v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasResult() => $_has(0);
  @$pb.TagNumber(1)
  void clearResult() => clearField(1);
  @$pb.TagNumber(1)
  Result ensureResult() => $_ensure(0);
}

class GetStaticTransformResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetStaticTransformResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'kachaka_api'), createEmptyInstance: create)
    ..aOM<Metadata>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'metadata', subBuilder: Metadata.create)
    ..pc<RosTransformStamped>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'transforms', $pb.PbFieldType.PM, subBuilder: RosTransformStamped.create)
    ..hasRequiredFields = false
  ;

  GetStaticTransformResponse._() : super();
  factory GetStaticTransformResponse({
    Metadata? metadata,
    $core.Iterable<RosTransformStamped>? transforms,
  }) {
    final _result = create();
    if (metadata != null) {
      _result.metadata = metadata;
    }
    if (transforms != null) {
      _result.transforms.addAll(transforms);
    }
    return _result;
  }
  factory GetStaticTransformResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetStaticTransformResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetStaticTransformResponse clone() => GetStaticTransformResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetStaticTransformResponse copyWith(void Function(GetStaticTransformResponse) updates) => super.copyWith((message) => updates(message as GetStaticTransformResponse)) as GetStaticTransformResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetStaticTransformResponse create() => GetStaticTransformResponse._();
  GetStaticTransformResponse createEmptyInstance() => create();
  static $pb.PbList<GetStaticTransformResponse> createRepeated() => $pb.PbList<GetStaticTransformResponse>();
  @$core.pragma('dart2js:noInline')
  static GetStaticTransformResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetStaticTransformResponse>(create);
  static GetStaticTransformResponse? _defaultInstance;

  @$pb.TagNumber(1)
  Metadata get metadata => $_getN(0);
  @$pb.TagNumber(1)
  set metadata(Metadata v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasMetadata() => $_has(0);
  @$pb.TagNumber(1)
  void clearMetadata() => clearField(1);
  @$pb.TagNumber(1)
  Metadata ensureMetadata() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<RosTransformStamped> get transforms => $_getList(1);
}

class GetDynamicTransformResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetDynamicTransformResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'kachaka_api'), createEmptyInstance: create)
    ..pc<RosTransformStamped>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'transforms', $pb.PbFieldType.PM, subBuilder: RosTransformStamped.create)
    ..hasRequiredFields = false
  ;

  GetDynamicTransformResponse._() : super();
  factory GetDynamicTransformResponse({
    $core.Iterable<RosTransformStamped>? transforms,
  }) {
    final _result = create();
    if (transforms != null) {
      _result.transforms.addAll(transforms);
    }
    return _result;
  }
  factory GetDynamicTransformResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetDynamicTransformResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetDynamicTransformResponse clone() => GetDynamicTransformResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetDynamicTransformResponse copyWith(void Function(GetDynamicTransformResponse) updates) => super.copyWith((message) => updates(message as GetDynamicTransformResponse)) as GetDynamicTransformResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetDynamicTransformResponse create() => GetDynamicTransformResponse._();
  GetDynamicTransformResponse createEmptyInstance() => create();
  static $pb.PbList<GetDynamicTransformResponse> createRepeated() => $pb.PbList<GetDynamicTransformResponse>();
  @$core.pragma('dart2js:noInline')
  static GetDynamicTransformResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetDynamicTransformResponse>(create);
  static GetDynamicTransformResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<RosTransformStamped> get transforms => $_getList(0);
}

class History extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'History', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'kachaka_api'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOM<Command>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'command', subBuilder: Command.create)
    ..aOB(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'success')
    ..a<$core.int>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'errorCode', $pb.PbFieldType.O3)
    ..aInt64(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'commandExecutedTime')
    ..hasRequiredFields = false
  ;

  History._() : super();
  factory History({
    $core.String? id,
    Command? command,
    $core.bool? success,
    $core.int? errorCode,
    $fixnum.Int64? commandExecutedTime,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (command != null) {
      _result.command = command;
    }
    if (success != null) {
      _result.success = success;
    }
    if (errorCode != null) {
      _result.errorCode = errorCode;
    }
    if (commandExecutedTime != null) {
      _result.commandExecutedTime = commandExecutedTime;
    }
    return _result;
  }
  factory History.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory History.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  History clone() => History()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  History copyWith(void Function(History) updates) => super.copyWith((message) => updates(message as History)) as History; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static History create() => History._();
  History createEmptyInstance() => create();
  static $pb.PbList<History> createRepeated() => $pb.PbList<History>();
  @$core.pragma('dart2js:noInline')
  static History getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<History>(create);
  static History? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(4)
  Command get command => $_getN(1);
  @$pb.TagNumber(4)
  set command(Command v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasCommand() => $_has(1);
  @$pb.TagNumber(4)
  void clearCommand() => clearField(4);
  @$pb.TagNumber(4)
  Command ensureCommand() => $_ensure(1);

  @$pb.TagNumber(5)
  $core.bool get success => $_getBF(2);
  @$pb.TagNumber(5)
  set success($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(5)
  $core.bool hasSuccess() => $_has(2);
  @$pb.TagNumber(5)
  void clearSuccess() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get errorCode => $_getIZ(3);
  @$pb.TagNumber(6)
  set errorCode($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(6)
  $core.bool hasErrorCode() => $_has(3);
  @$pb.TagNumber(6)
  void clearErrorCode() => clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get commandExecutedTime => $_getI64(4);
  @$pb.TagNumber(7)
  set commandExecutedTime($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(7)
  $core.bool hasCommandExecutedTime() => $_has(4);
  @$pb.TagNumber(7)
  void clearCommandExecutedTime() => clearField(7);
}

class GetHistoryListResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetHistoryListResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'kachaka_api'), createEmptyInstance: create)
    ..aOM<Metadata>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'metadata', subBuilder: Metadata.create)
    ..pc<History>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'histories', $pb.PbFieldType.PM, subBuilder: History.create)
    ..hasRequiredFields = false
  ;

  GetHistoryListResponse._() : super();
  factory GetHistoryListResponse({
    Metadata? metadata,
    $core.Iterable<History>? histories,
  }) {
    final _result = create();
    if (metadata != null) {
      _result.metadata = metadata;
    }
    if (histories != null) {
      _result.histories.addAll(histories);
    }
    return _result;
  }
  factory GetHistoryListResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetHistoryListResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetHistoryListResponse clone() => GetHistoryListResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetHistoryListResponse copyWith(void Function(GetHistoryListResponse) updates) => super.copyWith((message) => updates(message as GetHistoryListResponse)) as GetHistoryListResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetHistoryListResponse create() => GetHistoryListResponse._();
  GetHistoryListResponse createEmptyInstance() => create();
  static $pb.PbList<GetHistoryListResponse> createRepeated() => $pb.PbList<GetHistoryListResponse>();
  @$core.pragma('dart2js:noInline')
  static GetHistoryListResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetHistoryListResponse>(create);
  static GetHistoryListResponse? _defaultInstance;

  @$pb.TagNumber(1)
  Metadata get metadata => $_getN(0);
  @$pb.TagNumber(1)
  set metadata(Metadata v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasMetadata() => $_has(0);
  @$pb.TagNumber(1)
  void clearMetadata() => clearField(1);
  @$pb.TagNumber(1)
  Metadata ensureMetadata() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<History> get histories => $_getList(1);
}

