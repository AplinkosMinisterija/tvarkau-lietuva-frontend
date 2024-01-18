import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

import 'map_type_switcher_button.dart';

class MapTypeSwitcher extends StatefulWidget {
  const MapTypeSwitcher({
    super.key,
    required this.width,
    required this.onMapTypeChange,
    required this.currentMapType,
  });

  final double width;
  final ValueChanged<AppMapType> onMapTypeChange;
  final AppMapType currentMapType;

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
          isActive: widget.currentMapType == AppMapType.osm,
          onTap: () {
            setState(() {
              widget.onMapTypeChange(AppMapType.osm);
            });
          },
        ),
        SizedBox(width: widget.width * 0.0083),
        MapTypeSwitcherButton(
          width: widget.width,
          title: 'Palydovinis',
          isActive: widget.currentMapType == AppMapType.satellite,
          onTap: () {
            setState(() {
              widget.onMapTypeChange(AppMapType.satellite);
            });
          },
        ),
      ],
    );
  }
}
