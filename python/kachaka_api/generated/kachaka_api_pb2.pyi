from google.protobuf.internal import containers as _containers
from google.protobuf.internal import enum_type_wrapper as _enum_type_wrapper
from google.protobuf import descriptor as _descriptor
from google.protobuf import message as _message
from typing import ClassVar as _ClassVar, Iterable as _Iterable, Mapping as _Mapping, Optional as _Optional, Union as _Union

DESCRIPTOR: _descriptor.FileDescriptor

class LocationType(int, metaclass=_enum_type_wrapper.EnumTypeWrapper):
    __slots__ = []
    LOCATION_TYPE_UNSPECIFIED: _ClassVar[LocationType]
    LOCATION_TYPE_CHARGER: _ClassVar[LocationType]
    LOCATION_TYPE_SHELF_HOME: _ClassVar[LocationType]

class ShelfAppearance(int, metaclass=_enum_type_wrapper.EnumTypeWrapper):
    __slots__ = []
    SHELF_APPEARANCE_UNSPECIFIED: _ClassVar[ShelfAppearance]
    SHELF_APPEARANCE_DEFAULT_SHELF: _ClassVar[ShelfAppearance]
    SHELF_APPEARANCE_KACHAKA_SHELF_3DRAWERS: _ClassVar[ShelfAppearance]
    SHELF_APPEARANCE_KACHAKA_SHELF_2DRAWERS: _ClassVar[ShelfAppearance]

class ShelfSpeedMode(int, metaclass=_enum_type_wrapper.EnumTypeWrapper):
    __slots__ = []
    SHELF_SPEED_MODE_UNSPECIFIED: _ClassVar[ShelfSpeedMode]
    SHELF_SPEED_MODE_LOW: _ClassVar[ShelfSpeedMode]
    SHELF_SPEED_MODE_NORMAL: _ClassVar[ShelfSpeedMode]

class ObjectLabel(int, metaclass=_enum_type_wrapper.EnumTypeWrapper):
    __slots__ = []
    OBJECT_LABEL_UNSPECIFIED: _ClassVar[ObjectLabel]
    OBJECT_LABEL_PERSON: _ClassVar[ObjectLabel]
    OBJECT_LABEL_SHELF: _ClassVar[ObjectLabel]
    OBJECT_LABEL_CHARGER: _ClassVar[ObjectLabel]
    OBJECT_LABEL_DOOR: _ClassVar[ObjectLabel]

class CommandState(int, metaclass=_enum_type_wrapper.EnumTypeWrapper):
    __slots__ = []
    COMMAND_STATE_UNSPECIFIED: _ClassVar[CommandState]
    COMMAND_STATE_PENDING: _ClassVar[CommandState]
    COMMAND_STATE_RUNNING: _ClassVar[CommandState]
LOCATION_TYPE_UNSPECIFIED: LocationType
LOCATION_TYPE_CHARGER: LocationType
LOCATION_TYPE_SHELF_HOME: LocationType
SHELF_APPEARANCE_UNSPECIFIED: ShelfAppearance
SHELF_APPEARANCE_DEFAULT_SHELF: ShelfAppearance
SHELF_APPEARANCE_KACHAKA_SHELF_3DRAWERS: ShelfAppearance
SHELF_APPEARANCE_KACHAKA_SHELF_2DRAWERS: ShelfAppearance
SHELF_SPEED_MODE_UNSPECIFIED: ShelfSpeedMode
SHELF_SPEED_MODE_LOW: ShelfSpeedMode
SHELF_SPEED_MODE_NORMAL: ShelfSpeedMode
OBJECT_LABEL_UNSPECIFIED: ObjectLabel
OBJECT_LABEL_PERSON: ObjectLabel
OBJECT_LABEL_SHELF: ObjectLabel
OBJECT_LABEL_CHARGER: ObjectLabel
OBJECT_LABEL_DOOR: ObjectLabel
COMMAND_STATE_UNSPECIFIED: CommandState
COMMAND_STATE_PENDING: CommandState
COMMAND_STATE_RUNNING: CommandState

class Metadata(_message.Message):
    __slots__ = ["cursor"]
    CURSOR_FIELD_NUMBER: _ClassVar[int]
    cursor: int
    def __init__(self, cursor: _Optional[int] = ...) -> None: ...

class Result(_message.Message):
    __slots__ = ["success", "error_code"]
    SUCCESS_FIELD_NUMBER: _ClassVar[int]
    ERROR_CODE_FIELD_NUMBER: _ClassVar[int]
    success: bool
    error_code: int
    def __init__(self, success: bool = ..., error_code: _Optional[int] = ...) -> None: ...

class Error(_message.Message):
    __slots__ = ["error_code"]
    ERROR_CODE_FIELD_NUMBER: _ClassVar[int]
    error_code: int
    def __init__(self, error_code: _Optional[int] = ...) -> None: ...

class RosHeader(_message.Message):
    __slots__ = ["stamp_nsec", "frame_id"]
    STAMP_NSEC_FIELD_NUMBER: _ClassVar[int]
    FRAME_ID_FIELD_NUMBER: _ClassVar[int]
    stamp_nsec: int
    frame_id: str
    def __init__(self, stamp_nsec: _Optional[int] = ..., frame_id: _Optional[str] = ...) -> None: ...

class Pose(_message.Message):
    __slots__ = ["x", "y", "theta"]
    X_FIELD_NUMBER: _ClassVar[int]
    Y_FIELD_NUMBER: _ClassVar[int]
    THETA_FIELD_NUMBER: _ClassVar[int]
    x: float
    y: float
    theta: float
    def __init__(self, x: _Optional[float] = ..., y: _Optional[float] = ..., theta: _Optional[float] = ...) -> None: ...

class Vector3(_message.Message):
    __slots__ = ["x", "y", "z"]
    X_FIELD_NUMBER: _ClassVar[int]
    Y_FIELD_NUMBER: _ClassVar[int]
    Z_FIELD_NUMBER: _ClassVar[int]
    x: float
    y: float
    z: float
    def __init__(self, x: _Optional[float] = ..., y: _Optional[float] = ..., z: _Optional[float] = ...) -> None: ...

class Quaternion(_message.Message):
    __slots__ = ["x", "y", "z", "w"]
    X_FIELD_NUMBER: _ClassVar[int]
    Y_FIELD_NUMBER: _ClassVar[int]
    Z_FIELD_NUMBER: _ClassVar[int]
    W_FIELD_NUMBER: _ClassVar[int]
    x: float
    y: float
    z: float
    w: float
    def __init__(self, x: _Optional[float] = ..., y: _Optional[float] = ..., z: _Optional[float] = ..., w: _Optional[float] = ...) -> None: ...

class Pose3d(_message.Message):
    __slots__ = ["position", "orientation"]
    POSITION_FIELD_NUMBER: _ClassVar[int]
    ORIENTATION_FIELD_NUMBER: _ClassVar[int]
    position: Vector3
    orientation: Quaternion
    def __init__(self, position: _Optional[_Union[Vector3, _Mapping]] = ..., orientation: _Optional[_Union[Quaternion, _Mapping]] = ...) -> None: ...

class Twist(_message.Message):
    __slots__ = ["linear", "angular"]
    LINEAR_FIELD_NUMBER: _ClassVar[int]
    ANGULAR_FIELD_NUMBER: _ClassVar[int]
    linear: Vector3
    angular: Vector3
    def __init__(self, linear: _Optional[_Union[Vector3, _Mapping]] = ..., angular: _Optional[_Union[Vector3, _Mapping]] = ...) -> None: ...

class Pose3dWithCovariance(_message.Message):
    __slots__ = ["pose", "covariance"]
    POSE_FIELD_NUMBER: _ClassVar[int]
    COVARIANCE_FIELD_NUMBER: _ClassVar[int]
    pose: Pose3d
    covariance: _containers.RepeatedScalarFieldContainer[float]
    def __init__(self, pose: _Optional[_Union[Pose3d, _Mapping]] = ..., covariance: _Optional[_Iterable[float]] = ...) -> None: ...

class TwistWithCovariance(_message.Message):
    __slots__ = ["twist", "covariance"]
    TWIST_FIELD_NUMBER: _ClassVar[int]
    COVARIANCE_FIELD_NUMBER: _ClassVar[int]
    twist: Twist
    covariance: _containers.RepeatedScalarFieldContainer[float]
    def __init__(self, twist: _Optional[_Union[Twist, _Mapping]] = ..., covariance: _Optional[_Iterable[float]] = ...) -> None: ...

class Map(_message.Message):
    __slots__ = ["data", "name", "resolution", "width", "height", "origin"]
    DATA_FIELD_NUMBER: _ClassVar[int]
    NAME_FIELD_NUMBER: _ClassVar[int]
    RESOLUTION_FIELD_NUMBER: _ClassVar[int]
    WIDTH_FIELD_NUMBER: _ClassVar[int]
    HEIGHT_FIELD_NUMBER: _ClassVar[int]
    ORIGIN_FIELD_NUMBER: _ClassVar[int]
    data: bytes
    name: str
    resolution: float
    width: int
    height: int
    origin: Pose
    def __init__(self, data: _Optional[bytes] = ..., name: _Optional[str] = ..., resolution: _Optional[float] = ..., width: _Optional[int] = ..., height: _Optional[int] = ..., origin: _Optional[_Union[Pose, _Mapping]] = ...) -> None: ...

class Location(_message.Message):
    __slots__ = ["id", "name", "pose", "type", "undock_shelf_aligning_to_wall", "undock_shelf_avoiding_obstacles", "ignore_voice_recognition"]
    ID_FIELD_NUMBER: _ClassVar[int]
    NAME_FIELD_NUMBER: _ClassVar[int]
    POSE_FIELD_NUMBER: _ClassVar[int]
    TYPE_FIELD_NUMBER: _ClassVar[int]
    UNDOCK_SHELF_ALIGNING_TO_WALL_FIELD_NUMBER: _ClassVar[int]
    UNDOCK_SHELF_AVOIDING_OBSTACLES_FIELD_NUMBER: _ClassVar[int]
    IGNORE_VOICE_RECOGNITION_FIELD_NUMBER: _ClassVar[int]
    id: str
    name: str
    pose: Pose
    type: LocationType
    undock_shelf_aligning_to_wall: bool
    undock_shelf_avoiding_obstacles: bool
    ignore_voice_recognition: bool
    def __init__(self, id: _Optional[str] = ..., name: _Optional[str] = ..., pose: _Optional[_Union[Pose, _Mapping]] = ..., type: _Optional[_Union[LocationType, str]] = ..., undock_shelf_aligning_to_wall: bool = ..., undock_shelf_avoiding_obstacles: bool = ..., ignore_voice_recognition: bool = ...) -> None: ...

class ShelfSize(_message.Message):
    __slots__ = ["width", "depth", "height"]
    WIDTH_FIELD_NUMBER: _ClassVar[int]
    DEPTH_FIELD_NUMBER: _ClassVar[int]
    HEIGHT_FIELD_NUMBER: _ClassVar[int]
    width: float
    depth: float
    height: float
    def __init__(self, width: _Optional[float] = ..., depth: _Optional[float] = ..., height: _Optional[float] = ...) -> None: ...

class RecognizableName(_message.Message):
    __slots__ = ["name", "deletable"]
    NAME_FIELD_NUMBER: _ClassVar[int]
    DELETABLE_FIELD_NUMBER: _ClassVar[int]
    name: str
    deletable: bool
    def __init__(self, name: _Optional[str] = ..., deletable: bool = ...) -> None: ...

class Shelf(_message.Message):
    __slots__ = ["id", "name", "pose", "size", "appearance", "recognizable_names", "home_location_id", "speed_mode", "ignore_voice_recognition"]
    ID_FIELD_NUMBER: _ClassVar[int]
    NAME_FIELD_NUMBER: _ClassVar[int]
    POSE_FIELD_NUMBER: _ClassVar[int]
    SIZE_FIELD_NUMBER: _ClassVar[int]
    APPEARANCE_FIELD_NUMBER: _ClassVar[int]
    RECOGNIZABLE_NAMES_FIELD_NUMBER: _ClassVar[int]
    HOME_LOCATION_ID_FIELD_NUMBER: _ClassVar[int]
    SPEED_MODE_FIELD_NUMBER: _ClassVar[int]
    IGNORE_VOICE_RECOGNITION_FIELD_NUMBER: _ClassVar[int]
    id: str
    name: str
    pose: Pose
    size: ShelfSize
    appearance: ShelfAppearance
    recognizable_names: _containers.RepeatedCompositeFieldContainer[RecognizableName]
    home_location_id: str
    speed_mode: ShelfSpeedMode
    ignore_voice_recognition: bool
    def __init__(self, id: _Optional[str] = ..., name: _Optional[str] = ..., pose: _Optional[_Union[Pose, _Mapping]] = ..., size: _Optional[_Union[ShelfSize, _Mapping]] = ..., appearance: _Optional[_Union[ShelfAppearance, str]] = ..., recognizable_names: _Optional[_Iterable[_Union[RecognizableName, _Mapping]]] = ..., home_location_id: _Optional[str] = ..., speed_mode: _Optional[_Union[ShelfSpeedMode, str]] = ..., ignore_voice_recognition: bool = ...) -> None: ...

class RosImu(_message.Message):
    __slots__ = ["header", "orientation", "orientation_covariance", "angular_velocity", "angular_velocity_covariance", "linear_acceleration", "linear_acceleration_covariance"]
    HEADER_FIELD_NUMBER: _ClassVar[int]
    ORIENTATION_FIELD_NUMBER: _ClassVar[int]
    ORIENTATION_COVARIANCE_FIELD_NUMBER: _ClassVar[int]
    ANGULAR_VELOCITY_FIELD_NUMBER: _ClassVar[int]
    ANGULAR_VELOCITY_COVARIANCE_FIELD_NUMBER: _ClassVar[int]
    LINEAR_ACCELERATION_FIELD_NUMBER: _ClassVar[int]
    LINEAR_ACCELERATION_COVARIANCE_FIELD_NUMBER: _ClassVar[int]
    header: RosHeader
    orientation: Quaternion
    orientation_covariance: _containers.RepeatedScalarFieldContainer[float]
    angular_velocity: Vector3
    angular_velocity_covariance: _containers.RepeatedScalarFieldContainer[float]
    linear_acceleration: Vector3
    linear_acceleration_covariance: _containers.RepeatedScalarFieldContainer[float]
    def __init__(self, header: _Optional[_Union[RosHeader, _Mapping]] = ..., orientation: _Optional[_Union[Quaternion, _Mapping]] = ..., orientation_covariance: _Optional[_Iterable[float]] = ..., angular_velocity: _Optional[_Union[Vector3, _Mapping]] = ..., angular_velocity_covariance: _Optional[_Iterable[float]] = ..., linear_acceleration: _Optional[_Union[Vector3, _Mapping]] = ..., linear_acceleration_covariance: _Optional[_Iterable[float]] = ...) -> None: ...

class RosOdometry(_message.Message):
    __slots__ = ["header", "child_frame_id", "pose", "twist"]
    HEADER_FIELD_NUMBER: _ClassVar[int]
    CHILD_FRAME_ID_FIELD_NUMBER: _ClassVar[int]
    POSE_FIELD_NUMBER: _ClassVar[int]
    TWIST_FIELD_NUMBER: _ClassVar[int]
    header: RosHeader
    child_frame_id: str
    pose: Pose3dWithCovariance
    twist: TwistWithCovariance
    def __init__(self, header: _Optional[_Union[RosHeader, _Mapping]] = ..., child_frame_id: _Optional[str] = ..., pose: _Optional[_Union[Pose3dWithCovariance, _Mapping]] = ..., twist: _Optional[_Union[TwistWithCovariance, _Mapping]] = ...) -> None: ...

class RosLaserScan(_message.Message):
    __slots__ = ["header", "angle_min", "angle_max", "angle_increment", "time_increment", "scan_time", "range_min", "range_max", "ranges", "intensities"]
    HEADER_FIELD_NUMBER: _ClassVar[int]
    ANGLE_MIN_FIELD_NUMBER: _ClassVar[int]
    ANGLE_MAX_FIELD_NUMBER: _ClassVar[int]
    ANGLE_INCREMENT_FIELD_NUMBER: _ClassVar[int]
    TIME_INCREMENT_FIELD_NUMBER: _ClassVar[int]
    SCAN_TIME_FIELD_NUMBER: _ClassVar[int]
    RANGE_MIN_FIELD_NUMBER: _ClassVar[int]
    RANGE_MAX_FIELD_NUMBER: _ClassVar[int]
    RANGES_FIELD_NUMBER: _ClassVar[int]
    INTENSITIES_FIELD_NUMBER: _ClassVar[int]
    header: RosHeader
    angle_min: float
    angle_max: float
    angle_increment: float
    time_increment: float
    scan_time: float
    range_min: float
    range_max: float
    ranges: _containers.RepeatedScalarFieldContainer[float]
    intensities: _containers.RepeatedScalarFieldContainer[float]
    def __init__(self, header: _Optional[_Union[RosHeader, _Mapping]] = ..., angle_min: _Optional[float] = ..., angle_max: _Optional[float] = ..., angle_increment: _Optional[float] = ..., time_increment: _Optional[float] = ..., scan_time: _Optional[float] = ..., range_min: _Optional[float] = ..., range_max: _Optional[float] = ..., ranges: _Optional[_Iterable[float]] = ..., intensities: _Optional[_Iterable[float]] = ...) -> None: ...

class RegionOfInterest(_message.Message):
    __slots__ = ["x_offset", "y_offset", "height", "width", "do_rectify"]
    X_OFFSET_FIELD_NUMBER: _ClassVar[int]
    Y_OFFSET_FIELD_NUMBER: _ClassVar[int]
    HEIGHT_FIELD_NUMBER: _ClassVar[int]
    WIDTH_FIELD_NUMBER: _ClassVar[int]
    DO_RECTIFY_FIELD_NUMBER: _ClassVar[int]
    x_offset: int
    y_offset: int
    height: int
    width: int
    do_rectify: bool
    def __init__(self, x_offset: _Optional[int] = ..., y_offset: _Optional[int] = ..., height: _Optional[int] = ..., width: _Optional[int] = ..., do_rectify: bool = ...) -> None: ...

class RosCameraInfo(_message.Message):
    __slots__ = ["header", "height", "width", "distortion_model", "D", "K", "R", "P", "binning_x", "binning_y", "roi"]
    HEADER_FIELD_NUMBER: _ClassVar[int]
    HEIGHT_FIELD_NUMBER: _ClassVar[int]
    WIDTH_FIELD_NUMBER: _ClassVar[int]
    DISTORTION_MODEL_FIELD_NUMBER: _ClassVar[int]
    D_FIELD_NUMBER: _ClassVar[int]
    K_FIELD_NUMBER: _ClassVar[int]
    R_FIELD_NUMBER: _ClassVar[int]
    P_FIELD_NUMBER: _ClassVar[int]
    BINNING_X_FIELD_NUMBER: _ClassVar[int]
    BINNING_Y_FIELD_NUMBER: _ClassVar[int]
    ROI_FIELD_NUMBER: _ClassVar[int]
    header: RosHeader
    height: int
    width: int
    distortion_model: str
    D: _containers.RepeatedScalarFieldContainer[float]
    K: _containers.RepeatedScalarFieldContainer[float]
    R: _containers.RepeatedScalarFieldContainer[float]
    P: _containers.RepeatedScalarFieldContainer[float]
    binning_x: int
    binning_y: int
    roi: RegionOfInterest
    def __init__(self, header: _Optional[_Union[RosHeader, _Mapping]] = ..., height: _Optional[int] = ..., width: _Optional[int] = ..., distortion_model: _Optional[str] = ..., D: _Optional[_Iterable[float]] = ..., K: _Optional[_Iterable[float]] = ..., R: _Optional[_Iterable[float]] = ..., P: _Optional[_Iterable[float]] = ..., binning_x: _Optional[int] = ..., binning_y: _Optional[int] = ..., roi: _Optional[_Union[RegionOfInterest, _Mapping]] = ...) -> None: ...

class RosImage(_message.Message):
    __slots__ = ["header", "height", "width", "encoding", "is_bigendian", "step", "data"]
    HEADER_FIELD_NUMBER: _ClassVar[int]
    HEIGHT_FIELD_NUMBER: _ClassVar[int]
    WIDTH_FIELD_NUMBER: _ClassVar[int]
    ENCODING_FIELD_NUMBER: _ClassVar[int]
    IS_BIGENDIAN_FIELD_NUMBER: _ClassVar[int]
    STEP_FIELD_NUMBER: _ClassVar[int]
    DATA_FIELD_NUMBER: _ClassVar[int]
    header: RosHeader
    height: int
    width: int
    encoding: str
    is_bigendian: bool
    step: int
    data: bytes
    def __init__(self, header: _Optional[_Union[RosHeader, _Mapping]] = ..., height: _Optional[int] = ..., width: _Optional[int] = ..., encoding: _Optional[str] = ..., is_bigendian: bool = ..., step: _Optional[int] = ..., data: _Optional[bytes] = ...) -> None: ...

class RosCompressedImage(_message.Message):
    __slots__ = ["header", "format", "data"]
    HEADER_FIELD_NUMBER: _ClassVar[int]
    FORMAT_FIELD_NUMBER: _ClassVar[int]
    DATA_FIELD_NUMBER: _ClassVar[int]
    header: RosHeader
    format: str
    data: bytes
    def __init__(self, header: _Optional[_Union[RosHeader, _Mapping]] = ..., format: _Optional[str] = ..., data: _Optional[bytes] = ...) -> None: ...

class ObjectDetection(_message.Message):
    __slots__ = ["label", "roi", "score", "distance_median"]
    LABEL_FIELD_NUMBER: _ClassVar[int]
    ROI_FIELD_NUMBER: _ClassVar[int]
    SCORE_FIELD_NUMBER: _ClassVar[int]
    DISTANCE_MEDIAN_FIELD_NUMBER: _ClassVar[int]
    label: int
    roi: RegionOfInterest
    score: float
    distance_median: float
    def __init__(self, label: _Optional[int] = ..., roi: _Optional[_Union[RegionOfInterest, _Mapping]] = ..., score: _Optional[float] = ..., distance_median: _Optional[float] = ...) -> None: ...

class Command(_message.Message):
    __slots__ = ["move_shelf_command", "return_shelf_command", "undock_shelf_command", "move_to_location_command", "return_home_command", "dock_shelf_command", "speak_command", "move_to_pose_command"]
    MOVE_SHELF_COMMAND_FIELD_NUMBER: _ClassVar[int]
    RETURN_SHELF_COMMAND_FIELD_NUMBER: _ClassVar[int]
    UNDOCK_SHELF_COMMAND_FIELD_NUMBER: _ClassVar[int]
    MOVE_TO_LOCATION_COMMAND_FIELD_NUMBER: _ClassVar[int]
    RETURN_HOME_COMMAND_FIELD_NUMBER: _ClassVar[int]
    DOCK_SHELF_COMMAND_FIELD_NUMBER: _ClassVar[int]
    SPEAK_COMMAND_FIELD_NUMBER: _ClassVar[int]
    MOVE_TO_POSE_COMMAND_FIELD_NUMBER: _ClassVar[int]
    move_shelf_command: MoveShelfCommand
    return_shelf_command: ReturnShelfCommand
    undock_shelf_command: UndockShelfCommand
    move_to_location_command: MoveToLocationCommand
    return_home_command: ReturnHomeCommand
    dock_shelf_command: DockShelfCommand
    speak_command: SpeakCommand
    move_to_pose_command: MoveToPoseCommand
    def __init__(self, move_shelf_command: _Optional[_Union[MoveShelfCommand, _Mapping]] = ..., return_shelf_command: _Optional[_Union[ReturnShelfCommand, _Mapping]] = ..., undock_shelf_command: _Optional[_Union[UndockShelfCommand, _Mapping]] = ..., move_to_location_command: _Optional[_Union[MoveToLocationCommand, _Mapping]] = ..., return_home_command: _Optional[_Union[ReturnHomeCommand, _Mapping]] = ..., dock_shelf_command: _Optional[_Union[DockShelfCommand, _Mapping]] = ..., speak_command: _Optional[_Union[SpeakCommand, _Mapping]] = ..., move_to_pose_command: _Optional[_Union[MoveToPoseCommand, _Mapping]] = ...) -> None: ...

class MoveShelfCommand(_message.Message):
    __slots__ = ["target_shelf_id", "destination_location_id"]
    TARGET_SHELF_ID_FIELD_NUMBER: _ClassVar[int]
    DESTINATION_LOCATION_ID_FIELD_NUMBER: _ClassVar[int]
    target_shelf_id: str
    destination_location_id: str
    def __init__(self, target_shelf_id: _Optional[str] = ..., destination_location_id: _Optional[str] = ...) -> None: ...

class ReturnShelfCommand(_message.Message):
    __slots__ = ["target_shelf_id"]
    TARGET_SHELF_ID_FIELD_NUMBER: _ClassVar[int]
    target_shelf_id: str
    def __init__(self, target_shelf_id: _Optional[str] = ...) -> None: ...

class UndockShelfCommand(_message.Message):
    __slots__ = ["target_shelf_id"]
    TARGET_SHELF_ID_FIELD_NUMBER: _ClassVar[int]
    target_shelf_id: str
    def __init__(self, target_shelf_id: _Optional[str] = ...) -> None: ...

class MoveToLocationCommand(_message.Message):
    __slots__ = ["target_location_id"]
    TARGET_LOCATION_ID_FIELD_NUMBER: _ClassVar[int]
    target_location_id: str
    def __init__(self, target_location_id: _Optional[str] = ...) -> None: ...

class ReturnHomeCommand(_message.Message):
    __slots__ = []
    def __init__(self) -> None: ...

class DockShelfCommand(_message.Message):
    __slots__ = []
    def __init__(self) -> None: ...

class SpeakCommand(_message.Message):
    __slots__ = ["text"]
    TEXT_FIELD_NUMBER: _ClassVar[int]
    text: str
    def __init__(self, text: _Optional[str] = ...) -> None: ...

class MoveToPoseCommand(_message.Message):
    __slots__ = ["x", "y", "yaw"]
    X_FIELD_NUMBER: _ClassVar[int]
    Y_FIELD_NUMBER: _ClassVar[int]
    YAW_FIELD_NUMBER: _ClassVar[int]
    x: float
    y: float
    yaw: float
    def __init__(self, x: _Optional[float] = ..., y: _Optional[float] = ..., yaw: _Optional[float] = ...) -> None: ...

class EmptyRequest(_message.Message):
    __slots__ = []
    def __init__(self) -> None: ...

class GetRequest(_message.Message):
    __slots__ = ["metadata"]
    METADATA_FIELD_NUMBER: _ClassVar[int]
    metadata: Metadata
    def __init__(self, metadata: _Optional[_Union[Metadata, _Mapping]] = ...) -> None: ...

class GetRobotSerialNumberResponse(_message.Message):
    __slots__ = ["metadata", "serial_number"]
    METADATA_FIELD_NUMBER: _ClassVar[int]
    SERIAL_NUMBER_FIELD_NUMBER: _ClassVar[int]
    metadata: Metadata
    serial_number: str
    def __init__(self, metadata: _Optional[_Union[Metadata, _Mapping]] = ..., serial_number: _Optional[str] = ...) -> None: ...

class GetRobotVersionResponse(_message.Message):
    __slots__ = ["metadata", "version"]
    METADATA_FIELD_NUMBER: _ClassVar[int]
    VERSION_FIELD_NUMBER: _ClassVar[int]
    metadata: Metadata
    version: str
    def __init__(self, metadata: _Optional[_Union[Metadata, _Mapping]] = ..., version: _Optional[str] = ...) -> None: ...

class GetRobotPoseResponse(_message.Message):
    __slots__ = ["metadata", "pose"]
    METADATA_FIELD_NUMBER: _ClassVar[int]
    POSE_FIELD_NUMBER: _ClassVar[int]
    metadata: Metadata
    pose: Pose
    def __init__(self, metadata: _Optional[_Union[Metadata, _Mapping]] = ..., pose: _Optional[_Union[Pose, _Mapping]] = ...) -> None: ...

class GetPngMapResponse(_message.Message):
    __slots__ = ["metadata", "map"]
    METADATA_FIELD_NUMBER: _ClassVar[int]
    MAP_FIELD_NUMBER: _ClassVar[int]
    metadata: Metadata
    map: Map
    def __init__(self, metadata: _Optional[_Union[Metadata, _Mapping]] = ..., map: _Optional[_Union[Map, _Mapping]] = ...) -> None: ...

class GetObjectDetectionResponse(_message.Message):
    __slots__ = ["metadata", "header", "objects"]
    METADATA_FIELD_NUMBER: _ClassVar[int]
    HEADER_FIELD_NUMBER: _ClassVar[int]
    OBJECTS_FIELD_NUMBER: _ClassVar[int]
    metadata: Metadata
    header: RosHeader
    objects: _containers.RepeatedCompositeFieldContainer[ObjectDetection]
    def __init__(self, metadata: _Optional[_Union[Metadata, _Mapping]] = ..., header: _Optional[_Union[RosHeader, _Mapping]] = ..., objects: _Optional[_Iterable[_Union[ObjectDetection, _Mapping]]] = ...) -> None: ...

class GetRosImuResponse(_message.Message):
    __slots__ = ["metadata", "imu"]
    METADATA_FIELD_NUMBER: _ClassVar[int]
    IMU_FIELD_NUMBER: _ClassVar[int]
    metadata: Metadata
    imu: RosImu
    def __init__(self, metadata: _Optional[_Union[Metadata, _Mapping]] = ..., imu: _Optional[_Union[RosImu, _Mapping]] = ...) -> None: ...

class GetRosOdometryResponse(_message.Message):
    __slots__ = ["metadata", "odometry"]
    METADATA_FIELD_NUMBER: _ClassVar[int]
    ODOMETRY_FIELD_NUMBER: _ClassVar[int]
    metadata: Metadata
    odometry: RosOdometry
    def __init__(self, metadata: _Optional[_Union[Metadata, _Mapping]] = ..., odometry: _Optional[_Union[RosOdometry, _Mapping]] = ...) -> None: ...

class GetRosLaserScanResponse(_message.Message):
    __slots__ = ["metadata", "scan"]
    METADATA_FIELD_NUMBER: _ClassVar[int]
    SCAN_FIELD_NUMBER: _ClassVar[int]
    metadata: Metadata
    scan: RosLaserScan
    def __init__(self, metadata: _Optional[_Union[Metadata, _Mapping]] = ..., scan: _Optional[_Union[RosLaserScan, _Mapping]] = ...) -> None: ...

class GetFrontCameraRosCameraInfoResponse(_message.Message):
    __slots__ = ["metadata", "camera_info"]
    METADATA_FIELD_NUMBER: _ClassVar[int]
    CAMERA_INFO_FIELD_NUMBER: _ClassVar[int]
    metadata: Metadata
    camera_info: RosCameraInfo
    def __init__(self, metadata: _Optional[_Union[Metadata, _Mapping]] = ..., camera_info: _Optional[_Union[RosCameraInfo, _Mapping]] = ...) -> None: ...

class GetFrontCameraRosImageResponse(_message.Message):
    __slots__ = ["metadata", "image"]
    METADATA_FIELD_NUMBER: _ClassVar[int]
    IMAGE_FIELD_NUMBER: _ClassVar[int]
    metadata: Metadata
    image: RosImage
    def __init__(self, metadata: _Optional[_Union[Metadata, _Mapping]] = ..., image: _Optional[_Union[RosImage, _Mapping]] = ...) -> None: ...

class GetFrontCameraRosCompressedImageResponse(_message.Message):
    __slots__ = ["metadata", "image"]
    METADATA_FIELD_NUMBER: _ClassVar[int]
    IMAGE_FIELD_NUMBER: _ClassVar[int]
    metadata: Metadata
    image: RosCompressedImage
    def __init__(self, metadata: _Optional[_Union[Metadata, _Mapping]] = ..., image: _Optional[_Union[RosCompressedImage, _Mapping]] = ...) -> None: ...

class StartCommandRequest(_message.Message):
    __slots__ = ["command", "cancel_all", "tts_on_success", "title"]
    COMMAND_FIELD_NUMBER: _ClassVar[int]
    CANCEL_ALL_FIELD_NUMBER: _ClassVar[int]
    TTS_ON_SUCCESS_FIELD_NUMBER: _ClassVar[int]
    TITLE_FIELD_NUMBER: _ClassVar[int]
    command: Command
    cancel_all: bool
    tts_on_success: str
    title: str
    def __init__(self, command: _Optional[_Union[Command, _Mapping]] = ..., cancel_all: bool = ..., tts_on_success: _Optional[str] = ..., title: _Optional[str] = ...) -> None: ...

class StartCommandResponse(_message.Message):
    __slots__ = ["result", "command_id"]
    RESULT_FIELD_NUMBER: _ClassVar[int]
    COMMAND_ID_FIELD_NUMBER: _ClassVar[int]
    result: Result
    command_id: str
    def __init__(self, result: _Optional[_Union[Result, _Mapping]] = ..., command_id: _Optional[str] = ...) -> None: ...

class CancelCommandResponse(_message.Message):
    __slots__ = ["result", "command"]
    RESULT_FIELD_NUMBER: _ClassVar[int]
    COMMAND_FIELD_NUMBER: _ClassVar[int]
    result: Result
    command: Command
    def __init__(self, result: _Optional[_Union[Result, _Mapping]] = ..., command: _Optional[_Union[Command, _Mapping]] = ...) -> None: ...

class GetCommandStateResponse(_message.Message):
    __slots__ = ["metadata", "state", "command"]
    METADATA_FIELD_NUMBER: _ClassVar[int]
    STATE_FIELD_NUMBER: _ClassVar[int]
    COMMAND_FIELD_NUMBER: _ClassVar[int]
    metadata: Metadata
    state: CommandState
    command: Command
    def __init__(self, metadata: _Optional[_Union[Metadata, _Mapping]] = ..., state: _Optional[_Union[CommandState, str]] = ..., command: _Optional[_Union[Command, _Mapping]] = ...) -> None: ...

class GetLastCommandResultResponse(_message.Message):
    __slots__ = ["metadata", "result", "command"]
    METADATA_FIELD_NUMBER: _ClassVar[int]
    RESULT_FIELD_NUMBER: _ClassVar[int]
    COMMAND_FIELD_NUMBER: _ClassVar[int]
    metadata: Metadata
    result: Result
    command: Command
    def __init__(self, metadata: _Optional[_Union[Metadata, _Mapping]] = ..., result: _Optional[_Union[Result, _Mapping]] = ..., command: _Optional[_Union[Command, _Mapping]] = ...) -> None: ...

class GetLocationsResponse(_message.Message):
    __slots__ = ["metadata", "locations", "default_location_id"]
    METADATA_FIELD_NUMBER: _ClassVar[int]
    LOCATIONS_FIELD_NUMBER: _ClassVar[int]
    DEFAULT_LOCATION_ID_FIELD_NUMBER: _ClassVar[int]
    metadata: Metadata
    locations: _containers.RepeatedCompositeFieldContainer[Location]
    default_location_id: str
    def __init__(self, metadata: _Optional[_Union[Metadata, _Mapping]] = ..., locations: _Optional[_Iterable[_Union[Location, _Mapping]]] = ..., default_location_id: _Optional[str] = ...) -> None: ...

class GetShelvesResponse(_message.Message):
    __slots__ = ["metadata", "shelves"]
    METADATA_FIELD_NUMBER: _ClassVar[int]
    SHELVES_FIELD_NUMBER: _ClassVar[int]
    metadata: Metadata
    shelves: _containers.RepeatedCompositeFieldContainer[Shelf]
    def __init__(self, metadata: _Optional[_Union[Metadata, _Mapping]] = ..., shelves: _Optional[_Iterable[_Union[Shelf, _Mapping]]] = ...) -> None: ...

class SetAutoHomingEnabledRequest(_message.Message):
    __slots__ = ["enable"]
    ENABLE_FIELD_NUMBER: _ClassVar[int]
    enable: bool
    def __init__(self, enable: bool = ...) -> None: ...

class SetAutoHomingEnabledResponse(_message.Message):
    __slots__ = ["result"]
    RESULT_FIELD_NUMBER: _ClassVar[int]
    result: Result
    def __init__(self, result: _Optional[_Union[Result, _Mapping]] = ...) -> None: ...

class GetAutoHomingEnabledResponse(_message.Message):
    __slots__ = ["metadata", "enabled"]
    METADATA_FIELD_NUMBER: _ClassVar[int]
    ENABLED_FIELD_NUMBER: _ClassVar[int]
    metadata: Metadata
    enabled: bool
    def __init__(self, metadata: _Optional[_Union[Metadata, _Mapping]] = ..., enabled: bool = ...) -> None: ...

class SetManualControlEnabledRequest(_message.Message):
    __slots__ = ["enable", "use_shelf_registration"]
    ENABLE_FIELD_NUMBER: _ClassVar[int]
    USE_SHELF_REGISTRATION_FIELD_NUMBER: _ClassVar[int]
    enable: bool
    use_shelf_registration: bool
    def __init__(self, enable: bool = ..., use_shelf_registration: bool = ...) -> None: ...

class SetManualControlEnabledResponse(_message.Message):
    __slots__ = ["result"]
    RESULT_FIELD_NUMBER: _ClassVar[int]
    result: Result
    def __init__(self, result: _Optional[_Union[Result, _Mapping]] = ...) -> None: ...

class GetManualControlEnabledResponse(_message.Message):
    __slots__ = ["metadata", "enabled"]
    METADATA_FIELD_NUMBER: _ClassVar[int]
    ENABLED_FIELD_NUMBER: _ClassVar[int]
    metadata: Metadata
    enabled: bool
    def __init__(self, metadata: _Optional[_Union[Metadata, _Mapping]] = ..., enabled: bool = ...) -> None: ...

class SetRobotVelocityRequest(_message.Message):
    __slots__ = ["linear", "angular"]
    LINEAR_FIELD_NUMBER: _ClassVar[int]
    ANGULAR_FIELD_NUMBER: _ClassVar[int]
    linear: float
    angular: float
    def __init__(self, linear: _Optional[float] = ..., angular: _Optional[float] = ...) -> None: ...

class SetRobotVelocityResponse(_message.Message):
    __slots__ = ["result"]
    RESULT_FIELD_NUMBER: _ClassVar[int]
    result: Result
    def __init__(self, result: _Optional[_Union[Result, _Mapping]] = ...) -> None: ...

class History(_message.Message):
    __slots__ = ["id", "command", "success", "error_code", "command_executed_time"]
    ID_FIELD_NUMBER: _ClassVar[int]
    COMMAND_FIELD_NUMBER: _ClassVar[int]
    SUCCESS_FIELD_NUMBER: _ClassVar[int]
    ERROR_CODE_FIELD_NUMBER: _ClassVar[int]
    COMMAND_EXECUTED_TIME_FIELD_NUMBER: _ClassVar[int]
    id: str
    command: Command
    success: bool
    error_code: int
    command_executed_time: int
    def __init__(self, id: _Optional[str] = ..., command: _Optional[_Union[Command, _Mapping]] = ..., success: bool = ..., error_code: _Optional[int] = ..., command_executed_time: _Optional[int] = ...) -> None: ...

class GetHistoryListResponse(_message.Message):
    __slots__ = ["metadata", "histories"]
    METADATA_FIELD_NUMBER: _ClassVar[int]
    HISTORIES_FIELD_NUMBER: _ClassVar[int]
    metadata: Metadata
    histories: _containers.RepeatedCompositeFieldContainer[History]
    def __init__(self, metadata: _Optional[_Union[Metadata, _Mapping]] = ..., histories: _Optional[_Iterable[_Union[History, _Mapping]]] = ...) -> None: ...
