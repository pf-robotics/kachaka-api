import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kachaka_api_flutter_sample/model/map_transform_state.dart';
import 'package:kachaka_api_flutter_sample/model/pin_model.dart';
import 'package:kachaka_api_flutter_sample/repositories/kachaka/generated/kachaka-api.pb.dart';
import 'package:kachaka_api_flutter_sample/utils/helpers/map_helper.dart';
import 'package:kachaka_api_flutter_sample/widgets/map_image.dart';
import 'package:kachaka_api_flutter_sample/widgets/robot_widget.dart';

class MapWidget extends HookConsumerWidget {
  final Map_ mapInfo;
  final List<PinModel> pins;
  final ValueNotifier<MapTransformState> mapTransformState;

  const MapWidget({
    super.key,
    required this.mapInfo,
    required this.pins,
    required this.mapTransformState,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transformationController = useTransformationController();
    return LayoutBuilder(builder: (context, constraints) {
      return HookBuilder(builder: (context) {
        // cache layout information
        final mapLayout = useMemoized(
            () => MapHelper.calcMapSize(
                  mapInfo: mapInfo,
                  constraints: constraints,
                ),
            [mapInfo, constraints]);
        return InteractiveViewer(
          transformationController: transformationController,
          // todo(anishi-pfr)
          // rotateEnabled: enableInteraction,
          maxScale: double.infinity,
          minScale: 0.2,
          onInteractionUpdate: (details) {
            final scale = transformationController.value.getMaxScaleOnAxis();
            mapTransformState.value =
                mapTransformState.value.copyWith(scale: scale);
          },
          scaleEnabled: true,
          panEnabled: true,
          child: Stack(
            fit: StackFit.expand,
            alignment: AlignmentDirectional.center,
            clipBehavior: Clip.none,
            children: [
              MapImage(
                mapInfo: mapInfo,
                width: mapLayout.mapWidth,
                height: mapLayout.mapHeight,
              ),
              RobotWidget(
                mapInfo: mapInfo,
                layoutInfo: mapLayout,
              ),
              ...pins.map(
                (e) {
                  final scaleFactor = e.shouldScale
                      ? 1.0 /
                          (mapTransformState.value.scale == 0
                              ? 0.01
                              : mapTransformState.value.scale)
                      : 1.0;
                  final loc = MapHelper.pinWidgetToMapLocation(
                    mapInfo: mapInfo,
                    pose: e.pose,
                    pinCenterFormLeft: e.pinCenterOffset.dx * scaleFactor,
                    pinCenterFromBottom: e.pinCenterOffset.dy * scaleFactor,
                    layoutInfo: mapLayout,
                  );
                  return Positioned(
                    left: loc[0],
                    bottom: loc[1],
                    child: Transform.scale(
                      alignment: Alignment.bottomLeft,
                      scale: scaleFactor,
                      child: GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () => e.onTap?.call(),
                        child: e.child,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      });
    });
  }
}
