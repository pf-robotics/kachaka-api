///
//  Generated code. Do not modify.
//  source: kachaka-api.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use locationTypeDescriptor instead')
const LocationType$json = const {
  '1': 'LocationType',
  '2': const [
    const {'1': 'LOCATION_TYPE_UNSPECIFIED', '2': 0},
    const {'1': 'LOCATION_TYPE_CHARGER', '2': 1},
    const {'1': 'LOCATION_TYPE_SHELF_HOME', '2': 2},
  ],
};

/// Descriptor for `LocationType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List locationTypeDescriptor = $convert.base64Decode('CgxMb2NhdGlvblR5cGUSHQoZTE9DQVRJT05fVFlQRV9VTlNQRUNJRklFRBAAEhkKFUxPQ0FUSU9OX1RZUEVfQ0hBUkdFUhABEhwKGExPQ0FUSU9OX1RZUEVfU0hFTEZfSE9NRRAC');
@$core.Deprecated('Use shelfAppearanceDescriptor instead')
const ShelfAppearance$json = const {
  '1': 'ShelfAppearance',
  '2': const [
    const {'1': 'SHELF_APPEARANCE_UNSPECIFIED', '2': 0},
    const {'1': 'SHELF_APPEARANCE_DEFAULT_SHELF', '2': 1},
    const {'1': 'SHELF_APPEARANCE_KACHAKA_SHELF_3DRAWERS', '2': 2},
    const {'1': 'SHELF_APPEARANCE_KACHAKA_SHELF_2DRAWERS', '2': 3},
  ],
};

/// Descriptor for `ShelfAppearance`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List shelfAppearanceDescriptor = $convert.base64Decode('Cg9TaGVsZkFwcGVhcmFuY2USIAocU0hFTEZfQVBQRUFSQU5DRV9VTlNQRUNJRklFRBAAEiIKHlNIRUxGX0FQUEVBUkFOQ0VfREVGQVVMVF9TSEVMRhABEisKJ1NIRUxGX0FQUEVBUkFOQ0VfS0FDSEFLQV9TSEVMRl8zRFJBV0VSUxACEisKJ1NIRUxGX0FQUEVBUkFOQ0VfS0FDSEFLQV9TSEVMRl8yRFJBV0VSUxAD');
@$core.Deprecated('Use shelfSpeedModeDescriptor instead')
const ShelfSpeedMode$json = const {
  '1': 'ShelfSpeedMode',
  '2': const [
    const {'1': 'SHELF_SPEED_MODE_UNSPECIFIED', '2': 0},
    const {'1': 'SHELF_SPEED_MODE_LOW', '2': 1},
    const {'1': 'SHELF_SPEED_MODE_NORMAL', '2': 2},
  ],
};

/// Descriptor for `ShelfSpeedMode`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List shelfSpeedModeDescriptor = $convert.base64Decode('Cg5TaGVsZlNwZWVkTW9kZRIgChxTSEVMRl9TUEVFRF9NT0RFX1VOU1BFQ0lGSUVEEAASGAoUU0hFTEZfU1BFRURfTU9ERV9MT1cQARIbChdTSEVMRl9TUEVFRF9NT0RFX05PUk1BTBAC');
@$core.Deprecated('Use objectLabelDescriptor instead')
const ObjectLabel$json = const {
  '1': 'ObjectLabel',
  '2': const [
    const {'1': 'OBJECT_LABEL_UNSPECIFIED', '2': 0},
    const {'1': 'OBJECT_LABEL_PERSON', '2': 1},
    const {'1': 'OBJECT_LABEL_SHELF', '2': 2},
    const {'1': 'OBJECT_LABEL_CHARGER', '2': 3},
    const {'1': 'OBJECT_LABEL_DOOR', '2': 4},
  ],
};

/// Descriptor for `ObjectLabel`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List objectLabelDescriptor = $convert.base64Decode('CgtPYmplY3RMYWJlbBIcChhPQkpFQ1RfTEFCRUxfVU5TUEVDSUZJRUQQABIXChNPQkpFQ1RfTEFCRUxfUEVSU09OEAESFgoST0JKRUNUX0xBQkVMX1NIRUxGEAISGAoUT0JKRUNUX0xBQkVMX0NIQVJHRVIQAxIVChFPQkpFQ1RfTEFCRUxfRE9PUhAE');
@$core.Deprecated('Use commandStateDescriptor instead')
const CommandState$json = const {
  '1': 'CommandState',
  '2': const [
    const {'1': 'COMMAND_STATE_UNSPECIFIED', '2': 0},
    const {'1': 'COMMAND_STATE_PENDING', '2': 1},
    const {'1': 'COMMAND_STATE_RUNNING', '2': 2},
  ],
};

/// Descriptor for `CommandState`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List commandStateDescriptor = $convert.base64Decode('CgxDb21tYW5kU3RhdGUSHQoZQ09NTUFORF9TVEFURV9VTlNQRUNJRklFRBAAEhkKFUNPTU1BTkRfU1RBVEVfUEVORElORxABEhkKFUNPTU1BTkRfU1RBVEVfUlVOTklORxAC');
@$core.Deprecated('Use metadataDescriptor instead')
const Metadata$json = const {
  '1': 'Metadata',
  '2': const [
    const {'1': 'cursor', '3': 1, '4': 1, '5': 16, '10': 'cursor'},
  ],
};

/// Descriptor for `Metadata`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List metadataDescriptor = $convert.base64Decode('CghNZXRhZGF0YRIWCgZjdXJzb3IYASABKBBSBmN1cnNvcg==');
@$core.Deprecated('Use resultDescriptor instead')
const Result$json = const {
  '1': 'Result',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    const {'1': 'error_code', '3': 3, '4': 1, '5': 5, '10': 'errorCode'},
  ],
};

/// Descriptor for `Result`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List resultDescriptor = $convert.base64Decode('CgZSZXN1bHQSGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2VzcxIdCgplcnJvcl9jb2RlGAMgASgFUgllcnJvckNvZGU=');
@$core.Deprecated('Use errorDescriptor instead')
const Error$json = const {
  '1': 'Error',
  '2': const [
    const {'1': 'error_code', '3': 2, '4': 1, '5': 5, '10': 'errorCode'},
  ],
};

/// Descriptor for `Error`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List errorDescriptor = $convert.base64Decode('CgVFcnJvchIdCgplcnJvcl9jb2RlGAIgASgFUgllcnJvckNvZGU=');
@$core.Deprecated('Use rosHeaderDescriptor instead')
const RosHeader$json = const {
  '1': 'RosHeader',
  '2': const [
    const {'1': 'stamp_nsec', '3': 1, '4': 1, '5': 3, '10': 'stampNsec'},
    const {'1': 'frame_id', '3': 2, '4': 1, '5': 9, '10': 'frameId'},
  ],
};

/// Descriptor for `RosHeader`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List rosHeaderDescriptor = $convert.base64Decode('CglSb3NIZWFkZXISHQoKc3RhbXBfbnNlYxgBIAEoA1IJc3RhbXBOc2VjEhkKCGZyYW1lX2lkGAIgASgJUgdmcmFtZUlk');
@$core.Deprecated('Use poseDescriptor instead')
const Pose$json = const {
  '1': 'Pose',
  '2': const [
    const {'1': 'x', '3': 1, '4': 1, '5': 1, '10': 'x'},
    const {'1': 'y', '3': 2, '4': 1, '5': 1, '10': 'y'},
    const {'1': 'theta', '3': 3, '4': 1, '5': 1, '10': 'theta'},
  ],
};

/// Descriptor for `Pose`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List poseDescriptor = $convert.base64Decode('CgRQb3NlEgwKAXgYASABKAFSAXgSDAoBeRgCIAEoAVIBeRIUCgV0aGV0YRgDIAEoAVIFdGhldGE=');
@$core.Deprecated('Use vector3Descriptor instead')
const Vector3$json = const {
  '1': 'Vector3',
  '2': const [
    const {'1': 'x', '3': 1, '4': 1, '5': 1, '10': 'x'},
    const {'1': 'y', '3': 2, '4': 1, '5': 1, '10': 'y'},
    const {'1': 'z', '3': 3, '4': 1, '5': 1, '10': 'z'},
  ],
};

/// Descriptor for `Vector3`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List vector3Descriptor = $convert.base64Decode('CgdWZWN0b3IzEgwKAXgYASABKAFSAXgSDAoBeRgCIAEoAVIBeRIMCgF6GAMgASgBUgF6');
@$core.Deprecated('Use quaternionDescriptor instead')
const Quaternion$json = const {
  '1': 'Quaternion',
  '2': const [
    const {'1': 'x', '3': 1, '4': 1, '5': 1, '10': 'x'},
    const {'1': 'y', '3': 2, '4': 1, '5': 1, '10': 'y'},
    const {'1': 'z', '3': 3, '4': 1, '5': 1, '10': 'z'},
    const {'1': 'w', '3': 4, '4': 1, '5': 1, '10': 'w'},
  ],
};

/// Descriptor for `Quaternion`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List quaternionDescriptor = $convert.base64Decode('CgpRdWF0ZXJuaW9uEgwKAXgYASABKAFSAXgSDAoBeRgCIAEoAVIBeRIMCgF6GAMgASgBUgF6EgwKAXcYBCABKAFSAXc=');
@$core.Deprecated('Use pose3dDescriptor instead')
const Pose3d$json = const {
  '1': 'Pose3d',
  '2': const [
    const {'1': 'position', '3': 1, '4': 1, '5': 11, '6': '.kachaka_api.Vector3', '10': 'position'},
    const {'1': 'orientation', '3': 2, '4': 1, '5': 11, '6': '.kachaka_api.Quaternion', '10': 'orientation'},
  ],
};

/// Descriptor for `Pose3d`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pose3dDescriptor = $convert.base64Decode('CgZQb3NlM2QSMAoIcG9zaXRpb24YASABKAsyFC5rYWNoYWthX2FwaS5WZWN0b3IzUghwb3NpdGlvbhI5CgtvcmllbnRhdGlvbhgCIAEoCzIXLmthY2hha2FfYXBpLlF1YXRlcm5pb25SC29yaWVudGF0aW9u');
@$core.Deprecated('Use twistDescriptor instead')
const Twist$json = const {
  '1': 'Twist',
  '2': const [
    const {'1': 'linear', '3': 1, '4': 1, '5': 11, '6': '.kachaka_api.Vector3', '10': 'linear'},
    const {'1': 'angular', '3': 2, '4': 1, '5': 11, '6': '.kachaka_api.Vector3', '10': 'angular'},
  ],
};

/// Descriptor for `Twist`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List twistDescriptor = $convert.base64Decode('CgVUd2lzdBIsCgZsaW5lYXIYASABKAsyFC5rYWNoYWthX2FwaS5WZWN0b3IzUgZsaW5lYXISLgoHYW5ndWxhchgCIAEoCzIULmthY2hha2FfYXBpLlZlY3RvcjNSB2FuZ3VsYXI=');
@$core.Deprecated('Use pose3dWithCovarianceDescriptor instead')
const Pose3dWithCovariance$json = const {
  '1': 'Pose3dWithCovariance',
  '2': const [
    const {'1': 'pose', '3': 1, '4': 1, '5': 11, '6': '.kachaka_api.Pose3d', '10': 'pose'},
    const {'1': 'covariance', '3': 2, '4': 3, '5': 1, '10': 'covariance'},
  ],
};

/// Descriptor for `Pose3dWithCovariance`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pose3dWithCovarianceDescriptor = $convert.base64Decode('ChRQb3NlM2RXaXRoQ292YXJpYW5jZRInCgRwb3NlGAEgASgLMhMua2FjaGFrYV9hcGkuUG9zZTNkUgRwb3NlEh4KCmNvdmFyaWFuY2UYAiADKAFSCmNvdmFyaWFuY2U=');
@$core.Deprecated('Use twistWithCovarianceDescriptor instead')
const TwistWithCovariance$json = const {
  '1': 'TwistWithCovariance',
  '2': const [
    const {'1': 'twist', '3': 1, '4': 1, '5': 11, '6': '.kachaka_api.Twist', '10': 'twist'},
    const {'1': 'covariance', '3': 2, '4': 3, '5': 1, '10': 'covariance'},
  ],
};

/// Descriptor for `TwistWithCovariance`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List twistWithCovarianceDescriptor = $convert.base64Decode('ChNUd2lzdFdpdGhDb3ZhcmlhbmNlEigKBXR3aXN0GAEgASgLMhIua2FjaGFrYV9hcGkuVHdpc3RSBXR3aXN0Eh4KCmNvdmFyaWFuY2UYAiADKAFSCmNvdmFyaWFuY2U=');
@$core.Deprecated('Use map_Descriptor instead')
const Map_$json = const {
  '1': 'Map',
  '2': const [
    const {'1': 'data', '3': 1, '4': 1, '5': 12, '10': 'data'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'resolution', '3': 3, '4': 1, '5': 1, '10': 'resolution'},
    const {'1': 'width', '3': 4, '4': 1, '5': 5, '10': 'width'},
    const {'1': 'height', '3': 5, '4': 1, '5': 5, '10': 'height'},
    const {'1': 'origin', '3': 6, '4': 1, '5': 11, '6': '.kachaka_api.Pose', '10': 'origin'},
  ],
};

/// Descriptor for `Map`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List map_Descriptor = $convert.base64Decode('CgNNYXASEgoEZGF0YRgBIAEoDFIEZGF0YRISCgRuYW1lGAIgASgJUgRuYW1lEh4KCnJlc29sdXRpb24YAyABKAFSCnJlc29sdXRpb24SFAoFd2lkdGgYBCABKAVSBXdpZHRoEhYKBmhlaWdodBgFIAEoBVIGaGVpZ2h0EikKBm9yaWdpbhgGIAEoCzIRLmthY2hha2FfYXBpLlBvc2VSBm9yaWdpbg==');
@$core.Deprecated('Use locationDescriptor instead')
const Location$json = const {
  '1': 'Location',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'pose', '3': 3, '4': 1, '5': 11, '6': '.kachaka_api.Pose', '10': 'pose'},
    const {'1': 'type', '3': 4, '4': 1, '5': 14, '6': '.kachaka_api.LocationType', '10': 'type'},
    const {'1': 'undock_shelf_aligning_to_wall', '3': 5, '4': 1, '5': 8, '10': 'undockShelfAligningToWall'},
    const {'1': 'undock_shelf_avoiding_obstacles', '3': 6, '4': 1, '5': 8, '10': 'undockShelfAvoidingObstacles'},
    const {'1': 'ignore_voice_recognition', '3': 7, '4': 1, '5': 8, '10': 'ignoreVoiceRecognition'},
  ],
};

/// Descriptor for `Location`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List locationDescriptor = $convert.base64Decode('CghMb2NhdGlvbhIOCgJpZBgBIAEoCVICaWQSEgoEbmFtZRgCIAEoCVIEbmFtZRIlCgRwb3NlGAMgASgLMhEua2FjaGFrYV9hcGkuUG9zZVIEcG9zZRItCgR0eXBlGAQgASgOMhkua2FjaGFrYV9hcGkuTG9jYXRpb25UeXBlUgR0eXBlEkAKHXVuZG9ja19zaGVsZl9hbGlnbmluZ190b193YWxsGAUgASgIUhl1bmRvY2tTaGVsZkFsaWduaW5nVG9XYWxsEkUKH3VuZG9ja19zaGVsZl9hdm9pZGluZ19vYnN0YWNsZXMYBiABKAhSHHVuZG9ja1NoZWxmQXZvaWRpbmdPYnN0YWNsZXMSOAoYaWdub3JlX3ZvaWNlX3JlY29nbml0aW9uGAcgASgIUhZpZ25vcmVWb2ljZVJlY29nbml0aW9u');
@$core.Deprecated('Use shelfSizeDescriptor instead')
const ShelfSize$json = const {
  '1': 'ShelfSize',
  '2': const [
    const {'1': 'width', '3': 1, '4': 1, '5': 1, '10': 'width'},
    const {'1': 'depth', '3': 2, '4': 1, '5': 1, '10': 'depth'},
    const {'1': 'height', '3': 3, '4': 1, '5': 1, '10': 'height'},
  ],
};

/// Descriptor for `ShelfSize`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List shelfSizeDescriptor = $convert.base64Decode('CglTaGVsZlNpemUSFAoFd2lkdGgYASABKAFSBXdpZHRoEhQKBWRlcHRoGAIgASgBUgVkZXB0aBIWCgZoZWlnaHQYAyABKAFSBmhlaWdodA==');
@$core.Deprecated('Use recognizableNameDescriptor instead')
const RecognizableName$json = const {
  '1': 'RecognizableName',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'deletable', '3': 2, '4': 1, '5': 8, '10': 'deletable'},
  ],
};

/// Descriptor for `RecognizableName`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List recognizableNameDescriptor = $convert.base64Decode('ChBSZWNvZ25pemFibGVOYW1lEhIKBG5hbWUYASABKAlSBG5hbWUSHAoJZGVsZXRhYmxlGAIgASgIUglkZWxldGFibGU=');
@$core.Deprecated('Use shelfDescriptor instead')
const Shelf$json = const {
  '1': 'Shelf',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'pose', '3': 3, '4': 1, '5': 11, '6': '.kachaka_api.Pose', '10': 'pose'},
    const {'1': 'size', '3': 4, '4': 1, '5': 11, '6': '.kachaka_api.ShelfSize', '10': 'size'},
    const {'1': 'appearance', '3': 5, '4': 1, '5': 14, '6': '.kachaka_api.ShelfAppearance', '10': 'appearance'},
    const {'1': 'recognizable_names', '3': 7, '4': 3, '5': 11, '6': '.kachaka_api.RecognizableName', '10': 'recognizableNames'},
    const {'1': 'home_location_id', '3': 8, '4': 1, '5': 9, '10': 'homeLocationId'},
    const {'1': 'speed_mode', '3': 9, '4': 1, '5': 14, '6': '.kachaka_api.ShelfSpeedMode', '10': 'speedMode'},
    const {'1': 'ignore_voice_recognition', '3': 10, '4': 1, '5': 8, '10': 'ignoreVoiceRecognition'},
  ],
};

/// Descriptor for `Shelf`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List shelfDescriptor = $convert.base64Decode('CgVTaGVsZhIOCgJpZBgBIAEoCVICaWQSEgoEbmFtZRgCIAEoCVIEbmFtZRIlCgRwb3NlGAMgASgLMhEua2FjaGFrYV9hcGkuUG9zZVIEcG9zZRIqCgRzaXplGAQgASgLMhYua2FjaGFrYV9hcGkuU2hlbGZTaXplUgRzaXplEjwKCmFwcGVhcmFuY2UYBSABKA4yHC5rYWNoYWthX2FwaS5TaGVsZkFwcGVhcmFuY2VSCmFwcGVhcmFuY2USTAoScmVjb2duaXphYmxlX25hbWVzGAcgAygLMh0ua2FjaGFrYV9hcGkuUmVjb2duaXphYmxlTmFtZVIRcmVjb2duaXphYmxlTmFtZXMSKAoQaG9tZV9sb2NhdGlvbl9pZBgIIAEoCVIOaG9tZUxvY2F0aW9uSWQSOgoKc3BlZWRfbW9kZRgJIAEoDjIbLmthY2hha2FfYXBpLlNoZWxmU3BlZWRNb2RlUglzcGVlZE1vZGUSOAoYaWdub3JlX3ZvaWNlX3JlY29nbml0aW9uGAogASgIUhZpZ25vcmVWb2ljZVJlY29nbml0aW9u');
@$core.Deprecated('Use rosImuDescriptor instead')
const RosImu$json = const {
  '1': 'RosImu',
  '2': const [
    const {'1': 'header', '3': 1, '4': 1, '5': 11, '6': '.kachaka_api.RosHeader', '10': 'header'},
    const {'1': 'orientation', '3': 2, '4': 1, '5': 11, '6': '.kachaka_api.Quaternion', '10': 'orientation'},
    const {'1': 'orientation_covariance', '3': 3, '4': 3, '5': 1, '10': 'orientationCovariance'},
    const {'1': 'angular_velocity', '3': 4, '4': 1, '5': 11, '6': '.kachaka_api.Vector3', '10': 'angularVelocity'},
    const {'1': 'angular_velocity_covariance', '3': 5, '4': 3, '5': 1, '10': 'angularVelocityCovariance'},
    const {'1': 'linear_acceleration', '3': 6, '4': 1, '5': 11, '6': '.kachaka_api.Vector3', '10': 'linearAcceleration'},
    const {'1': 'linear_acceleration_covariance', '3': 7, '4': 3, '5': 1, '10': 'linearAccelerationCovariance'},
  ],
};

/// Descriptor for `RosImu`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List rosImuDescriptor = $convert.base64Decode('CgZSb3NJbXUSLgoGaGVhZGVyGAEgASgLMhYua2FjaGFrYV9hcGkuUm9zSGVhZGVyUgZoZWFkZXISOQoLb3JpZW50YXRpb24YAiABKAsyFy5rYWNoYWthX2FwaS5RdWF0ZXJuaW9uUgtvcmllbnRhdGlvbhI1ChZvcmllbnRhdGlvbl9jb3ZhcmlhbmNlGAMgAygBUhVvcmllbnRhdGlvbkNvdmFyaWFuY2USPwoQYW5ndWxhcl92ZWxvY2l0eRgEIAEoCzIULmthY2hha2FfYXBpLlZlY3RvcjNSD2FuZ3VsYXJWZWxvY2l0eRI+Chthbmd1bGFyX3ZlbG9jaXR5X2NvdmFyaWFuY2UYBSADKAFSGWFuZ3VsYXJWZWxvY2l0eUNvdmFyaWFuY2USRQoTbGluZWFyX2FjY2VsZXJhdGlvbhgGIAEoCzIULmthY2hha2FfYXBpLlZlY3RvcjNSEmxpbmVhckFjY2VsZXJhdGlvbhJECh5saW5lYXJfYWNjZWxlcmF0aW9uX2NvdmFyaWFuY2UYByADKAFSHGxpbmVhckFjY2VsZXJhdGlvbkNvdmFyaWFuY2U=');
@$core.Deprecated('Use rosOdometryDescriptor instead')
const RosOdometry$json = const {
  '1': 'RosOdometry',
  '2': const [
    const {'1': 'header', '3': 1, '4': 1, '5': 11, '6': '.kachaka_api.RosHeader', '10': 'header'},
    const {'1': 'child_frame_id', '3': 2, '4': 1, '5': 9, '10': 'childFrameId'},
    const {'1': 'pose', '3': 3, '4': 1, '5': 11, '6': '.kachaka_api.Pose3dWithCovariance', '10': 'pose'},
    const {'1': 'twist', '3': 4, '4': 1, '5': 11, '6': '.kachaka_api.TwistWithCovariance', '10': 'twist'},
  ],
};

/// Descriptor for `RosOdometry`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List rosOdometryDescriptor = $convert.base64Decode('CgtSb3NPZG9tZXRyeRIuCgZoZWFkZXIYASABKAsyFi5rYWNoYWthX2FwaS5Sb3NIZWFkZXJSBmhlYWRlchIkCg5jaGlsZF9mcmFtZV9pZBgCIAEoCVIMY2hpbGRGcmFtZUlkEjUKBHBvc2UYAyABKAsyIS5rYWNoYWthX2FwaS5Qb3NlM2RXaXRoQ292YXJpYW5jZVIEcG9zZRI2CgV0d2lzdBgEIAEoCzIgLmthY2hha2FfYXBpLlR3aXN0V2l0aENvdmFyaWFuY2VSBXR3aXN0');
@$core.Deprecated('Use rosLaserScanDescriptor instead')
const RosLaserScan$json = const {
  '1': 'RosLaserScan',
  '2': const [
    const {'1': 'header', '3': 1, '4': 1, '5': 11, '6': '.kachaka_api.RosHeader', '10': 'header'},
    const {'1': 'angle_min', '3': 2, '4': 1, '5': 1, '10': 'angleMin'},
    const {'1': 'angle_max', '3': 3, '4': 1, '5': 1, '10': 'angleMax'},
    const {'1': 'angle_increment', '3': 4, '4': 1, '5': 1, '10': 'angleIncrement'},
    const {'1': 'time_increment', '3': 5, '4': 1, '5': 1, '10': 'timeIncrement'},
    const {'1': 'scan_time', '3': 6, '4': 1, '5': 1, '10': 'scanTime'},
    const {'1': 'range_min', '3': 7, '4': 1, '5': 1, '10': 'rangeMin'},
    const {'1': 'range_max', '3': 8, '4': 1, '5': 1, '10': 'rangeMax'},
    const {'1': 'ranges', '3': 9, '4': 3, '5': 1, '10': 'ranges'},
    const {'1': 'intensities', '3': 10, '4': 3, '5': 1, '10': 'intensities'},
  ],
};

/// Descriptor for `RosLaserScan`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List rosLaserScanDescriptor = $convert.base64Decode('CgxSb3NMYXNlclNjYW4SLgoGaGVhZGVyGAEgASgLMhYua2FjaGFrYV9hcGkuUm9zSGVhZGVyUgZoZWFkZXISGwoJYW5nbGVfbWluGAIgASgBUghhbmdsZU1pbhIbCglhbmdsZV9tYXgYAyABKAFSCGFuZ2xlTWF4EicKD2FuZ2xlX2luY3JlbWVudBgEIAEoAVIOYW5nbGVJbmNyZW1lbnQSJQoOdGltZV9pbmNyZW1lbnQYBSABKAFSDXRpbWVJbmNyZW1lbnQSGwoJc2Nhbl90aW1lGAYgASgBUghzY2FuVGltZRIbCglyYW5nZV9taW4YByABKAFSCHJhbmdlTWluEhsKCXJhbmdlX21heBgIIAEoAVIIcmFuZ2VNYXgSFgoGcmFuZ2VzGAkgAygBUgZyYW5nZXMSIAoLaW50ZW5zaXRpZXMYCiADKAFSC2ludGVuc2l0aWVz');
@$core.Deprecated('Use regionOfInterestDescriptor instead')
const RegionOfInterest$json = const {
  '1': 'RegionOfInterest',
  '2': const [
    const {'1': 'x_offset', '3': 1, '4': 1, '5': 13, '10': 'xOffset'},
    const {'1': 'y_offset', '3': 2, '4': 1, '5': 13, '10': 'yOffset'},
    const {'1': 'height', '3': 3, '4': 1, '5': 13, '10': 'height'},
    const {'1': 'width', '3': 4, '4': 1, '5': 13, '10': 'width'},
    const {'1': 'do_rectify', '3': 5, '4': 1, '5': 8, '10': 'doRectify'},
  ],
};

/// Descriptor for `RegionOfInterest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List regionOfInterestDescriptor = $convert.base64Decode('ChBSZWdpb25PZkludGVyZXN0EhkKCHhfb2Zmc2V0GAEgASgNUgd4T2Zmc2V0EhkKCHlfb2Zmc2V0GAIgASgNUgd5T2Zmc2V0EhYKBmhlaWdodBgDIAEoDVIGaGVpZ2h0EhQKBXdpZHRoGAQgASgNUgV3aWR0aBIdCgpkb19yZWN0aWZ5GAUgASgIUglkb1JlY3RpZnk=');
@$core.Deprecated('Use rosCameraInfoDescriptor instead')
const RosCameraInfo$json = const {
  '1': 'RosCameraInfo',
  '2': const [
    const {'1': 'header', '3': 1, '4': 1, '5': 11, '6': '.kachaka_api.RosHeader', '10': 'header'},
    const {'1': 'height', '3': 2, '4': 1, '5': 13, '10': 'height'},
    const {'1': 'width', '3': 3, '4': 1, '5': 13, '10': 'width'},
    const {'1': 'distortion_model', '3': 4, '4': 1, '5': 9, '10': 'distortionModel'},
    const {'1': 'D', '3': 5, '4': 3, '5': 1, '10': 'D'},
    const {'1': 'K', '3': 6, '4': 3, '5': 1, '10': 'K'},
    const {'1': 'R', '3': 7, '4': 3, '5': 1, '10': 'R'},
    const {'1': 'P', '3': 8, '4': 3, '5': 1, '10': 'P'},
    const {'1': 'binning_x', '3': 9, '4': 1, '5': 13, '10': 'binningX'},
    const {'1': 'binning_y', '3': 10, '4': 1, '5': 13, '10': 'binningY'},
    const {'1': 'roi', '3': 11, '4': 1, '5': 11, '6': '.kachaka_api.RegionOfInterest', '10': 'roi'},
  ],
};

/// Descriptor for `RosCameraInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List rosCameraInfoDescriptor = $convert.base64Decode('Cg1Sb3NDYW1lcmFJbmZvEi4KBmhlYWRlchgBIAEoCzIWLmthY2hha2FfYXBpLlJvc0hlYWRlclIGaGVhZGVyEhYKBmhlaWdodBgCIAEoDVIGaGVpZ2h0EhQKBXdpZHRoGAMgASgNUgV3aWR0aBIpChBkaXN0b3J0aW9uX21vZGVsGAQgASgJUg9kaXN0b3J0aW9uTW9kZWwSDAoBRBgFIAMoAVIBRBIMCgFLGAYgAygBUgFLEgwKAVIYByADKAFSAVISDAoBUBgIIAMoAVIBUBIbCgliaW5uaW5nX3gYCSABKA1SCGJpbm5pbmdYEhsKCWJpbm5pbmdfeRgKIAEoDVIIYmlubmluZ1kSLwoDcm9pGAsgASgLMh0ua2FjaGFrYV9hcGkuUmVnaW9uT2ZJbnRlcmVzdFIDcm9p');
@$core.Deprecated('Use rosImageDescriptor instead')
const RosImage$json = const {
  '1': 'RosImage',
  '2': const [
    const {'1': 'header', '3': 1, '4': 1, '5': 11, '6': '.kachaka_api.RosHeader', '10': 'header'},
    const {'1': 'height', '3': 2, '4': 1, '5': 13, '10': 'height'},
    const {'1': 'width', '3': 3, '4': 1, '5': 13, '10': 'width'},
    const {'1': 'encoding', '3': 4, '4': 1, '5': 9, '10': 'encoding'},
    const {'1': 'is_bigendian', '3': 5, '4': 1, '5': 8, '10': 'isBigendian'},
    const {'1': 'step', '3': 6, '4': 1, '5': 13, '10': 'step'},
    const {'1': 'data', '3': 7, '4': 1, '5': 12, '10': 'data'},
  ],
};

/// Descriptor for `RosImage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List rosImageDescriptor = $convert.base64Decode('CghSb3NJbWFnZRIuCgZoZWFkZXIYASABKAsyFi5rYWNoYWthX2FwaS5Sb3NIZWFkZXJSBmhlYWRlchIWCgZoZWlnaHQYAiABKA1SBmhlaWdodBIUCgV3aWR0aBgDIAEoDVIFd2lkdGgSGgoIZW5jb2RpbmcYBCABKAlSCGVuY29kaW5nEiEKDGlzX2JpZ2VuZGlhbhgFIAEoCFILaXNCaWdlbmRpYW4SEgoEc3RlcBgGIAEoDVIEc3RlcBISCgRkYXRhGAcgASgMUgRkYXRh');
@$core.Deprecated('Use rosTransformStampedDescriptor instead')
const RosTransformStamped$json = const {
  '1': 'RosTransformStamped',
  '2': const [
    const {'1': 'header', '3': 1, '4': 1, '5': 11, '6': '.kachaka_api.RosHeader', '10': 'header'},
    const {'1': 'child_frame_id', '3': 2, '4': 1, '5': 9, '10': 'childFrameId'},
    const {'1': 'translation', '3': 3, '4': 1, '5': 11, '6': '.kachaka_api.Vector3', '10': 'translation'},
    const {'1': 'rotation', '3': 4, '4': 1, '5': 11, '6': '.kachaka_api.Quaternion', '10': 'rotation'},
  ],
};

/// Descriptor for `RosTransformStamped`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List rosTransformStampedDescriptor = $convert.base64Decode('ChNSb3NUcmFuc2Zvcm1TdGFtcGVkEi4KBmhlYWRlchgBIAEoCzIWLmthY2hha2FfYXBpLlJvc0hlYWRlclIGaGVhZGVyEiQKDmNoaWxkX2ZyYW1lX2lkGAIgASgJUgxjaGlsZEZyYW1lSWQSNgoLdHJhbnNsYXRpb24YAyABKAsyFC5rYWNoYWthX2FwaS5WZWN0b3IzUgt0cmFuc2xhdGlvbhIzCghyb3RhdGlvbhgEIAEoCzIXLmthY2hha2FfYXBpLlF1YXRlcm5pb25SCHJvdGF0aW9u');
@$core.Deprecated('Use rosCompressedImageDescriptor instead')
const RosCompressedImage$json = const {
  '1': 'RosCompressedImage',
  '2': const [
    const {'1': 'header', '3': 1, '4': 1, '5': 11, '6': '.kachaka_api.RosHeader', '10': 'header'},
    const {'1': 'format', '3': 2, '4': 1, '5': 9, '10': 'format'},
    const {'1': 'data', '3': 3, '4': 1, '5': 12, '10': 'data'},
  ],
};

/// Descriptor for `RosCompressedImage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List rosCompressedImageDescriptor = $convert.base64Decode('ChJSb3NDb21wcmVzc2VkSW1hZ2USLgoGaGVhZGVyGAEgASgLMhYua2FjaGFrYV9hcGkuUm9zSGVhZGVyUgZoZWFkZXISFgoGZm9ybWF0GAIgASgJUgZmb3JtYXQSEgoEZGF0YRgDIAEoDFIEZGF0YQ==');
@$core.Deprecated('Use objectDetectionDescriptor instead')
const ObjectDetection$json = const {
  '1': 'ObjectDetection',
  '2': const [
    const {'1': 'label', '3': 1, '4': 1, '5': 13, '10': 'label'},
    const {'1': 'roi', '3': 2, '4': 1, '5': 11, '6': '.kachaka_api.RegionOfInterest', '10': 'roi'},
    const {'1': 'score', '3': 3, '4': 1, '5': 2, '10': 'score'},
    const {'1': 'distance_median', '3': 4, '4': 1, '5': 1, '10': 'distanceMedian'},
  ],
};

/// Descriptor for `ObjectDetection`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List objectDetectionDescriptor = $convert.base64Decode('Cg9PYmplY3REZXRlY3Rpb24SFAoFbGFiZWwYASABKA1SBWxhYmVsEi8KA3JvaRgCIAEoCzIdLmthY2hha2FfYXBpLlJlZ2lvbk9mSW50ZXJlc3RSA3JvaRIUCgVzY29yZRgDIAEoAlIFc2NvcmUSJwoPZGlzdGFuY2VfbWVkaWFuGAQgASgBUg5kaXN0YW5jZU1lZGlhbg==');
@$core.Deprecated('Use commandDescriptor instead')
const Command$json = const {
  '1': 'Command',
  '2': const [
    const {'1': 'move_shelf_command', '3': 1, '4': 1, '5': 11, '6': '.kachaka_api.MoveShelfCommand', '9': 0, '10': 'moveShelfCommand'},
    const {'1': 'return_shelf_command', '3': 2, '4': 1, '5': 11, '6': '.kachaka_api.ReturnShelfCommand', '9': 0, '10': 'returnShelfCommand'},
    const {'1': 'undock_shelf_command', '3': 5, '4': 1, '5': 11, '6': '.kachaka_api.UndockShelfCommand', '9': 0, '10': 'undockShelfCommand'},
    const {'1': 'move_to_location_command', '3': 7, '4': 1, '5': 11, '6': '.kachaka_api.MoveToLocationCommand', '9': 0, '10': 'moveToLocationCommand'},
    const {'1': 'return_home_command', '3': 8, '4': 1, '5': 11, '6': '.kachaka_api.ReturnHomeCommand', '9': 0, '10': 'returnHomeCommand'},
    const {'1': 'dock_shelf_command', '3': 9, '4': 1, '5': 11, '6': '.kachaka_api.DockShelfCommand', '9': 0, '10': 'dockShelfCommand'},
    const {'1': 'speak_command', '3': 12, '4': 1, '5': 11, '6': '.kachaka_api.SpeakCommand', '9': 0, '10': 'speakCommand'},
    const {'1': 'move_to_pose_command', '3': 13, '4': 1, '5': 11, '6': '.kachaka_api.MoveToPoseCommand', '9': 0, '10': 'moveToPoseCommand'},
  ],
  '8': const [
    const {'1': 'command'},
  ],
};

/// Descriptor for `Command`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List commandDescriptor = $convert.base64Decode('CgdDb21tYW5kEk0KEm1vdmVfc2hlbGZfY29tbWFuZBgBIAEoCzIdLmthY2hha2FfYXBpLk1vdmVTaGVsZkNvbW1hbmRIAFIQbW92ZVNoZWxmQ29tbWFuZBJTChRyZXR1cm5fc2hlbGZfY29tbWFuZBgCIAEoCzIfLmthY2hha2FfYXBpLlJldHVyblNoZWxmQ29tbWFuZEgAUhJyZXR1cm5TaGVsZkNvbW1hbmQSUwoUdW5kb2NrX3NoZWxmX2NvbW1hbmQYBSABKAsyHy5rYWNoYWthX2FwaS5VbmRvY2tTaGVsZkNvbW1hbmRIAFISdW5kb2NrU2hlbGZDb21tYW5kEl0KGG1vdmVfdG9fbG9jYXRpb25fY29tbWFuZBgHIAEoCzIiLmthY2hha2FfYXBpLk1vdmVUb0xvY2F0aW9uQ29tbWFuZEgAUhVtb3ZlVG9Mb2NhdGlvbkNvbW1hbmQSUAoTcmV0dXJuX2hvbWVfY29tbWFuZBgIIAEoCzIeLmthY2hha2FfYXBpLlJldHVybkhvbWVDb21tYW5kSABSEXJldHVybkhvbWVDb21tYW5kEk0KEmRvY2tfc2hlbGZfY29tbWFuZBgJIAEoCzIdLmthY2hha2FfYXBpLkRvY2tTaGVsZkNvbW1hbmRIAFIQZG9ja1NoZWxmQ29tbWFuZBJACg1zcGVha19jb21tYW5kGAwgASgLMhkua2FjaGFrYV9hcGkuU3BlYWtDb21tYW5kSABSDHNwZWFrQ29tbWFuZBJRChRtb3ZlX3RvX3Bvc2VfY29tbWFuZBgNIAEoCzIeLmthY2hha2FfYXBpLk1vdmVUb1Bvc2VDb21tYW5kSABSEW1vdmVUb1Bvc2VDb21tYW5kQgkKB2NvbW1hbmQ=');
@$core.Deprecated('Use moveShelfCommandDescriptor instead')
const MoveShelfCommand$json = const {
  '1': 'MoveShelfCommand',
  '2': const [
    const {'1': 'target_shelf_id', '3': 1, '4': 1, '5': 9, '10': 'targetShelfId'},
    const {'1': 'destination_location_id', '3': 2, '4': 1, '5': 9, '10': 'destinationLocationId'},
  ],
};

/// Descriptor for `MoveShelfCommand`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List moveShelfCommandDescriptor = $convert.base64Decode('ChBNb3ZlU2hlbGZDb21tYW5kEiYKD3RhcmdldF9zaGVsZl9pZBgBIAEoCVINdGFyZ2V0U2hlbGZJZBI2ChdkZXN0aW5hdGlvbl9sb2NhdGlvbl9pZBgCIAEoCVIVZGVzdGluYXRpb25Mb2NhdGlvbklk');
@$core.Deprecated('Use returnShelfCommandDescriptor instead')
const ReturnShelfCommand$json = const {
  '1': 'ReturnShelfCommand',
  '2': const [
    const {'1': 'target_shelf_id', '3': 1, '4': 1, '5': 9, '10': 'targetShelfId'},
  ],
};

/// Descriptor for `ReturnShelfCommand`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List returnShelfCommandDescriptor = $convert.base64Decode('ChJSZXR1cm5TaGVsZkNvbW1hbmQSJgoPdGFyZ2V0X3NoZWxmX2lkGAEgASgJUg10YXJnZXRTaGVsZklk');
@$core.Deprecated('Use undockShelfCommandDescriptor instead')
const UndockShelfCommand$json = const {
  '1': 'UndockShelfCommand',
  '2': const [
    const {'1': 'target_shelf_id', '3': 1, '4': 1, '5': 9, '10': 'targetShelfId'},
  ],
};

/// Descriptor for `UndockShelfCommand`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List undockShelfCommandDescriptor = $convert.base64Decode('ChJVbmRvY2tTaGVsZkNvbW1hbmQSJgoPdGFyZ2V0X3NoZWxmX2lkGAEgASgJUg10YXJnZXRTaGVsZklk');
@$core.Deprecated('Use moveToLocationCommandDescriptor instead')
const MoveToLocationCommand$json = const {
  '1': 'MoveToLocationCommand',
  '2': const [
    const {'1': 'target_location_id', '3': 1, '4': 1, '5': 9, '10': 'targetLocationId'},
  ],
};

/// Descriptor for `MoveToLocationCommand`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List moveToLocationCommandDescriptor = $convert.base64Decode('ChVNb3ZlVG9Mb2NhdGlvbkNvbW1hbmQSLAoSdGFyZ2V0X2xvY2F0aW9uX2lkGAEgASgJUhB0YXJnZXRMb2NhdGlvbklk');
@$core.Deprecated('Use returnHomeCommandDescriptor instead')
const ReturnHomeCommand$json = const {
  '1': 'ReturnHomeCommand',
};

/// Descriptor for `ReturnHomeCommand`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List returnHomeCommandDescriptor = $convert.base64Decode('ChFSZXR1cm5Ib21lQ29tbWFuZA==');
@$core.Deprecated('Use dockShelfCommandDescriptor instead')
const DockShelfCommand$json = const {
  '1': 'DockShelfCommand',
};

/// Descriptor for `DockShelfCommand`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dockShelfCommandDescriptor = $convert.base64Decode('ChBEb2NrU2hlbGZDb21tYW5k');
@$core.Deprecated('Use speakCommandDescriptor instead')
const SpeakCommand$json = const {
  '1': 'SpeakCommand',
  '2': const [
    const {'1': 'text', '3': 1, '4': 1, '5': 9, '10': 'text'},
  ],
};

/// Descriptor for `SpeakCommand`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List speakCommandDescriptor = $convert.base64Decode('CgxTcGVha0NvbW1hbmQSEgoEdGV4dBgBIAEoCVIEdGV4dA==');
@$core.Deprecated('Use moveToPoseCommandDescriptor instead')
const MoveToPoseCommand$json = const {
  '1': 'MoveToPoseCommand',
  '2': const [
    const {'1': 'x', '3': 1, '4': 1, '5': 1, '10': 'x'},
    const {'1': 'y', '3': 2, '4': 1, '5': 1, '10': 'y'},
    const {'1': 'yaw', '3': 3, '4': 1, '5': 1, '10': 'yaw'},
  ],
};

/// Descriptor for `MoveToPoseCommand`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List moveToPoseCommandDescriptor = $convert.base64Decode('ChFNb3ZlVG9Qb3NlQ29tbWFuZBIMCgF4GAEgASgBUgF4EgwKAXkYAiABKAFSAXkSEAoDeWF3GAMgASgBUgN5YXc=');
@$core.Deprecated('Use emptyRequestDescriptor instead')
const EmptyRequest$json = const {
  '1': 'EmptyRequest',
};

/// Descriptor for `EmptyRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List emptyRequestDescriptor = $convert.base64Decode('CgxFbXB0eVJlcXVlc3Q=');
@$core.Deprecated('Use getRequestDescriptor instead')
const GetRequest$json = const {
  '1': 'GetRequest',
  '2': const [
    const {'1': 'metadata', '3': 1, '4': 1, '5': 11, '6': '.kachaka_api.Metadata', '10': 'metadata'},
  ],
};

/// Descriptor for `GetRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getRequestDescriptor = $convert.base64Decode('CgpHZXRSZXF1ZXN0EjEKCG1ldGFkYXRhGAEgASgLMhUua2FjaGFrYV9hcGkuTWV0YWRhdGFSCG1ldGFkYXRh');
@$core.Deprecated('Use getRobotSerialNumberResponseDescriptor instead')
const GetRobotSerialNumberResponse$json = const {
  '1': 'GetRobotSerialNumberResponse',
  '2': const [
    const {'1': 'metadata', '3': 1, '4': 1, '5': 11, '6': '.kachaka_api.Metadata', '10': 'metadata'},
    const {'1': 'serial_number', '3': 2, '4': 1, '5': 9, '10': 'serialNumber'},
  ],
};

/// Descriptor for `GetRobotSerialNumberResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getRobotSerialNumberResponseDescriptor = $convert.base64Decode('ChxHZXRSb2JvdFNlcmlhbE51bWJlclJlc3BvbnNlEjEKCG1ldGFkYXRhGAEgASgLMhUua2FjaGFrYV9hcGkuTWV0YWRhdGFSCG1ldGFkYXRhEiMKDXNlcmlhbF9udW1iZXIYAiABKAlSDHNlcmlhbE51bWJlcg==');
@$core.Deprecated('Use getRobotVersionResponseDescriptor instead')
const GetRobotVersionResponse$json = const {
  '1': 'GetRobotVersionResponse',
  '2': const [
    const {'1': 'metadata', '3': 1, '4': 1, '5': 11, '6': '.kachaka_api.Metadata', '10': 'metadata'},
    const {'1': 'version', '3': 2, '4': 1, '5': 9, '10': 'version'},
  ],
};

/// Descriptor for `GetRobotVersionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getRobotVersionResponseDescriptor = $convert.base64Decode('ChdHZXRSb2JvdFZlcnNpb25SZXNwb25zZRIxCghtZXRhZGF0YRgBIAEoCzIVLmthY2hha2FfYXBpLk1ldGFkYXRhUghtZXRhZGF0YRIYCgd2ZXJzaW9uGAIgASgJUgd2ZXJzaW9u');
@$core.Deprecated('Use getRobotPoseResponseDescriptor instead')
const GetRobotPoseResponse$json = const {
  '1': 'GetRobotPoseResponse',
  '2': const [
    const {'1': 'metadata', '3': 1, '4': 1, '5': 11, '6': '.kachaka_api.Metadata', '10': 'metadata'},
    const {'1': 'pose', '3': 2, '4': 1, '5': 11, '6': '.kachaka_api.Pose', '10': 'pose'},
  ],
};

/// Descriptor for `GetRobotPoseResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getRobotPoseResponseDescriptor = $convert.base64Decode('ChRHZXRSb2JvdFBvc2VSZXNwb25zZRIxCghtZXRhZGF0YRgBIAEoCzIVLmthY2hha2FfYXBpLk1ldGFkYXRhUghtZXRhZGF0YRIlCgRwb3NlGAIgASgLMhEua2FjaGFrYV9hcGkuUG9zZVIEcG9zZQ==');
@$core.Deprecated('Use getPngMapResponseDescriptor instead')
const GetPngMapResponse$json = const {
  '1': 'GetPngMapResponse',
  '2': const [
    const {'1': 'metadata', '3': 1, '4': 1, '5': 11, '6': '.kachaka_api.Metadata', '10': 'metadata'},
    const {'1': 'map', '3': 2, '4': 1, '5': 11, '6': '.kachaka_api.Map', '10': 'map'},
  ],
};

/// Descriptor for `GetPngMapResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getPngMapResponseDescriptor = $convert.base64Decode('ChFHZXRQbmdNYXBSZXNwb25zZRIxCghtZXRhZGF0YRgBIAEoCzIVLmthY2hha2FfYXBpLk1ldGFkYXRhUghtZXRhZGF0YRIiCgNtYXAYAiABKAsyEC5rYWNoYWthX2FwaS5NYXBSA21hcA==');
@$core.Deprecated('Use getObjectDetectionResponseDescriptor instead')
const GetObjectDetectionResponse$json = const {
  '1': 'GetObjectDetectionResponse',
  '2': const [
    const {'1': 'metadata', '3': 1, '4': 1, '5': 11, '6': '.kachaka_api.Metadata', '10': 'metadata'},
    const {'1': 'header', '3': 2, '4': 1, '5': 11, '6': '.kachaka_api.RosHeader', '10': 'header'},
    const {'1': 'objects', '3': 3, '4': 3, '5': 11, '6': '.kachaka_api.ObjectDetection', '10': 'objects'},
  ],
};

/// Descriptor for `GetObjectDetectionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getObjectDetectionResponseDescriptor = $convert.base64Decode('ChpHZXRPYmplY3REZXRlY3Rpb25SZXNwb25zZRIxCghtZXRhZGF0YRgBIAEoCzIVLmthY2hha2FfYXBpLk1ldGFkYXRhUghtZXRhZGF0YRIuCgZoZWFkZXIYAiABKAsyFi5rYWNoYWthX2FwaS5Sb3NIZWFkZXJSBmhlYWRlchI2CgdvYmplY3RzGAMgAygLMhwua2FjaGFrYV9hcGkuT2JqZWN0RGV0ZWN0aW9uUgdvYmplY3Rz');
@$core.Deprecated('Use getRosImuResponseDescriptor instead')
const GetRosImuResponse$json = const {
  '1': 'GetRosImuResponse',
  '2': const [
    const {'1': 'metadata', '3': 1, '4': 1, '5': 11, '6': '.kachaka_api.Metadata', '10': 'metadata'},
    const {'1': 'imu', '3': 2, '4': 1, '5': 11, '6': '.kachaka_api.RosImu', '10': 'imu'},
  ],
};

/// Descriptor for `GetRosImuResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getRosImuResponseDescriptor = $convert.base64Decode('ChFHZXRSb3NJbXVSZXNwb25zZRIxCghtZXRhZGF0YRgBIAEoCzIVLmthY2hha2FfYXBpLk1ldGFkYXRhUghtZXRhZGF0YRIlCgNpbXUYAiABKAsyEy5rYWNoYWthX2FwaS5Sb3NJbXVSA2ltdQ==');
@$core.Deprecated('Use getRosOdometryResponseDescriptor instead')
const GetRosOdometryResponse$json = const {
  '1': 'GetRosOdometryResponse',
  '2': const [
    const {'1': 'metadata', '3': 1, '4': 1, '5': 11, '6': '.kachaka_api.Metadata', '10': 'metadata'},
    const {'1': 'odometry', '3': 2, '4': 1, '5': 11, '6': '.kachaka_api.RosOdometry', '10': 'odometry'},
  ],
};

/// Descriptor for `GetRosOdometryResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getRosOdometryResponseDescriptor = $convert.base64Decode('ChZHZXRSb3NPZG9tZXRyeVJlc3BvbnNlEjEKCG1ldGFkYXRhGAEgASgLMhUua2FjaGFrYV9hcGkuTWV0YWRhdGFSCG1ldGFkYXRhEjQKCG9kb21ldHJ5GAIgASgLMhgua2FjaGFrYV9hcGkuUm9zT2RvbWV0cnlSCG9kb21ldHJ5');
@$core.Deprecated('Use getRosLaserScanResponseDescriptor instead')
const GetRosLaserScanResponse$json = const {
  '1': 'GetRosLaserScanResponse',
  '2': const [
    const {'1': 'metadata', '3': 1, '4': 1, '5': 11, '6': '.kachaka_api.Metadata', '10': 'metadata'},
    const {'1': 'scan', '3': 2, '4': 1, '5': 11, '6': '.kachaka_api.RosLaserScan', '10': 'scan'},
  ],
};

/// Descriptor for `GetRosLaserScanResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getRosLaserScanResponseDescriptor = $convert.base64Decode('ChdHZXRSb3NMYXNlclNjYW5SZXNwb25zZRIxCghtZXRhZGF0YRgBIAEoCzIVLmthY2hha2FfYXBpLk1ldGFkYXRhUghtZXRhZGF0YRItCgRzY2FuGAIgASgLMhkua2FjaGFrYV9hcGkuUm9zTGFzZXJTY2FuUgRzY2Fu');
@$core.Deprecated('Use getFrontCameraRosCameraInfoResponseDescriptor instead')
const GetFrontCameraRosCameraInfoResponse$json = const {
  '1': 'GetFrontCameraRosCameraInfoResponse',
  '2': const [
    const {'1': 'metadata', '3': 1, '4': 1, '5': 11, '6': '.kachaka_api.Metadata', '10': 'metadata'},
    const {'1': 'camera_info', '3': 2, '4': 1, '5': 11, '6': '.kachaka_api.RosCameraInfo', '10': 'cameraInfo'},
  ],
};

/// Descriptor for `GetFrontCameraRosCameraInfoResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getFrontCameraRosCameraInfoResponseDescriptor = $convert.base64Decode('CiNHZXRGcm9udENhbWVyYVJvc0NhbWVyYUluZm9SZXNwb25zZRIxCghtZXRhZGF0YRgBIAEoCzIVLmthY2hha2FfYXBpLk1ldGFkYXRhUghtZXRhZGF0YRI7CgtjYW1lcmFfaW5mbxgCIAEoCzIaLmthY2hha2FfYXBpLlJvc0NhbWVyYUluZm9SCmNhbWVyYUluZm8=');
@$core.Deprecated('Use getFrontCameraRosImageResponseDescriptor instead')
const GetFrontCameraRosImageResponse$json = const {
  '1': 'GetFrontCameraRosImageResponse',
  '2': const [
    const {'1': 'metadata', '3': 1, '4': 1, '5': 11, '6': '.kachaka_api.Metadata', '10': 'metadata'},
    const {'1': 'image', '3': 2, '4': 1, '5': 11, '6': '.kachaka_api.RosImage', '10': 'image'},
  ],
};

/// Descriptor for `GetFrontCameraRosImageResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getFrontCameraRosImageResponseDescriptor = $convert.base64Decode('Ch5HZXRGcm9udENhbWVyYVJvc0ltYWdlUmVzcG9uc2USMQoIbWV0YWRhdGEYASABKAsyFS5rYWNoYWthX2FwaS5NZXRhZGF0YVIIbWV0YWRhdGESKwoFaW1hZ2UYAiABKAsyFS5rYWNoYWthX2FwaS5Sb3NJbWFnZVIFaW1hZ2U=');
@$core.Deprecated('Use getFrontCameraRosCompressedImageResponseDescriptor instead')
const GetFrontCameraRosCompressedImageResponse$json = const {
  '1': 'GetFrontCameraRosCompressedImageResponse',
  '2': const [
    const {'1': 'metadata', '3': 1, '4': 1, '5': 11, '6': '.kachaka_api.Metadata', '10': 'metadata'},
    const {'1': 'image', '3': 2, '4': 1, '5': 11, '6': '.kachaka_api.RosCompressedImage', '10': 'image'},
  ],
};

/// Descriptor for `GetFrontCameraRosCompressedImageResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getFrontCameraRosCompressedImageResponseDescriptor = $convert.base64Decode('CihHZXRGcm9udENhbWVyYVJvc0NvbXByZXNzZWRJbWFnZVJlc3BvbnNlEjEKCG1ldGFkYXRhGAEgASgLMhUua2FjaGFrYV9hcGkuTWV0YWRhdGFSCG1ldGFkYXRhEjUKBWltYWdlGAIgASgLMh8ua2FjaGFrYV9hcGkuUm9zQ29tcHJlc3NlZEltYWdlUgVpbWFnZQ==');
@$core.Deprecated('Use startCommandRequestDescriptor instead')
const StartCommandRequest$json = const {
  '1': 'StartCommandRequest',
  '2': const [
    const {'1': 'command', '3': 1, '4': 1, '5': 11, '6': '.kachaka_api.Command', '10': 'command'},
    const {'1': 'cancel_all', '3': 2, '4': 1, '5': 8, '10': 'cancelAll'},
    const {'1': 'tts_on_success', '3': 3, '4': 1, '5': 9, '10': 'ttsOnSuccess'},
    const {'1': 'title', '3': 4, '4': 1, '5': 9, '10': 'title'},
  ],
};

/// Descriptor for `StartCommandRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List startCommandRequestDescriptor = $convert.base64Decode('ChNTdGFydENvbW1hbmRSZXF1ZXN0Ei4KB2NvbW1hbmQYASABKAsyFC5rYWNoYWthX2FwaS5Db21tYW5kUgdjb21tYW5kEh0KCmNhbmNlbF9hbGwYAiABKAhSCWNhbmNlbEFsbBIkCg50dHNfb25fc3VjY2VzcxgDIAEoCVIMdHRzT25TdWNjZXNzEhQKBXRpdGxlGAQgASgJUgV0aXRsZQ==');
@$core.Deprecated('Use startCommandResponseDescriptor instead')
const StartCommandResponse$json = const {
  '1': 'StartCommandResponse',
  '2': const [
    const {'1': 'result', '3': 1, '4': 1, '5': 11, '6': '.kachaka_api.Result', '10': 'result'},
    const {'1': 'command_id', '3': 2, '4': 1, '5': 9, '10': 'commandId'},
  ],
};

/// Descriptor for `StartCommandResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List startCommandResponseDescriptor = $convert.base64Decode('ChRTdGFydENvbW1hbmRSZXNwb25zZRIrCgZyZXN1bHQYASABKAsyEy5rYWNoYWthX2FwaS5SZXN1bHRSBnJlc3VsdBIdCgpjb21tYW5kX2lkGAIgASgJUgljb21tYW5kSWQ=');
@$core.Deprecated('Use cancelCommandResponseDescriptor instead')
const CancelCommandResponse$json = const {
  '1': 'CancelCommandResponse',
  '2': const [
    const {'1': 'result', '3': 1, '4': 1, '5': 11, '6': '.kachaka_api.Result', '10': 'result'},
    const {'1': 'command', '3': 2, '4': 1, '5': 11, '6': '.kachaka_api.Command', '10': 'command'},
  ],
};

/// Descriptor for `CancelCommandResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cancelCommandResponseDescriptor = $convert.base64Decode('ChVDYW5jZWxDb21tYW5kUmVzcG9uc2USKwoGcmVzdWx0GAEgASgLMhMua2FjaGFrYV9hcGkuUmVzdWx0UgZyZXN1bHQSLgoHY29tbWFuZBgCIAEoCzIULmthY2hha2FfYXBpLkNvbW1hbmRSB2NvbW1hbmQ=');
@$core.Deprecated('Use getCommandStateResponseDescriptor instead')
const GetCommandStateResponse$json = const {
  '1': 'GetCommandStateResponse',
  '2': const [
    const {'1': 'metadata', '3': 1, '4': 1, '5': 11, '6': '.kachaka_api.Metadata', '10': 'metadata'},
    const {'1': 'state', '3': 2, '4': 1, '5': 14, '6': '.kachaka_api.CommandState', '10': 'state'},
    const {'1': 'command', '3': 3, '4': 1, '5': 11, '6': '.kachaka_api.Command', '10': 'command'},
  ],
};

/// Descriptor for `GetCommandStateResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getCommandStateResponseDescriptor = $convert.base64Decode('ChdHZXRDb21tYW5kU3RhdGVSZXNwb25zZRIxCghtZXRhZGF0YRgBIAEoCzIVLmthY2hha2FfYXBpLk1ldGFkYXRhUghtZXRhZGF0YRIvCgVzdGF0ZRgCIAEoDjIZLmthY2hha2FfYXBpLkNvbW1hbmRTdGF0ZVIFc3RhdGUSLgoHY29tbWFuZBgDIAEoCzIULmthY2hha2FfYXBpLkNvbW1hbmRSB2NvbW1hbmQ=');
@$core.Deprecated('Use getLastCommandResultResponseDescriptor instead')
const GetLastCommandResultResponse$json = const {
  '1': 'GetLastCommandResultResponse',
  '2': const [
    const {'1': 'metadata', '3': 1, '4': 1, '5': 11, '6': '.kachaka_api.Metadata', '10': 'metadata'},
    const {'1': 'result', '3': 2, '4': 1, '5': 11, '6': '.kachaka_api.Result', '10': 'result'},
    const {'1': 'command', '3': 3, '4': 1, '5': 11, '6': '.kachaka_api.Command', '10': 'command'},
  ],
};

/// Descriptor for `GetLastCommandResultResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getLastCommandResultResponseDescriptor = $convert.base64Decode('ChxHZXRMYXN0Q29tbWFuZFJlc3VsdFJlc3BvbnNlEjEKCG1ldGFkYXRhGAEgASgLMhUua2FjaGFrYV9hcGkuTWV0YWRhdGFSCG1ldGFkYXRhEisKBnJlc3VsdBgCIAEoCzITLmthY2hha2FfYXBpLlJlc3VsdFIGcmVzdWx0Ei4KB2NvbW1hbmQYAyABKAsyFC5rYWNoYWthX2FwaS5Db21tYW5kUgdjb21tYW5k');
@$core.Deprecated('Use getLocationsResponseDescriptor instead')
const GetLocationsResponse$json = const {
  '1': 'GetLocationsResponse',
  '2': const [
    const {'1': 'metadata', '3': 1, '4': 1, '5': 11, '6': '.kachaka_api.Metadata', '10': 'metadata'},
    const {'1': 'locations', '3': 2, '4': 3, '5': 11, '6': '.kachaka_api.Location', '10': 'locations'},
    const {'1': 'default_location_id', '3': 3, '4': 1, '5': 9, '10': 'defaultLocationId'},
  ],
};

/// Descriptor for `GetLocationsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getLocationsResponseDescriptor = $convert.base64Decode('ChRHZXRMb2NhdGlvbnNSZXNwb25zZRIxCghtZXRhZGF0YRgBIAEoCzIVLmthY2hha2FfYXBpLk1ldGFkYXRhUghtZXRhZGF0YRIzCglsb2NhdGlvbnMYAiADKAsyFS5rYWNoYWthX2FwaS5Mb2NhdGlvblIJbG9jYXRpb25zEi4KE2RlZmF1bHRfbG9jYXRpb25faWQYAyABKAlSEWRlZmF1bHRMb2NhdGlvbklk');
@$core.Deprecated('Use getShelvesResponseDescriptor instead')
const GetShelvesResponse$json = const {
  '1': 'GetShelvesResponse',
  '2': const [
    const {'1': 'metadata', '3': 1, '4': 1, '5': 11, '6': '.kachaka_api.Metadata', '10': 'metadata'},
    const {'1': 'shelves', '3': 2, '4': 3, '5': 11, '6': '.kachaka_api.Shelf', '10': 'shelves'},
  ],
};

/// Descriptor for `GetShelvesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getShelvesResponseDescriptor = $convert.base64Decode('ChJHZXRTaGVsdmVzUmVzcG9uc2USMQoIbWV0YWRhdGEYASABKAsyFS5rYWNoYWthX2FwaS5NZXRhZGF0YVIIbWV0YWRhdGESLAoHc2hlbHZlcxgCIAMoCzISLmthY2hha2FfYXBpLlNoZWxmUgdzaGVsdmVz');
@$core.Deprecated('Use setAutoHomingEnabledRequestDescriptor instead')
const SetAutoHomingEnabledRequest$json = const {
  '1': 'SetAutoHomingEnabledRequest',
  '2': const [
    const {'1': 'enable', '3': 1, '4': 1, '5': 8, '10': 'enable'},
  ],
};

/// Descriptor for `SetAutoHomingEnabledRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List setAutoHomingEnabledRequestDescriptor = $convert.base64Decode('ChtTZXRBdXRvSG9taW5nRW5hYmxlZFJlcXVlc3QSFgoGZW5hYmxlGAEgASgIUgZlbmFibGU=');
@$core.Deprecated('Use setAutoHomingEnabledResponseDescriptor instead')
const SetAutoHomingEnabledResponse$json = const {
  '1': 'SetAutoHomingEnabledResponse',
  '2': const [
    const {'1': 'result', '3': 1, '4': 1, '5': 11, '6': '.kachaka_api.Result', '10': 'result'},
  ],
};

/// Descriptor for `SetAutoHomingEnabledResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List setAutoHomingEnabledResponseDescriptor = $convert.base64Decode('ChxTZXRBdXRvSG9taW5nRW5hYmxlZFJlc3BvbnNlEisKBnJlc3VsdBgBIAEoCzITLmthY2hha2FfYXBpLlJlc3VsdFIGcmVzdWx0');
@$core.Deprecated('Use getAutoHomingEnabledResponseDescriptor instead')
const GetAutoHomingEnabledResponse$json = const {
  '1': 'GetAutoHomingEnabledResponse',
  '2': const [
    const {'1': 'metadata', '3': 1, '4': 1, '5': 11, '6': '.kachaka_api.Metadata', '10': 'metadata'},
    const {'1': 'enabled', '3': 2, '4': 1, '5': 8, '10': 'enabled'},
  ],
};

/// Descriptor for `GetAutoHomingEnabledResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getAutoHomingEnabledResponseDescriptor = $convert.base64Decode('ChxHZXRBdXRvSG9taW5nRW5hYmxlZFJlc3BvbnNlEjEKCG1ldGFkYXRhGAEgASgLMhUua2FjaGFrYV9hcGkuTWV0YWRhdGFSCG1ldGFkYXRhEhgKB2VuYWJsZWQYAiABKAhSB2VuYWJsZWQ=');
@$core.Deprecated('Use setManualControlEnabledRequestDescriptor instead')
const SetManualControlEnabledRequest$json = const {
  '1': 'SetManualControlEnabledRequest',
  '2': const [
    const {'1': 'enable', '3': 1, '4': 1, '5': 8, '10': 'enable'},
    const {'1': 'use_shelf_registration', '3': 2, '4': 1, '5': 8, '10': 'useShelfRegistration'},
  ],
};

/// Descriptor for `SetManualControlEnabledRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List setManualControlEnabledRequestDescriptor = $convert.base64Decode('Ch5TZXRNYW51YWxDb250cm9sRW5hYmxlZFJlcXVlc3QSFgoGZW5hYmxlGAEgASgIUgZlbmFibGUSNAoWdXNlX3NoZWxmX3JlZ2lzdHJhdGlvbhgCIAEoCFIUdXNlU2hlbGZSZWdpc3RyYXRpb24=');
@$core.Deprecated('Use setManualControlEnabledResponseDescriptor instead')
const SetManualControlEnabledResponse$json = const {
  '1': 'SetManualControlEnabledResponse',
  '2': const [
    const {'1': 'result', '3': 1, '4': 1, '5': 11, '6': '.kachaka_api.Result', '10': 'result'},
  ],
};

/// Descriptor for `SetManualControlEnabledResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List setManualControlEnabledResponseDescriptor = $convert.base64Decode('Ch9TZXRNYW51YWxDb250cm9sRW5hYmxlZFJlc3BvbnNlEisKBnJlc3VsdBgBIAEoCzITLmthY2hha2FfYXBpLlJlc3VsdFIGcmVzdWx0');
@$core.Deprecated('Use getManualControlEnabledResponseDescriptor instead')
const GetManualControlEnabledResponse$json = const {
  '1': 'GetManualControlEnabledResponse',
  '2': const [
    const {'1': 'metadata', '3': 1, '4': 1, '5': 11, '6': '.kachaka_api.Metadata', '10': 'metadata'},
    const {'1': 'enabled', '3': 2, '4': 1, '5': 8, '10': 'enabled'},
  ],
};

/// Descriptor for `GetManualControlEnabledResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getManualControlEnabledResponseDescriptor = $convert.base64Decode('Ch9HZXRNYW51YWxDb250cm9sRW5hYmxlZFJlc3BvbnNlEjEKCG1ldGFkYXRhGAEgASgLMhUua2FjaGFrYV9hcGkuTWV0YWRhdGFSCG1ldGFkYXRhEhgKB2VuYWJsZWQYAiABKAhSB2VuYWJsZWQ=');
@$core.Deprecated('Use setRobotVelocityRequestDescriptor instead')
const SetRobotVelocityRequest$json = const {
  '1': 'SetRobotVelocityRequest',
  '2': const [
    const {'1': 'linear', '3': 1, '4': 1, '5': 1, '10': 'linear'},
    const {'1': 'angular', '3': 2, '4': 1, '5': 1, '10': 'angular'},
  ],
};

/// Descriptor for `SetRobotVelocityRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List setRobotVelocityRequestDescriptor = $convert.base64Decode('ChdTZXRSb2JvdFZlbG9jaXR5UmVxdWVzdBIWCgZsaW5lYXIYASABKAFSBmxpbmVhchIYCgdhbmd1bGFyGAIgASgBUgdhbmd1bGFy');
@$core.Deprecated('Use setRobotVelocityResponseDescriptor instead')
const SetRobotVelocityResponse$json = const {
  '1': 'SetRobotVelocityResponse',
  '2': const [
    const {'1': 'result', '3': 1, '4': 1, '5': 11, '6': '.kachaka_api.Result', '10': 'result'},
  ],
};

/// Descriptor for `SetRobotVelocityResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List setRobotVelocityResponseDescriptor = $convert.base64Decode('ChhTZXRSb2JvdFZlbG9jaXR5UmVzcG9uc2USKwoGcmVzdWx0GAEgASgLMhMua2FjaGFrYV9hcGkuUmVzdWx0UgZyZXN1bHQ=');
@$core.Deprecated('Use getStaticTransformResponseDescriptor instead')
const GetStaticTransformResponse$json = const {
  '1': 'GetStaticTransformResponse',
  '2': const [
    const {'1': 'metadata', '3': 1, '4': 1, '5': 11, '6': '.kachaka_api.Metadata', '10': 'metadata'},
    const {'1': 'transforms', '3': 2, '4': 3, '5': 11, '6': '.kachaka_api.RosTransformStamped', '10': 'transforms'},
  ],
};

/// Descriptor for `GetStaticTransformResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getStaticTransformResponseDescriptor = $convert.base64Decode('ChpHZXRTdGF0aWNUcmFuc2Zvcm1SZXNwb25zZRIxCghtZXRhZGF0YRgBIAEoCzIVLmthY2hha2FfYXBpLk1ldGFkYXRhUghtZXRhZGF0YRJACgp0cmFuc2Zvcm1zGAIgAygLMiAua2FjaGFrYV9hcGkuUm9zVHJhbnNmb3JtU3RhbXBlZFIKdHJhbnNmb3Jtcw==');
@$core.Deprecated('Use getDynamicTransformResponseDescriptor instead')
const GetDynamicTransformResponse$json = const {
  '1': 'GetDynamicTransformResponse',
  '2': const [
    const {'1': 'transforms', '3': 1, '4': 3, '5': 11, '6': '.kachaka_api.RosTransformStamped', '10': 'transforms'},
  ],
};

/// Descriptor for `GetDynamicTransformResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getDynamicTransformResponseDescriptor = $convert.base64Decode('ChtHZXREeW5hbWljVHJhbnNmb3JtUmVzcG9uc2USQAoKdHJhbnNmb3JtcxgBIAMoCzIgLmthY2hha2FfYXBpLlJvc1RyYW5zZm9ybVN0YW1wZWRSCnRyYW5zZm9ybXM=');
@$core.Deprecated('Use historyDescriptor instead')
const History$json = const {
  '1': 'History',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'command', '3': 4, '4': 1, '5': 11, '6': '.kachaka_api.Command', '10': 'command'},
    const {'1': 'success', '3': 5, '4': 1, '5': 8, '10': 'success'},
    const {'1': 'error_code', '3': 6, '4': 1, '5': 5, '10': 'errorCode'},
    const {'1': 'command_executed_time', '3': 7, '4': 1, '5': 3, '10': 'commandExecutedTime'},
  ],
};

/// Descriptor for `History`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List historyDescriptor = $convert.base64Decode('CgdIaXN0b3J5Eg4KAmlkGAEgASgJUgJpZBIuCgdjb21tYW5kGAQgASgLMhQua2FjaGFrYV9hcGkuQ29tbWFuZFIHY29tbWFuZBIYCgdzdWNjZXNzGAUgASgIUgdzdWNjZXNzEh0KCmVycm9yX2NvZGUYBiABKAVSCWVycm9yQ29kZRIyChVjb21tYW5kX2V4ZWN1dGVkX3RpbWUYByABKANSE2NvbW1hbmRFeGVjdXRlZFRpbWU=');
@$core.Deprecated('Use getHistoryListResponseDescriptor instead')
const GetHistoryListResponse$json = const {
  '1': 'GetHistoryListResponse',
  '2': const [
    const {'1': 'metadata', '3': 1, '4': 1, '5': 11, '6': '.kachaka_api.Metadata', '10': 'metadata'},
    const {'1': 'histories', '3': 2, '4': 3, '5': 11, '6': '.kachaka_api.History', '10': 'histories'},
  ],
};

/// Descriptor for `GetHistoryListResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getHistoryListResponseDescriptor = $convert.base64Decode('ChZHZXRIaXN0b3J5TGlzdFJlc3BvbnNlEjEKCG1ldGFkYXRhGAEgASgLMhUua2FjaGFrYV9hcGkuTWV0YWRhdGFSCG1ldGFkYXRhEjIKCWhpc3RvcmllcxgCIAMoCzIULmthY2hha2FfYXBpLkhpc3RvcnlSCWhpc3Rvcmllcw==');
