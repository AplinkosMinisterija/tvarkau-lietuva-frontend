import 'package:flutter/material.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';

class CurrentUserLocation extends StatelessWidget {
  const CurrentUserLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return CurrentLocationLayer(
      alignPositionOnUpdate: AlignOnUpdate.always,
      alignDirectionOnUpdate: AlignOnUpdate.never,
    );
  }
}
