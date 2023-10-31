import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'map_type_switcher_button.dart';

class MapTypeSwitcher extends StatefulWidget {
  const MapTypeSwitcher({
    required this.width,
    required this.onMapTypeChange,
    required this.currentMapType,
  });

  final double width;
  final ValueChanged<MapType> onMapTypeChange;
  final MapType currentMapType;

  @override
  State<MapTypeSwitcher> createState() => _MapTypeSwitcherState();
}

class _MapTypeSwitcherState extends State<MapTypeSwitcher> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        MapTypeSwitcherButton(
          width: widget.width,
          title: 'Įprastas',
          isActive: widget.currentMapType == MapType.normal,
          onTap: () {
            setState(() {
              widget.onMapTypeChange(MapType.normal);
            });
          },
        ),
        SizedBox(width: widget.width * 0.0083),
        MapTypeSwitcherButton(
          width: widget.width,
          title: 'Palydovinis',
          isActive: widget.currentMapType == MapType.satellite,
          onTap: () {
            setState(() {
              widget.onMapTypeChange(MapType.satellite);
            });
          },
        ),
        SizedBox(width: widget.width * 0.0083),
        MapTypeSwitcherButton(
          width: widget.width,
          title: 'Hibridinis',
          isActive: widget.currentMapType == MapType.hybrid,
          onTap: () {
            setState(() {
              widget.onMapTypeChange(MapType.hybrid);
            });
          },
        ),
      ],
    );
  }
}
