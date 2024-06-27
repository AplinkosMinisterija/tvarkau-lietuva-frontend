import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:core_ui/core_ui.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';

class MapTypeChangeDialog extends StatefulWidget {
  const MapTypeChangeDialog({
    required this.width,
    required this.currentMapType,
    required this.onChangeTap,
    this.onHover,
    super.key,
  });

  final double width;
  final MapType currentMapType;
  final Function(MapType) onChangeTap;
  final Function(bool)? onHover;

  @override
  State<MapTypeChangeDialog> createState() => _MapTypeChangeDialogState();
}

class _MapTypeChangeDialogState extends State<MapTypeChangeDialog> {
  @override
  Widget build(BuildContext context) {
    return PointerInterceptor(
      child: Dialog(
        backgroundColor: const Color.fromRGBO(250, 242, 234, 1),
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return InkWell(
              onTap: () {},
              onHover: (isHover) {
                widget.onHover!(isHover);
              },
              child: SizedBox(
                height: widget.width * 0.305,
                width: widget.width,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: widget.width * 0.05,
                      horizontal: widget.width * 0.044),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: widget.width * 0.278,
                            child: FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Text(
                                'Žemėlapio tipas',
                                style: GoogleFonts.roboto(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: const Color.fromRGBO(57, 97, 84, 1)),
                              ),
                            ),
                          ),
                          GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: const Icon(
                                Icons.close,
                                size: 24,
                              ))
                        ],
                      ),
                      SizedBox(height: widget.width * 0.056),
                      SizedBox(
                        width: widget.width,
                        child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: MapTypeSwitcher(
                            width: widget.width * 2,
                            onMapTypeChange: (MapType value) {
                              widget.onChangeTap(value);
                              Navigator.of(context).pop();
                            },
                            currentMapType: widget.currentMapType,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
