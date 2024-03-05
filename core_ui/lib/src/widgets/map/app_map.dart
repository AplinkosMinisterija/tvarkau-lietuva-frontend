import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AppMap extends StatefulWidget {
  final LatLng initialCenter;
  final double initialZoom;
  final AppMapMarkersLayer markersLayer;
  final MapCreatedCallback? onMapCreated;
  final CameraPositionCallback? onCameraMove;
  final ArgumentCallback<LatLng>? onTap;
  final bool scrollGesturesEnabled;
  final bool zoomGesturesEnabled;
  final bool mapToolbarEnabled;
  final bool controlButtonsEnabled;

  const AppMap({
    super.key,
    required this.markersLayer,
    this.initialCenter = const LatLng(55.1736, 23.8948),
    this.initialZoom = 7,
    this.onMapCreated,
    this.onCameraMove,
    this.onTap,
    this.scrollGesturesEnabled = true,
    this.zoomGesturesEnabled = true,
    this.mapToolbarEnabled = true,
    this.controlButtonsEnabled = true,
  });

  @override
  State<AppMap> createState() => _MainTrashMapMobileState();
}

class _MainTrashMapMobileState extends State<AppMap> {
  GoogleMapController? _googleMapController;
  MapType _mapType = MapType.normal;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget.markersLayer.markers,
      builder: (context, snapshot) {
        print(
            '_MainTrashMapMobileState Future builder ${snapshot.connectionState} ${snapshot.hasData} ${snapshot.hasError} ${snapshot.data?.length}');

        final markers = (snapshot.hasData) ? snapshot.requireData : <Marker>{};

        return Stack(
          children: [
            GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: widget.initialCenter,
                zoom: widget.initialZoom,
              ),
              markers: markers,
              onCameraMove: widget.onCameraMove,
              onTap: _onMapTap,
              scrollGesturesEnabled: widget.scrollGesturesEnabled,
              tiltGesturesEnabled: false,
              zoomControlsEnabled: false,
              mapType: _mapType,
              // Check
              mapToolbarEnabled: widget.mapToolbarEnabled,
              zoomGesturesEnabled: widget.zoomGesturesEnabled,
            ),
            if (widget.controlButtonsEnabled)
              _ButtonsLayer(
                mapType: _mapType,
                onChangeMapType: (newMapType) {
                  setState(() {
                    _mapType = newMapType;
                  });
                },
              ),
          ],
        );
      },
    );
  }

  void _onMapTap(LatLng position) {
    final onMapTap = widget.onTap;

    if (onMapTap != null) {
      onMapTap(position);
    }
  }

  void _onMapCreated(GoogleMapController controller) {
    _googleMapController = controller;

    final onMapCreated = widget.onMapCreated;
    if (onMapCreated != null) {
      onMapCreated(controller);
    }
  }
}

class _ButtonsLayer extends StatelessWidget {
  final MapType mapType;

  final void Function(MapType mapType) onChangeMapType;

  const _ButtonsLayer({
    required this.mapType,
    required this.onChangeMapType,
  });

  MapType get _toggleMapType {
    return switch (mapType) {
      MapType.normal => MapType.satellite,
      MapType.satellite => MapType.normal,
      _ => throw Exception('Illegal map type: $mapType'),
    };
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
              ),
              child: ToggleButtons(
                onPressed: (_) {},
                isSelected: const [false],
                children: [
                  switch (_toggleMapType) {
                    MapType.normal => const Icon(Icons.map),
                    _ => const Icon(Icons.satellite),
                  }
                ],
              ),
            ),
            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
              ),
              child: ToggleButtons(
                direction: Axis.vertical,
                onPressed: (int index) {
                  if (index == 0) {
                  } else {}
                },
                isSelected: const [false, false],
                children: const [
                  Icon(Icons.add),
                  Icon(Icons.remove),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
