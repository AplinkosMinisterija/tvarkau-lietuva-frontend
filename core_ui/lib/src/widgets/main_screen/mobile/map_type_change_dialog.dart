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
    this.onPermitsVisibilityChange,
    this.onReportVisibilityChange,
    this.isReportsActive,
    this.isPermitsActive,
    this.onHover,
    super.key,
  });

  final double width;
  final MapType currentMapType;
  final bool? isReportsActive;
  final bool? isPermitsActive;
  final void Function()? onReportVisibilityChange;
  final void Function()? onPermitsVisibilityChange;
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
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return SizedBox(
              height: widget.onPermitsVisibilityChange != null &&
                      widget.onReportVisibilityChange != null
                  ? widget.width * 0.716
                  : widget.width * 0.316,
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
                        Text('Žemėlapio tipas',
                            style: GoogleFonts.roboto(
                              fontSize: widget.width * 0.04,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            )),
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
                    ),
                    if (widget.onPermitsVisibilityChange != null &&
                        widget.onReportVisibilityChange != null) ...[
                      SizedBox(height: widget.width * 0.056),
                      const Divider(
                        height: 1,
                        color: Color.fromRGBO(222, 224, 224, 1),
                      ),
                      SizedBox(height: widget.width * 0.056),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Sluoksnių duomenys',
                            style: GoogleFonts.roboto(
                                fontSize: widget.width * 0.04,
                                fontWeight: FontWeight.w600,
                                color: Colors.black)),
                      ),
                      SizedBox(height: widget.width * 0.01),
                      LayerTypeButton(
                          width: widget.width,
                          title: 'Išduoti kirtimų leidimai',
                          isActive: widget.isPermitsActive!,
                          onTap: () {
                            widget.onPermitsVisibilityChange!();
                          }),
                      SizedBox(height: widget.width * 0.02),
                      LayerTypeButton(
                          width: widget.width,
                          title: 'Patvirtinti pranešimai',
                          isActive: widget.isReportsActive!,
                          onTap: () {
                            widget.onReportVisibilityChange!();
                          })
                    ]
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
