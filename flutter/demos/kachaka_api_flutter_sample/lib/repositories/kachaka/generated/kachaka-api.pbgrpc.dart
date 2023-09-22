///
//  Generated code. Do not modify.
//  source: kachaka-api.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'kachaka-api.pb.dart' as $0;
export 'kachaka-api.pb.dart';

class KachakaApiClient extends $grpc.Client {
  static final _$getRobotSerialNumber =
      $grpc.ClientMethod<$0.GetRequest, $0.GetRobotSerialNumberResponse>(
          '/kachaka_api.KachakaApi/GetRobotSerialNumber',
          ($0.GetRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.GetRobotSerialNumberResponse.fromBuffer(value));
  static final _$getRobotVersion =
      $grpc.ClientMethod<$0.GetRequest, $0.GetRobotVersionResponse>(
          '/kachaka_api.KachakaApi/GetRobotVersion',
          ($0.GetRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.GetRobotVersionResponse.fromBuffer(value));
  static final _$getRobotPose =
      $grpc.ClientMethod<$0.GetRequest, $0.GetRobotPoseResponse>(
          '/kachaka_api.KachakaApi/GetRobotPose',
          ($0.GetRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.GetRobotPoseResponse.fromBuffer(value));
  static final _$getPngMap =
      $grpc.ClientMethod<$0.GetRequest, $0.GetPngMapResponse>(
          '/kachaka_api.KachakaApi/GetPngMap',
          ($0.GetRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.GetPngMapResponse.fromBuffer(value));
  static final _$getObjectDetection =
      $grpc.ClientMethod<$0.GetRequest, $0.GetObjectDetectionResponse>(
          '/kachaka_api.KachakaApi/GetObjectDetection',
          ($0.GetRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.GetObjectDetectionResponse.fromBuffer(value));
  static final _$getRosImu =
      $grpc.ClientMethod<$0.GetRequest, $0.GetRosImuResponse>(
          '/kachaka_api.KachakaApi/GetRosImu',
          ($0.GetRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.GetRosImuResponse.fromBuffer(value));
  static final _$getRosOdometry =
      $grpc.ClientMethod<$0.GetRequest, $0.GetRosOdometryResponse>(
          '/kachaka_api.KachakaApi/GetRosOdometry',
          ($0.GetRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.GetRosOdometryResponse.fromBuffer(value));
  static final _$getRosLaserScan =
      $grpc.ClientMethod<$0.GetRequest, $0.GetRosLaserScanResponse>(
          '/kachaka_api.KachakaApi/GetRosLaserScan',
          ($0.GetRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.GetRosLaserScanResponse.fromBuffer(value));
  static final _$getFrontCameraRosCameraInfo =
      $grpc.ClientMethod<$0.GetRequest, $0.GetFrontCameraRosCameraInfoResponse>(
          '/kachaka_api.KachakaApi/GetFrontCameraRosCameraInfo',
          ($0.GetRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.GetFrontCameraRosCameraInfoResponse.fromBuffer(value));
  static final _$getFrontCameraRosImage =
      $grpc.ClientMethod<$0.GetRequest, $0.GetFrontCameraRosImageResponse>(
          '/kachaka_api.KachakaApi/GetFrontCameraRosImage',
          ($0.GetRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.GetFrontCameraRosImageResponse.fromBuffer(value));
  static final _$getFrontCameraRosCompressedImage = $grpc.ClientMethod<
          $0.GetRequest, $0.GetFrontCameraRosCompressedImageResponse>(
      '/kachaka_api.KachakaApi/GetFrontCameraRosCompressedImage',
      ($0.GetRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.GetFrontCameraRosCompressedImageResponse.fromBuffer(value));
  static final _$startCommand =
      $grpc.ClientMethod<$0.StartCommandRequest, $0.StartCommandResponse>(
          '/kachaka_api.KachakaApi/StartCommand',
          ($0.StartCommandRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.StartCommandResponse.fromBuffer(value));
  static final _$cancelCommand =
      $grpc.ClientMethod<$0.EmptyRequest, $0.CancelCommandResponse>(
          '/kachaka_api.KachakaApi/CancelCommand',
          ($0.EmptyRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.CancelCommandResponse.fromBuffer(value));
  static final _$getCommandState =
      $grpc.ClientMethod<$0.GetRequest, $0.GetCommandStateResponse>(
          '/kachaka_api.KachakaApi/GetCommandState',
          ($0.GetRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.GetCommandStateResponse.fromBuffer(value));
  static final _$getLastCommandResult =
      $grpc.ClientMethod<$0.GetRequest, $0.GetLastCommandResultResponse>(
          '/kachaka_api.KachakaApi/GetLastCommandResult',
          ($0.GetRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.GetLastCommandResultResponse.fromBuffer(value));
  static final _$getLocations =
      $grpc.ClientMethod<$0.GetRequest, $0.GetLocationsResponse>(
          '/kachaka_api.KachakaApi/GetLocations',
          ($0.GetRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.GetLocationsResponse.fromBuffer(value));
  static final _$getShelves =
      $grpc.ClientMethod<$0.GetRequest, $0.GetShelvesResponse>(
          '/kachaka_api.KachakaApi/GetShelves',
          ($0.GetRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.GetShelvesResponse.fromBuffer(value));
  static final _$setAutoHomingEnabled = $grpc.ClientMethod<
          $0.SetAutoHomingEnabledRequest, $0.SetAutoHomingEnabledResponse>(
      '/kachaka_api.KachakaApi/SetAutoHomingEnabled',
      ($0.SetAutoHomingEnabledRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.SetAutoHomingEnabledResponse.fromBuffer(value));
  static final _$getAutoHomingEnabled =
      $grpc.ClientMethod<$0.GetRequest, $0.GetAutoHomingEnabledResponse>(
          '/kachaka_api.KachakaApi/GetAutoHomingEnabled',
          ($0.GetRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.GetAutoHomingEnabledResponse.fromBuffer(value));
  static final _$setManualControlEnabled = $grpc.ClientMethod<
          $0.SetManualControlEnabledRequest,
          $0.SetManualControlEnabledResponse>(
      '/kachaka_api.KachakaApi/SetManualControlEnabled',
      ($0.SetManualControlEnabledRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.SetManualControlEnabledResponse.fromBuffer(value));
  static final _$getManualControlEnabled =
      $grpc.ClientMethod<$0.GetRequest, $0.GetManualControlEnabledResponse>(
          '/kachaka_api.KachakaApi/GetManualControlEnabled',
          ($0.GetRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.GetManualControlEnabledResponse.fromBuffer(value));
  static final _$setRobotVelocity = $grpc.ClientMethod<
          $0.SetRobotVelocityRequest, $0.SetRobotVelocityResponse>(
      '/kachaka_api.KachakaApi/SetRobotVelocity',
      ($0.SetRobotVelocityRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.SetRobotVelocityResponse.fromBuffer(value));
  static final _$getHistoryList =
      $grpc.ClientMethod<$0.GetRequest, $0.GetHistoryListResponse>(
          '/kachaka_api.KachakaApi/GetHistoryList',
          ($0.GetRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.GetHistoryListResponse.fromBuffer(value));
  static final _$getStaticTransform =
      $grpc.ClientMethod<$0.GetRequest, $0.GetStaticTransformResponse>(
          '/kachaka_api.KachakaApi/GetStaticTransform',
          ($0.GetRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.GetStaticTransformResponse.fromBuffer(value));
  static final _$getDynamicTransform =
      $grpc.ClientMethod<$0.EmptyRequest, $0.GetDynamicTransformResponse>(
          '/kachaka_api.KachakaApi/GetDynamicTransform',
          ($0.EmptyRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.GetDynamicTransformResponse.fromBuffer(value));

  KachakaApiClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.GetRobotSerialNumberResponse> getRobotSerialNumber(
      $0.GetRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getRobotSerialNumber, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetRobotVersionResponse> getRobotVersion(
      $0.GetRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getRobotVersion, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetRobotPoseResponse> getRobotPose(
      $0.GetRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getRobotPose, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetPngMapResponse> getPngMap($0.GetRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getPngMap, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetObjectDetectionResponse> getObjectDetection(
      $0.GetRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getObjectDetection, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetRosImuResponse> getRosImu($0.GetRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getRosImu, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetRosOdometryResponse> getRosOdometry(
      $0.GetRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getRosOdometry, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetRosLaserScanResponse> getRosLaserScan(
      $0.GetRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getRosLaserScan, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetFrontCameraRosCameraInfoResponse>
      getFrontCameraRosCameraInfo($0.GetRequest request,
          {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getFrontCameraRosCameraInfo, request,
        options: options);
  }

  $grpc.ResponseFuture<$0.GetFrontCameraRosImageResponse>
      getFrontCameraRosImage($0.GetRequest request,
          {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getFrontCameraRosImage, request,
        options: options);
  }

  $grpc.ResponseFuture<$0.GetFrontCameraRosCompressedImageResponse>
      getFrontCameraRosCompressedImage($0.GetRequest request,
          {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getFrontCameraRosCompressedImage, request,
        options: options);
  }

  $grpc.ResponseFuture<$0.StartCommandResponse> startCommand(
      $0.StartCommandRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$startCommand, request, options: options);
  }

  $grpc.ResponseFuture<$0.CancelCommandResponse> cancelCommand(
      $0.EmptyRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$cancelCommand, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetCommandStateResponse> getCommandState(
      $0.GetRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getCommandState, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetLastCommandResultResponse> getLastCommandResult(
      $0.GetRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getLastCommandResult, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetLocationsResponse> getLocations(
      $0.GetRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getLocations, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetShelvesResponse> getShelves($0.GetRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getShelves, request, options: options);
  }

  $grpc.ResponseFuture<$0.SetAutoHomingEnabledResponse> setAutoHomingEnabled(
      $0.SetAutoHomingEnabledRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$setAutoHomingEnabled, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetAutoHomingEnabledResponse> getAutoHomingEnabled(
      $0.GetRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getAutoHomingEnabled, request, options: options);
  }

  $grpc.ResponseFuture<$0.SetManualControlEnabledResponse>
      setManualControlEnabled($0.SetManualControlEnabledRequest request,
          {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$setManualControlEnabled, request,
        options: options);
  }

  $grpc.ResponseFuture<$0.GetManualControlEnabledResponse>
      getManualControlEnabled($0.GetRequest request,
          {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getManualControlEnabled, request,
        options: options);
  }

  $grpc.ResponseFuture<$0.SetRobotVelocityResponse> setRobotVelocity(
      $0.SetRobotVelocityRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$setRobotVelocity, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetHistoryListResponse> getHistoryList(
      $0.GetRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getHistoryList, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetStaticTransformResponse> getStaticTransform(
      $0.GetRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getStaticTransform, request, options: options);
  }

  $grpc.ResponseStream<$0.GetDynamicTransformResponse> getDynamicTransform(
      $0.EmptyRequest request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$getDynamicTransform, $async.Stream.fromIterable([request]),
        options: options);
  }
}

abstract class KachakaApiServiceBase extends $grpc.Service {
  $core.String get $name => 'kachaka_api.KachakaApi';

  KachakaApiServiceBase() {
    $addMethod(
        $grpc.ServiceMethod<$0.GetRequest, $0.GetRobotSerialNumberResponse>(
            'GetRobotSerialNumber',
            getRobotSerialNumber_Pre,
            false,
            false,
            ($core.List<$core.int> value) => $0.GetRequest.fromBuffer(value),
            ($0.GetRobotSerialNumberResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetRequest, $0.GetRobotVersionResponse>(
        'GetRobotVersion',
        getRobotVersion_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetRequest.fromBuffer(value),
        ($0.GetRobotVersionResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetRequest, $0.GetRobotPoseResponse>(
        'GetRobotPose',
        getRobotPose_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetRequest.fromBuffer(value),
        ($0.GetRobotPoseResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetRequest, $0.GetPngMapResponse>(
        'GetPngMap',
        getPngMap_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetRequest.fromBuffer(value),
        ($0.GetPngMapResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.GetRequest, $0.GetObjectDetectionResponse>(
            'GetObjectDetection',
            getObjectDetection_Pre,
            false,
            false,
            ($core.List<$core.int> value) => $0.GetRequest.fromBuffer(value),
            ($0.GetObjectDetectionResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetRequest, $0.GetRosImuResponse>(
        'GetRosImu',
        getRosImu_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetRequest.fromBuffer(value),
        ($0.GetRosImuResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetRequest, $0.GetRosOdometryResponse>(
        'GetRosOdometry',
        getRosOdometry_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetRequest.fromBuffer(value),
        ($0.GetRosOdometryResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetRequest, $0.GetRosLaserScanResponse>(
        'GetRosLaserScan',
        getRosLaserScan_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetRequest.fromBuffer(value),
        ($0.GetRosLaserScanResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetRequest,
            $0.GetFrontCameraRosCameraInfoResponse>(
        'GetFrontCameraRosCameraInfo',
        getFrontCameraRosCameraInfo_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetRequest.fromBuffer(value),
        ($0.GetFrontCameraRosCameraInfoResponse value) =>
            value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.GetRequest, $0.GetFrontCameraRosImageResponse>(
            'GetFrontCameraRosImage',
            getFrontCameraRosImage_Pre,
            false,
            false,
            ($core.List<$core.int> value) => $0.GetRequest.fromBuffer(value),
            ($0.GetFrontCameraRosImageResponse value) =>
                value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetRequest,
            $0.GetFrontCameraRosCompressedImageResponse>(
        'GetFrontCameraRosCompressedImage',
        getFrontCameraRosCompressedImage_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetRequest.fromBuffer(value),
        ($0.GetFrontCameraRosCompressedImageResponse value) =>
            value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.StartCommandRequest, $0.StartCommandResponse>(
            'StartCommand',
            startCommand_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.StartCommandRequest.fromBuffer(value),
            ($0.StartCommandResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.EmptyRequest, $0.CancelCommandResponse>(
        'CancelCommand',
        cancelCommand_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.EmptyRequest.fromBuffer(value),
        ($0.CancelCommandResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetRequest, $0.GetCommandStateResponse>(
        'GetCommandState',
        getCommandState_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetRequest.fromBuffer(value),
        ($0.GetCommandStateResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.GetRequest, $0.GetLastCommandResultResponse>(
            'GetLastCommandResult',
            getLastCommandResult_Pre,
            false,
            false,
            ($core.List<$core.int> value) => $0.GetRequest.fromBuffer(value),
            ($0.GetLastCommandResultResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetRequest, $0.GetLocationsResponse>(
        'GetLocations',
        getLocations_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetRequest.fromBuffer(value),
        ($0.GetLocationsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetRequest, $0.GetShelvesResponse>(
        'GetShelves',
        getShelves_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetRequest.fromBuffer(value),
        ($0.GetShelvesResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.SetAutoHomingEnabledRequest,
            $0.SetAutoHomingEnabledResponse>(
        'SetAutoHomingEnabled',
        setAutoHomingEnabled_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.SetAutoHomingEnabledRequest.fromBuffer(value),
        ($0.SetAutoHomingEnabledResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.GetRequest, $0.GetAutoHomingEnabledResponse>(
            'GetAutoHomingEnabled',
            getAutoHomingEnabled_Pre,
            false,
            false,
            ($core.List<$core.int> value) => $0.GetRequest.fromBuffer(value),
            ($0.GetAutoHomingEnabledResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.SetManualControlEnabledRequest,
            $0.SetManualControlEnabledResponse>(
        'SetManualControlEnabled',
        setManualControlEnabled_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.SetManualControlEnabledRequest.fromBuffer(value),
        ($0.SetManualControlEnabledResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.GetRequest, $0.GetManualControlEnabledResponse>(
            'GetManualControlEnabled',
            getManualControlEnabled_Pre,
            false,
            false,
            ($core.List<$core.int> value) => $0.GetRequest.fromBuffer(value),
            ($0.GetManualControlEnabledResponse value) =>
                value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.SetRobotVelocityRequest,
            $0.SetRobotVelocityResponse>(
        'SetRobotVelocity',
        setRobotVelocity_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.SetRobotVelocityRequest.fromBuffer(value),
        ($0.SetRobotVelocityResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetRequest, $0.GetHistoryListResponse>(
        'GetHistoryList',
        getHistoryList_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetRequest.fromBuffer(value),
        ($0.GetHistoryListResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.GetRequest, $0.GetStaticTransformResponse>(
            'GetStaticTransform',
            getStaticTransform_Pre,
            false,
            false,
            ($core.List<$core.int> value) => $0.GetRequest.fromBuffer(value),
            ($0.GetStaticTransformResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.EmptyRequest, $0.GetDynamicTransformResponse>(
            'GetDynamicTransform',
            getDynamicTransform_Pre,
            false,
            true,
            ($core.List<$core.int> value) => $0.EmptyRequest.fromBuffer(value),
            ($0.GetDynamicTransformResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.GetRobotSerialNumberResponse> getRobotSerialNumber_Pre(
      $grpc.ServiceCall call, $async.Future<$0.GetRequest> request) async {
    return getRobotSerialNumber(call, await request);
  }

  $async.Future<$0.GetRobotVersionResponse> getRobotVersion_Pre(
      $grpc.ServiceCall call, $async.Future<$0.GetRequest> request) async {
    return getRobotVersion(call, await request);
  }

  $async.Future<$0.GetRobotPoseResponse> getRobotPose_Pre(
      $grpc.ServiceCall call, $async.Future<$0.GetRequest> request) async {
    return getRobotPose(call, await request);
  }

  $async.Future<$0.GetPngMapResponse> getPngMap_Pre(
      $grpc.ServiceCall call, $async.Future<$0.GetRequest> request) async {
    return getPngMap(call, await request);
  }

  $async.Future<$0.GetObjectDetectionResponse> getObjectDetection_Pre(
      $grpc.ServiceCall call, $async.Future<$0.GetRequest> request) async {
    return getObjectDetection(call, await request);
  }

  $async.Future<$0.GetRosImuResponse> getRosImu_Pre(
      $grpc.ServiceCall call, $async.Future<$0.GetRequest> request) async {
    return getRosImu(call, await request);
  }

  $async.Future<$0.GetRosOdometryResponse> getRosOdometry_Pre(
      $grpc.ServiceCall call, $async.Future<$0.GetRequest> request) async {
    return getRosOdometry(call, await request);
  }

  $async.Future<$0.GetRosLaserScanResponse> getRosLaserScan_Pre(
      $grpc.ServiceCall call, $async.Future<$0.GetRequest> request) async {
    return getRosLaserScan(call, await request);
  }

  $async.Future<$0.GetFrontCameraRosCameraInfoResponse>
      getFrontCameraRosCameraInfo_Pre(
          $grpc.ServiceCall call, $async.Future<$0.GetRequest> request) async {
    return getFrontCameraRosCameraInfo(call, await request);
  }

  $async.Future<$0.GetFrontCameraRosImageResponse> getFrontCameraRosImage_Pre(
      $grpc.ServiceCall call, $async.Future<$0.GetRequest> request) async {
    return getFrontCameraRosImage(call, await request);
  }

  $async.Future<$0.GetFrontCameraRosCompressedImageResponse>
      getFrontCameraRosCompressedImage_Pre(
          $grpc.ServiceCall call, $async.Future<$0.GetRequest> request) async {
    return getFrontCameraRosCompressedImage(call, await request);
  }

  $async.Future<$0.StartCommandResponse> startCommand_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.StartCommandRequest> request) async {
    return startCommand(call, await request);
  }

  $async.Future<$0.CancelCommandResponse> cancelCommand_Pre(
      $grpc.ServiceCall call, $async.Future<$0.EmptyRequest> request) async {
    return cancelCommand(call, await request);
  }

  $async.Future<$0.GetCommandStateResponse> getCommandState_Pre(
      $grpc.ServiceCall call, $async.Future<$0.GetRequest> request) async {
    return getCommandState(call, await request);
  }

  $async.Future<$0.GetLastCommandResultResponse> getLastCommandResult_Pre(
      $grpc.ServiceCall call, $async.Future<$0.GetRequest> request) async {
    return getLastCommandResult(call, await request);
  }

  $async.Future<$0.GetLocationsResponse> getLocations_Pre(
      $grpc.ServiceCall call, $async.Future<$0.GetRequest> request) async {
    return getLocations(call, await request);
  }

  $async.Future<$0.GetShelvesResponse> getShelves_Pre(
      $grpc.ServiceCall call, $async.Future<$0.GetRequest> request) async {
    return getShelves(call, await request);
  }

  $async.Future<$0.SetAutoHomingEnabledResponse> setAutoHomingEnabled_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.SetAutoHomingEnabledRequest> request) async {
    return setAutoHomingEnabled(call, await request);
  }

  $async.Future<$0.GetAutoHomingEnabledResponse> getAutoHomingEnabled_Pre(
      $grpc.ServiceCall call, $async.Future<$0.GetRequest> request) async {
    return getAutoHomingEnabled(call, await request);
  }

  $async.Future<$0.SetManualControlEnabledResponse> setManualControlEnabled_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.SetManualControlEnabledRequest> request) async {
    return setManualControlEnabled(call, await request);
  }

  $async.Future<$0.GetManualControlEnabledResponse> getManualControlEnabled_Pre(
      $grpc.ServiceCall call, $async.Future<$0.GetRequest> request) async {
    return getManualControlEnabled(call, await request);
  }

  $async.Future<$0.SetRobotVelocityResponse> setRobotVelocity_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.SetRobotVelocityRequest> request) async {
    return setRobotVelocity(call, await request);
  }

  $async.Future<$0.GetHistoryListResponse> getHistoryList_Pre(
      $grpc.ServiceCall call, $async.Future<$0.GetRequest> request) async {
    return getHistoryList(call, await request);
  }

  $async.Future<$0.GetStaticTransformResponse> getStaticTransform_Pre(
      $grpc.ServiceCall call, $async.Future<$0.GetRequest> request) async {
    return getStaticTransform(call, await request);
  }

  $async.Stream<$0.GetDynamicTransformResponse> getDynamicTransform_Pre(
      $grpc.ServiceCall call, $async.Future<$0.EmptyRequest> request) async* {
    yield* getDynamicTransform(call, await request);
  }

  $async.Future<$0.GetRobotSerialNumberResponse> getRobotSerialNumber(
      $grpc.ServiceCall call, $0.GetRequest request);
  $async.Future<$0.GetRobotVersionResponse> getRobotVersion(
      $grpc.ServiceCall call, $0.GetRequest request);
  $async.Future<$0.GetRobotPoseResponse> getRobotPose(
      $grpc.ServiceCall call, $0.GetRequest request);
  $async.Future<$0.GetPngMapResponse> getPngMap(
      $grpc.ServiceCall call, $0.GetRequest request);
  $async.Future<$0.GetObjectDetectionResponse> getObjectDetection(
      $grpc.ServiceCall call, $0.GetRequest request);
  $async.Future<$0.GetRosImuResponse> getRosImu(
      $grpc.ServiceCall call, $0.GetRequest request);
  $async.Future<$0.GetRosOdometryResponse> getRosOdometry(
      $grpc.ServiceCall call, $0.GetRequest request);
  $async.Future<$0.GetRosLaserScanResponse> getRosLaserScan(
      $grpc.ServiceCall call, $0.GetRequest request);
  $async.Future<$0.GetFrontCameraRosCameraInfoResponse>
      getFrontCameraRosCameraInfo(
          $grpc.ServiceCall call, $0.GetRequest request);
  $async.Future<$0.GetFrontCameraRosImageResponse> getFrontCameraRosImage(
      $grpc.ServiceCall call, $0.GetRequest request);
  $async.Future<$0.GetFrontCameraRosCompressedImageResponse>
      getFrontCameraRosCompressedImage(
          $grpc.ServiceCall call, $0.GetRequest request);
  $async.Future<$0.StartCommandResponse> startCommand(
      $grpc.ServiceCall call, $0.StartCommandRequest request);
  $async.Future<$0.CancelCommandResponse> cancelCommand(
      $grpc.ServiceCall call, $0.EmptyRequest request);
  $async.Future<$0.GetCommandStateResponse> getCommandState(
      $grpc.ServiceCall call, $0.GetRequest request);
  $async.Future<$0.GetLastCommandResultResponse> getLastCommandResult(
      $grpc.ServiceCall call, $0.GetRequest request);
  $async.Future<$0.GetLocationsResponse> getLocations(
      $grpc.ServiceCall call, $0.GetRequest request);
  $async.Future<$0.GetShelvesResponse> getShelves(
      $grpc.ServiceCall call, $0.GetRequest request);
  $async.Future<$0.SetAutoHomingEnabledResponse> setAutoHomingEnabled(
      $grpc.ServiceCall call, $0.SetAutoHomingEnabledRequest request);
  $async.Future<$0.GetAutoHomingEnabledResponse> getAutoHomingEnabled(
      $grpc.ServiceCall call, $0.GetRequest request);
  $async.Future<$0.SetManualControlEnabledResponse> setManualControlEnabled(
      $grpc.ServiceCall call, $0.SetManualControlEnabledRequest request);
  $async.Future<$0.GetManualControlEnabledResponse> getManualControlEnabled(
      $grpc.ServiceCall call, $0.GetRequest request);
  $async.Future<$0.SetRobotVelocityResponse> setRobotVelocity(
      $grpc.ServiceCall call, $0.SetRobotVelocityRequest request);
  $async.Future<$0.GetHistoryListResponse> getHistoryList(
      $grpc.ServiceCall call, $0.GetRequest request);
  $async.Future<$0.GetStaticTransformResponse> getStaticTransform(
      $grpc.ServiceCall call, $0.GetRequest request);
  $async.Stream<$0.GetDynamicTransformResponse> getDynamicTransform(
      $grpc.ServiceCall call, $0.EmptyRequest request);
}
