import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kachaka_api_flutter_sample/repositories/kachaka/generated/kachaka-api.pb.dart';

class MapImage extends StatelessWidget {
  final Map_ mapInfo;

  final double width;
  final double height;

  const MapImage({
    super.key,
    required this.mapInfo,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.memory(
                  Uint8List.fromList(mapInfo.data),
                  gaplessPlayback: true,
                  width: width,
                  height: height,
                  fit: BoxFit.contain,
                )
              ])
        ]);
  }
}
