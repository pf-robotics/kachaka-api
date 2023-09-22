import 'package:flutter/cupertino.dart';
import 'package:kachaka_api_flutter_sample/model/map_layout_model.dart';
import 'package:kachaka_api_flutter_sample/repositories/kachaka/generated/kachaka-api.pb.dart';

class MapHelper {
  /// calculate the Size and position of MapImage on the screen.
  static MapLayoutInfo calcMapSize({
    required Map_ mapInfo,
    required BoxConstraints constraints,
  }) {
    final mapRatio = mapInfo.width / mapInfo.height;
    double mapWidth;
    double mapHeight;
    if (mapRatio > constraints.maxWidth / constraints.maxHeight) {
      mapWidth = constraints.maxWidth;
      mapHeight = mapWidth / mapRatio;
    } else {
      mapHeight = constraints.maxHeight;
      mapWidth = mapHeight * mapRatio;
    }

    final leftOffset = (constraints.maxWidth - mapWidth) / 2;
    final bottomOffset = (constraints.maxHeight - mapHeight) / 2;

    return MapLayoutInfo(
      mapWidth: mapWidth,
      mapHeight: mapHeight,
      leftOffset: leftOffset,
      bottomOffset: bottomOffset,
    );
  }

  /// calculate the position of a Pin on the screen.
  static List<double> pinWidgetToMapLocation({
    required Map_ mapInfo,
    required Pose pose,
    required double pinCenterFormLeft,
    required double pinCenterFromBottom,
    required MapLayoutInfo layoutInfo,
  }) {
    final leftOffset = layoutInfo.leftOffset;
    final bottomOffset = layoutInfo.bottomOffset;
    final mapWidth = layoutInfo.mapWidth;
    final mapHeight = layoutInfo.mapHeight;

    // width * resolution = x_max - x_min (m)
    // 画像のpixelから表示用のpixelに変換
    final xPixel = (pose.x - mapInfo.origin.x) / mapInfo.resolution;
    final yPixel = (pose.y - mapInfo.origin.y) / mapInfo.resolution;

    final left =
        mapWidth / mapInfo.width * xPixel + leftOffset - pinCenterFormLeft;
    final bottom = mapHeight / mapInfo.height * yPixel +
        bottomOffset -
        pinCenterFromBottom;
    return [left, bottom];
  }
}
