import 'package:api_client/api_client.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';

class DumpsLayer extends StatefulWidget {
  final List<DumpDto> dumps;

  const DumpsLayer({
    super.key,
    required this.dumps,
  });

  @override
  State<DumpsLayer> createState() => _DumpsLayerState();
}

class _DumpsLayerState extends State<DumpsLayer> {
  late final _markers =
      widget.dumps.map(_dumpsToMarker).toList(growable: false);

  @override
  Widget build(BuildContext context) {
    return MarkerClusterLayerWidget(
      options: MarkerClusterLayerOptions(
        maxClusterRadius: 60,
        size: const Size(40, 40),
        alignment: Alignment.center,
        padding: const EdgeInsets.all(50),
        forceIntegerZoomLevel: true,
        disableClusteringAtZoom: 12,
        markers: _markers,
        popupOptions: PopupOptions(
          popupSnap: PopupSnap.markerTop,
          popupController: context.read<PopupController>(),
          popupBuilder: (context, marker) {
            final dump = (marker.key as ObjectKey).value as DumpDto;

            return InfoDumpWindowBox(
              title: dump.name,
              address: dump.address ?? '',
              phone: dump.phone ?? '',
              workingHours: dump.workingHours ?? '',
              moreInformation: dump.moreInformation ?? '',
              isHovering: (bool value) {},
            );
          },
        ),
        builder: (context, markers) {
          return MouseRegion(
            cursor: SystemMouseCursors.click,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.teal,
              ),
              child: Center(
                child: Text(
                  markers.length.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Marker _dumpsToMarker(DumpDto dump) {
    return Marker(
      key: ObjectKey(dump),
      point: LatLng(
        dump.reportLat,
        dump.reportLong,
      ),
      width: 50,
      height: 50,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: SvgPicture.asset(
          'assets/svg/dump_icon.svg',
          key: const Key('dump-icon'),
          semanticsLabel: dump.name,
        ),
      ),
    );
  }
}
