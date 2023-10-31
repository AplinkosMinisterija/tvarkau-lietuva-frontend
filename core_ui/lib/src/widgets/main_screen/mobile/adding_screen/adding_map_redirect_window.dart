import 'dart:async';

import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddingMapRedirectWindow extends StatefulWidget {
  const AddingMapRedirectWindow({
    required this.width,
    required this.marker,
  });

  final double width;
  final Set<Marker> marker;

  @override
  State<AddingMapRedirectWindow> createState() =>
      _AddingMapRedirectWindowState();
}

class _AddingMapRedirectWindowState extends State<AddingMapRedirectWindow> {
  Set<Marker> marker = {};
  late CameraPosition viewPosition;
  late GoogleMapController _googleMapController;

  @override
  void initState() {
    marker.clear();
    super.initState();
  }

  void animate() {
    _googleMapController.animateCamera(
      CameraUpdate.newLatLngZoom(
          LatLng(
            viewPosition.target.latitude,
            viewPosition.target.longitude,
          ),
          viewPosition.zoom),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.marker.isNotEmpty) {
      marker.add(widget.marker.first);
      viewPosition = CameraPosition(
          target: LatLng(
            marker.first.position.latitude,
            marker.first.position.longitude,
          ),
          zoom: 9);
      animate();
    } else {
      viewPosition =
          CameraPosition(target: LatLng(55.1736, 23.8948), zoom: 6.2);
      if (marker.length != 0) {
        animate();
      }
      marker.clear();
    }
    return SizedBox(
      height: widget.width * 0.444,
      width: widget.width * 0.911,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            child: GoogleMap(
              initialCameraPosition: viewPosition,
              markers: marker.isNotEmpty ? marker : {},
              onMapCreated: (GoogleMapController controller) {
                _googleMapController = controller;
                _googleMapController.animateCamera(
                  CameraUpdate.newLatLngZoom(
                      LatLng(viewPosition.target.latitude,
                          viewPosition.target.longitude),
                      viewPosition.zoom),
                );
              },
              mapToolbarEnabled: false,
              scrollGesturesEnabled: false,
              zoomControlsEnabled: false,
              zoomGesturesEnabled: false,
            ),
          ),
        ],
      ),
    );
  }
}
