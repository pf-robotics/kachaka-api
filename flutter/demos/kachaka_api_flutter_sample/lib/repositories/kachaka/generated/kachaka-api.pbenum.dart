///
//  Generated code. Do not modify.
//  source: kachaka-api.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class LocationType extends $pb.ProtobufEnum {
  static const LocationType LOCATION_TYPE_UNSPECIFIED = LocationType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'LOCATION_TYPE_UNSPECIFIED');
  static const LocationType LOCATION_TYPE_CHARGER = LocationType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'LOCATION_TYPE_CHARGER');
  static const LocationType LOCATION_TYPE_SHELF_HOME = LocationType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'LOCATION_TYPE_SHELF_HOME');

  static const $core.List<LocationType> values = <LocationType> [
    LOCATION_TYPE_UNSPECIFIED,
    LOCATION_TYPE_CHARGER,
    LOCATION_TYPE_SHELF_HOME,
  ];

  static final $core.Map<$core.int, LocationType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static LocationType? valueOf($core.int value) => _byValue[value];

  const LocationType._($core.int v, $core.String n) : super(v, n);
}

class ShelfAppearance extends $pb.ProtobufEnum {
  static const ShelfAppearance SHELF_APPEARANCE_UNSPECIFIED = ShelfAppearance._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SHELF_APPEARANCE_UNSPECIFIED');
  static const ShelfAppearance SHELF_APPEARANCE_DEFAULT_SHELF = ShelfAppearance._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SHELF_APPEARANCE_DEFAULT_SHELF');
  static const ShelfAppearance SHELF_APPEARANCE_KACHAKA_SHELF_3DRAWERS = ShelfAppearance._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SHELF_APPEARANCE_KACHAKA_SHELF_3DRAWERS');
  static const ShelfAppearance SHELF_APPEARANCE_KACHAKA_SHELF_2DRAWERS = ShelfAppearance._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SHELF_APPEARANCE_KACHAKA_SHELF_2DRAWERS');

  static const $core.List<ShelfAppearance> values = <ShelfAppearance> [
    SHELF_APPEARANCE_UNSPECIFIED,
    SHELF_APPEARANCE_DEFAULT_SHELF,
    SHELF_APPEARANCE_KACHAKA_SHELF_3DRAWERS,
    SHELF_APPEARANCE_KACHAKA_SHELF_2DRAWERS,
  ];

  static final $core.Map<$core.int, ShelfAppearance> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ShelfAppearance? valueOf($core.int value) => _byValue[value];

  const ShelfAppearance._($core.int v, $core.String n) : super(v, n);
}

class ShelfSpeedMode extends $pb.ProtobufEnum {
  static const ShelfSpeedMode SHELF_SPEED_MODE_UNSPECIFIED = ShelfSpeedMode._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SHELF_SPEED_MODE_UNSPECIFIED');
  static const ShelfSpeedMode SHELF_SPEED_MODE_LOW = ShelfSpeedMode._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SHELF_SPEED_MODE_LOW');
  static const ShelfSpeedMode SHELF_SPEED_MODE_NORMAL = ShelfSpeedMode._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SHELF_SPEED_MODE_NORMAL');

  static const $core.List<ShelfSpeedMode> values = <ShelfSpeedMode> [
    SHELF_SPEED_MODE_UNSPECIFIED,
    SHELF_SPEED_MODE_LOW,
    SHELF_SPEED_MODE_NORMAL,
  ];

  static final $core.Map<$core.int, ShelfSpeedMode> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ShelfSpeedMode? valueOf($core.int value) => _byValue[value];

  const ShelfSpeedMode._($core.int v, $core.String n) : super(v, n);
}

class ObjectLabel extends $pb.ProtobufEnum {
  static const ObjectLabel OBJECT_LABEL_UNSPECIFIED = ObjectLabel._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'OBJECT_LABEL_UNSPECIFIED');
  static const ObjectLabel OBJECT_LABEL_PERSON = ObjectLabel._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'OBJECT_LABEL_PERSON');
  static const ObjectLabel OBJECT_LABEL_SHELF = ObjectLabel._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'OBJECT_LABEL_SHELF');
  static const ObjectLabel OBJECT_LABEL_CHARGER = ObjectLabel._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'OBJECT_LABEL_CHARGER');
  static const ObjectLabel OBJECT_LABEL_DOOR = ObjectLabel._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'OBJECT_LABEL_DOOR');

  static const $core.List<ObjectLabel> values = <ObjectLabel> [
    OBJECT_LABEL_UNSPECIFIED,
    OBJECT_LABEL_PERSON,
    OBJECT_LABEL_SHELF,
    OBJECT_LABEL_CHARGER,
    OBJECT_LABEL_DOOR,
  ];

  static final $core.Map<$core.int, ObjectLabel> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ObjectLabel? valueOf($core.int value) => _byValue[value];

  const ObjectLabel._($core.int v, $core.String n) : super(v, n);
}

class CommandState extends $pb.ProtobufEnum {
  static const CommandState COMMAND_STATE_UNSPECIFIED = CommandState._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'COMMAND_STATE_UNSPECIFIED');
  static const CommandState COMMAND_STATE_PENDING = CommandState._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'COMMAND_STATE_PENDING');
  static const CommandState COMMAND_STATE_RUNNING = CommandState._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'COMMAND_STATE_RUNNING');

  static const $core.List<CommandState> values = <CommandState> [
    COMMAND_STATE_UNSPECIFIED,
    COMMAND_STATE_PENDING,
    COMMAND_STATE_RUNNING,
  ];

  static final $core.Map<$core.int, CommandState> _byValue = $pb.ProtobufEnum.initByValue(values);
  static CommandState? valueOf($core.int value) => _byValue[value];

  const CommandState._($core.int v, $core.String n) : super(v, n);
}

