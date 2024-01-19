import 'package:api_client/api_client.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';

class FullDumpsLayer extends StatefulWidget {
  final List<FullDumpDto> dumps;
  final Function(FullDumpDto dump)? onTap;

  const FullDumpsLayer({
    super.key,
    required this.dumps,
    this.onTap,
  });

  @override
  State<FullDumpsLayer> createState() => _FullDumpsLayerState();
}

class _FullDumpsLayerState extends State<FullDumpsLayer> {
  late final _markers =
      widget.dumps.map(_dumpsToMarker).toList(growable: false);

  @override
  Widget build(BuildContext context) {
    return MarkerLayer(markers: _markers);
  }

  Marker _dumpsToMarker(FullDumpDto dump) {
    return Marker(
      key: ObjectKey(dump),
      point: LatLng(
        dump.latitude,
        dump.longitude,
      ),
      width: 50,
      height: 50,
      alignment: Alignment.topCenter,
      child: GestureDetector(
        onTap: widget.onTap != null ? () => widget.onTap!(dump) : null,
        child: MarkerIconFactory.dump(),
      ),
    );
  }
}
