import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

class MapView extends StatefulWidget {
  const MapView({super.key});

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  final MapController _mapController = MapController.withPosition(
    initPosition: GeoPoint(
      latitude: 48.849279140662816,
      longitude: 2.3896859220903903,
    ),
  );

  @override
  void initState() {
    super.initState();

    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
    //   await Future.delayed(const Duration(seconds: 2));
    //   _mapController.setZoom(zoomLevel: 12);
    // });
  }

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        OSMFlutter(
          controller: _mapController,
          osmOption: const OSMOption(),
        ),
        Column(
          children: [
            ElevatedButton(
              onPressed: () => _mapController.zoomIn(),
              child: const Text('+'),
            ),
            ElevatedButton(
              onPressed: () => _mapController.zoomOut(),
              child: const Text('-'),
            ),
          ],
        ),
      ],
    );
  }
}
