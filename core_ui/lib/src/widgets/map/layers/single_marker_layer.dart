import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class SingleMarkerLayer extends StatelessWidget {
  final LatLng point;
  final Widget child;
  final double width;
  final double height;
  final Alignment alignment;

  const SingleMarkerLayer({
    super.key,
    required this.point,
    required this.child,
    this.width = 30,
    this.height = 30,
    this.alignment = Alignment.bottomCenter,
  });

  @override
  Widget build(BuildContext context) {
    return MarkerLayer(
      alignment: alignment,
      markers: [
        Marker(
          width: width,
          height: height,
          point: point,
          child: child,
          alignment: alignment,
        )
      ],
    );
  }
}
