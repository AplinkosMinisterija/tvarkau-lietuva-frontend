import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:core_ui/core_ui.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';

class MapTypeChangeDialog extends StatelessWidget {
  const MapTypeChangeDialog({
    required this.currentMapType,
    required this.onChangeTap,
    required this.onHover,
    super.key,
  });

  final OSMMapType currentMapType;
  final Function(OSMMapType) onChangeTap;
  final Function(bool) onHover;

  @override
  Widget build(BuildContext context) {
    return PointerInterceptor(
      child: Dialog(
        backgroundColor: const Color.fromRGBO(250, 242, 234, 1),
        insetPadding: EdgeInsets.all(32),
        child: InkWell(
          onTap: () {},
          onHover: (isHover) {
            onHover(isHover);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Žemėlapio tipas',
                      style: GoogleFonts.roboto(
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                        color: const Color.fromRGBO(57, 97, 84, 1),
                      ),
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: const Icon(
                          Icons.close,
                          size: 32,
                        ))
                  ],
                ),
                const SizedBox(height: 32),
                Wrap(
                  spacing: 16,
                  children: [
                    ChoiceChip(
                      label: const Text(
                        'Įprastas',
                        style: TextStyle(fontSize: 32),
                      ),
                      selected: currentMapType == OSMMapType.osm,
                      onSelected: (bool selected) {
                        _selectMapType(
                          context,
                          selected ? OSMMapType.osm : OSMMapType.satellite,
                        );
                      },
                    ),
                    ChoiceChip(
                      label: const Text(
                        'Palydovinis',
                        style: TextStyle(fontSize: 32),
                      ),
                      selected: currentMapType == OSMMapType.satellite,
                      onSelected: (bool selected) {
                        _selectMapType(
                          context,
                          selected ? OSMMapType.satellite : OSMMapType.osm,
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _selectMapType(BuildContext context, OSMMapType mapType) {
    onChangeTap(mapType);
    Navigator.of(context).pop();
  }
}
