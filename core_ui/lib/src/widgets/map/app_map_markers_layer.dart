import 'package:api_client/api_client.dart';
import 'package:core/core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:async/async.dart';

typedef OnMarkerTapCallback<T> = void Function(T item);

class AppMapMarkersLayer {
  final Future<Set<Marker>> _markers;

  final AsyncMemoizer<Set<Marker>> _markersMemoizer = AsyncMemoizer();

  AppMapMarkersLayer._(this._markers);

  Future<Set<Marker>> get markers =>
      _markersMemoizer.runOnce(() => _markers.then(Set.unmodifiable));

  static AppMapMarkersLayer fromPinLocation(LatLng location,
      {ValueChanged<LatLng>? onDrag}) {
    return _createMarkersLayer([location], markerBuilder: (_) async {
      return Marker(
        markerId: const MarkerId('draggable-location-marker-pin'),
        zIndex: 1000,
        position: location,
        icon: await BitmapDescriptor.fromAssetImage(
          const ImageConfiguration(),
          'assets/svg/pin_icon.svg',
        ),
        draggable: true,
        onDrag: onDrag,
      );
    });
  }

  static AppMapMarkersLayer fromPublicReports(
    Iterable<PublicReportDto> reports, {
    OnMarkerTapCallback<PublicReportDto>? onTap,
  }) {
    return _createMarkersLayer(reports, markerBuilder: (report) async {
      return Marker(
        markerId: MarkerId(report.fullRefIdPublic),
        position: LatLng(report.latitude, report.longitude),
        icon: await BitmapDescriptor.fromAssetImage(
          const ImageConfiguration(size: Size(25, 30)),
          _getReportIconPathByStatus(report.status),
        ),
        onTap: onTap != null ? () => onTap(report) : null,
      );
    });
  }

  static AppMapMarkersLayer empty() {
    return AppMapMarkersLayer._(
      Future.value(Set.unmodifiable(List<Marker>.empty())),
    );
  }

  static AppMapMarkersLayer fromDumps(
    Iterable<DumpDto> dumps, {
    OnMarkerTapCallback<DumpDto>? onTap,
  }) {
    return _createMarkersLayer(
      dumps,
      markerBuilder: (dump) async {
        return Marker(
          // TODO expose dump marker ID
          markerId: MarkerId(
            'dump-${dump.name}-${dump.reportLat}-${dump.reportLong}',
          ),
          position: LatLng(dump.reportLat, dump.reportLong),
          icon: await BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(size: Size(50, 50)),
            'assets/svg/dump_icon.svg',
          ),
          onTap: onTap != null ? () => onTap(dump) : null,
        );
      },
    );
  }

  AppMapMarkersLayer combine(AppMapMarkersLayer otherMapMarkersLayer) {
    final markers = _combineMarkers(otherMapMarkersLayer);

    return AppMapMarkersLayer._(markers.then(Set.unmodifiable));
  }

  static _createMarkersLayer<T>(
    Iterable<T> items, {
    required Future<Marker> Function(T item) markerBuilder,
  }) {
    final markerFutures = items.map(markerBuilder);

    final markers = Future.wait(
      markerFutures,
      eagerError: true,
    ).then(Set.unmodifiable);

    return AppMapMarkersLayer._(markers);
  }

  Future<Set<Marker>> _combineMarkers(
      AppMapMarkersLayer otherMapMarkersLayer) async {
    final allMarkerLayers = await Future.wait(
      [markers, otherMapMarkersLayer.markers],
      eagerError: true,
    );

    return {...allMarkerLayers[0], ...allMarkerLayers[1]};
  }

  static String _getReportIconPathByStatus(String status) {
    if (status == "gautas") {
      return 'assets/icons/marker_pins/red_marker.png';
    } else if (status == "tiriamas") {
      return 'assets/icons/marker_pins/orange_marker.png';
    } else if (status == "išspręsta") {
      return 'assets/icons/marker_pins/green_marker.png';
    } else if (status == "nepasitvirtino") {
      return 'assets/icons/marker_pins/gray_marker.png';
    } else {
      return 'assets/icons/marker_pins/red_marker.png';
    }
  }
}
