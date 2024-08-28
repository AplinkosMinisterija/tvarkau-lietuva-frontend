import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'map_type_switcher_button.dart';

class MapTypeSwitcher extends StatelessWidget {
  const MapTypeSwitcher({
    super.key,
    required this.width,
    required this.isMobile,
    required this.onMapTypeChange,
    required this.currentMapType,
  });

  final double width;
  final bool isMobile;
  final ValueChanged<MapType> onMapTypeChange;
  final MapType currentMapType;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        MapTypeSwitcherButton(
          width: isMobile ? width * 3 : width,
          title: 'Įprastas',
          isActive: currentMapType == MapType.normal,
          onTap: () {
            onMapTypeChange(MapType.normal);
          },
        ),
        MapTypeSwitcherButton(
          width: isMobile ? width * 3 : width,
          title: 'Palydovinis',
          isActive: currentMapType == MapType.satellite,
          onTap: () {
            onMapTypeChange(MapType.satellite);
          },
        ),
        MapTypeSwitcherButton(
          width: isMobile ? width * 3 : width,
          title: 'Hibridinis',
          isActive: currentMapType == MapType.hybrid,
          onTap: () {
            onMapTypeChange(MapType.hybrid);
          },
        ),
      ],
    );
  }
}
