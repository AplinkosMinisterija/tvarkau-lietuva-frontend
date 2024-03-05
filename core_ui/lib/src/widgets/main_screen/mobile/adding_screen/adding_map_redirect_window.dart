import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddingMapRedirectWindow extends StatefulWidget {
  const AddingMapRedirectWindow({
    super.key,
    required this.width,
    required this.selectedLocation,
  });

  final double width;
  final LatLng? selectedLocation;

  @override
  State<AddingMapRedirectWindow> createState() =>
      _AddingMapRedirectWindowState();
}

class _AddingMapRedirectWindowState extends State<AddingMapRedirectWindow> {
  @override
  Widget build(BuildContext context) {
    final selectedLocation = widget.selectedLocation;
    final initialZoom = (selectedLocation != null) ? 9.0 : 6.2;
    final initialCenter = (selectedLocation != null)
        ? selectedLocation
        : const LatLng(55.1736, 23.8948);

    return SizedBox(
      height: widget.width * 0.444,
      width: widget.width * 0.911,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            child: AppMap(
              key: Key('adding-map-redirect-window-$selectedLocation'),
              initialZoom: initialZoom,
              initialCenter: initialCenter,
              markersLayer: selectedLocation != null
                  ? AppMapMarkersLayer.fromPinLocation(selectedLocation)
                  : AppMapMarkersLayer.empty(),
              mapToolbarEnabled: false,
              scrollGesturesEnabled: false,
              zoomGesturesEnabled: false,
              controlButtonsEnabled: false,
            ),
          ),
        ],
      ),
    );
  }
}
