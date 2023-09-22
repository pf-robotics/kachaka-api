import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kachaka_api_flutter_sample/constants/settings.dart';
import 'package:kachaka_api_flutter_sample/model/map_transform_state.dart';
import 'package:kachaka_api_flutter_sample/model/pin_model.dart';
import 'package:kachaka_api_flutter_sample/repositories/kachaka/generated/kachaka-api.pb.dart';
import 'package:kachaka_api_flutter_sample/repositories/kachaka/kachaka_repository.dart';
import 'package:kachaka_api_flutter_sample/service/robot_connection_service.dart';
import 'package:kachaka_api_flutter_sample/stores/location/location_store.dart';
import 'package:kachaka_api_flutter_sample/stores/map/map_store.dart';
import 'package:kachaka_api_flutter_sample/stores/shelf/shelf_store.dart';
import 'package:kachaka_api_flutter_sample/widgets/map_widget.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locations = ref
        .watch(locationStoreProvider.select((value) => value.locations ?? []));
    final shelves =
        ref.watch(shelfStoreProvider.select((value) => value.shelves ?? []));
    final mapInfo =
        ref.watch(mapStoreProvider.select((value) => value.mapInfo));

    final mapTransformState = useState(MapTransformState.init());

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(robotConnectionServiceProvider).connect(ipAddress);
        },
        child: const Icon(Icons.refresh),
      ),
      appBar: AppBar(
        title: const Text("Kachaka Sample App"),
      ),
      body: Column(
        children: [
          const Align(
              alignment: Alignment.centerLeft,
              child: Text("connected ip address: $ipAddress")),
          Expanded(
            child: mapInfo == null
                ? const Center(child: CircularProgressIndicator())
                : MapWidget(
                    mapInfo: mapInfo,
                    pins: [
                      ...locations.map((e) => _locationPin(e, () {
                            ref.read(kachakaRepositoryProvider).startAction(
                                  Command(
                                      moveToLocationCommand:
                                          MoveToLocationCommand(
                                              targetLocationId: e.id)),
                                  cancelAll: true,
                                );
                          })),
                      ...shelves.map((e) => _shelfPin(e, () {
                            final random = math.Random();
                            final randomDestinationId =
                                locations[random.nextInt(locations.length)].id;
                            ref.read(kachakaRepositoryProvider).startAction(
                                  Command(
                                      moveShelfCommand: MoveShelfCommand(
                                          targetShelfId: e.id,
                                          destinationLocationId:
                                              randomDestinationId)),
                                  cancelAll: true,
                                );
                          })),
                    ],
                    mapTransformState: mapTransformState,
                  ),
          ),
        ],
      ),
    );
  }

  PinModel _locationPin(Location location, Function onTap) {
    return PinModel(
      pose: location.pose,
      pinCenterOffset: const Offset(18, 3),
      onTap: onTap,
      child: Image.asset(
        switch (location.type) {
          LocationType.LOCATION_TYPE_CHARGER => "assets/icons/charger.png",
          LocationType.LOCATION_TYPE_SHELF_HOME =>
            "assets/icons/shelf-home.png",
          _ => "assets/icons/location.png",
        },
        width: 36,
        height: 42,
      ),
    );
  }

  PinModel _shelfPin(Shelf shelf, Function onTap) {
    return PinModel(
      pose: shelf.pose,
      pinCenterOffset: const Offset(18, 3),
      onTap: onTap,
      child: Image.asset(
        "assets/icons/furniture.png",
        width: 36,
        height: 42,
      ),
    );
  }
}
