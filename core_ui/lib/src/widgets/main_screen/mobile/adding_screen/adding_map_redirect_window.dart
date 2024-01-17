import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/src/map/controller/map_controller.dart';
import 'package:flutter_svg/svg.dart';
import 'package:latlong2/latlong.dart';

class AddingMapRedirectWindow extends StatelessWidget {
  const AddingMapRedirectWindow({
    super.key,
    required this.width,
    required this.location,
    required this.mapController,
  });

  final MapController mapController;
  final double width;
  final LatLng? location;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: width * 0.444,
      width: width * 0.911,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            child: OSMMap(
              mapController: mapController,
              initialCenter: location,
              initialZoom: location != null ? 8 : null,
              disableInteractiveMap: true,
              layers: [
                if (location != null)
                  SingleMarkerLayer(
                    point: location!,
                    child: SvgPicture.asset(
                      'assets/svg/pin_icon.svg',
                      excludeFromSemantics: true,
                    ),
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
