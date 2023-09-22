import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kachaka_api_flutter_sample/constants/settings.dart';
import 'package:kachaka_api_flutter_sample/model/map_layout_model.dart';
import 'package:kachaka_api_flutter_sample/repositories/kachaka/generated/kachaka-api.pb.dart';
import 'package:kachaka_api_flutter_sample/stores/robot/robot_store.dart';
import 'package:kachaka_api_flutter_sample/utils/helpers/map_helper.dart';

class RobotWidget extends HookConsumerWidget {
  final Map_ mapInfo;
  final MapLayoutInfo layoutInfo;
  const RobotWidget({
    super.key,
    required this.mapInfo,
    required this.layoutInfo,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final robotPose =
        ref.watch(robotStoreProvider.select((value) => value.pose));

    if (robotPose == null) {
      return Container();
    }

    /// calculate width and height pix on this screen
    /// from mapLayout and actualSize of Kachaka.
    final width =
        robotDepth / (mapInfo.width * mapInfo.resolution) * layoutInfo.mapWidth;
    final height = robotWidth /
        (mapInfo.height * mapInfo.resolution) *
        layoutInfo.mapHeight;

    final loc = MapHelper.pinWidgetToMapLocation(
      mapInfo: mapInfo,
      pose: robotPose,
      pinCenterFromBottom: height / 2.0,
      pinCenterFormLeft: 0,
      layoutInfo: layoutInfo,
    );

    return Positioned(
      left: loc[0],
      bottom: loc[1],
      child: IgnorePointer(
        ignoring: true,
        // 回転するのでその分だけ少し広めにwidgetを確保する
        child: Stack(
          alignment: Alignment.center,
          children: [
            Transform.rotate(
              angle: -robotPose.theta,
              child: Image.asset(
                "assets/icons/kachaka.png",
                width: width,
                height: height,
                fit: BoxFit.fill,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
