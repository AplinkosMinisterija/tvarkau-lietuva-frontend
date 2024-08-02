import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:core_ui/core_ui.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';

class MapTypeChangeDialogOsm extends StatefulWidget {
  const MapTypeChangeDialogOsm({
    required this.width,
    required this.isMobile,
    this.onPermitsVisibilityChange,
    this.onReportVisibilityChange,
    this.isReportsActive,
    this.isPermitsActive,
    this.onHover,
    super.key,
  });

  final double width;
  final bool isMobile;
  final bool? isReportsActive;
  final bool? isPermitsActive;
  final void Function()? onReportVisibilityChange;
  final void Function()? onPermitsVisibilityChange;
  final Function(bool)? onHover;

  @override
  State<MapTypeChangeDialogOsm> createState() => _MapTypeChangeDialogOsmState();
}

class _MapTypeChangeDialogOsmState extends State<MapTypeChangeDialogOsm> {
  @override
  Widget build(BuildContext context) {
    return PointerInterceptor(
      child: Dialog(
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        insetPadding: null,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        child: SizedBox(
          height: getWidgetHeight(),
          width: widget.isMobile ? widget.width : widget.width * 0.28125,
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: widget.isMobile
                    ? widget.width * 0.0444
                    : widget.width * 0.014,
                horizontal: widget.isMobile
                    ? widget.width * 0.0444
                    : widget.width * 0.0125),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Sluoksnių duomenys',
                      style: GoogleFonts.roboto(
                          fontSize: widget.isMobile
                              ? widget.width * 0.03889
                              : widget.width * 0.01093,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Icon(
                          Icons.close,
                          size: widget.isMobile
                              ? widget.width * 0.0556
                              : widget.width * 0.0156,
                        ))
                  ],
                ),
                SizedBox(
                    height: widget.isMobile
                        ? widget.width * 0.0222
                        : widget.width * 0.000625),
                if (widget.onPermitsVisibilityChange != null) ...[
                  LayerTypeButton(
                      width: widget.width,
                      isMobile: widget.isMobile,
                      title: 'Išduoti kirtimų leidimai',
                      isActive: widget.isPermitsActive!,
                      onTap: () {
                        widget.onPermitsVisibilityChange!();
                      }),
                ],
                if (widget.onReportVisibilityChange != null) ...[
                  SizedBox(height: widget.width * 0.003125),
                  LayerTypeButton(
                      width: widget.width,
                      isMobile: widget.isMobile,
                      title: 'Patvirtinti pranešimai',
                      isActive: widget.isReportsActive!,
                      onTap: () {
                        widget.onReportVisibilityChange!();
                      }),
                ]
              ],
            ),
          ),
        ),
      ),
    );
  }

  double getWidgetHeight() {
    if (widget.onReportVisibilityChange != null &&
        widget.onPermitsVisibilityChange != null) {
      return widget.isMobile ? widget.width * 0.55 : widget.width * 0.2;
    } else if (widget.onReportVisibilityChange != null &&
        widget.onPermitsVisibilityChange == null) {
      return widget.isMobile ? widget.width * 0.32 : widget.width * 0.09;
    } else {
      return widget.isMobile ? widget.width * 0.32 : widget.width * 0.09;
    }
  }
}
