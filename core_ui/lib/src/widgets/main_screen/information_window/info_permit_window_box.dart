import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';

class InfoPermitWindowBox extends StatelessWidget {
  const InfoPermitWindowBox({
    super.key,
    required this.width,
    required this.isMobile,
    required this.type,
    required this.issuedFrom,
    required this.issuedTo,
    required this.cadastralNumber,
    required this.subdivision,
    required this.forestryDistrict,
    required this.block,
    required this.plot,
    required this.cuttableArea,
    required this.dominantTree,
    required this.cuttingType,
    required this.reinstatementType,
  });

  final double width;
  final bool isMobile;
  final String? type;
  final String? issuedFrom;
  final String? issuedTo;
  final String? cadastralNumber;
  final String? subdivision;
  final String? forestryDistrict;
  final int? block;
  final String? plot;
  final double? cuttableArea;
  final String? dominantTree;
  final String? cuttingType;
  final String? reinstatementType;

  @override
  Widget build(BuildContext context) {
    return PointerInterceptor(
      child: Container(
        width: isMobile ? width : width * 0.228,
        height: isMobile ? width * 0.7 : width * 0.3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Colors.white,
        ),
        padding: EdgeInsets.all(isMobile ? width * 0.044 : width * 0.011),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: isMobile ? width * 0.01 : width * 0.005),
                  child: Text(
                    'Leidimo kirsti mišką duomenys',
                    style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w700,
                        fontSize: isMobile ? width * 0.036 : width * 0.009),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.close,
                      size: isMobile ? width * 0.055 : width * 0.013,
                    ))
              ],
            ),
            Expanded(
              child: ListView(
                children: [
                  getListTile('VĮ VMU Padalinys', subdivision ?? '-', false),
                  getListTile('Girininkija', forestryDistrict ?? '-', true),
                  getListTile('Galioja nuo', issuedFrom ?? '-', false),
                  getListTile('Galioja iki', issuedTo ?? '-', true),
                  getListTile('Kvartalas',
                      block != null ? block.toString() : '-', false),
                  getListTile('Sklypas', plot ?? '-', true),
                  getListTile(
                      'Kertamas plotas',
                      cuttableArea != null ? cuttableArea.toString() : '-',
                      false),
                  getListTile('Kirtimo rūšis', cuttingType ?? '-', true),
                  getListTile(
                      'Vyraujantys medžiai', dominantTree ?? '-', false),
                  getListTile('Atkūrimo būdas', reinstatementType ?? '-', true),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getListTile(String title, String description, bool isDarker) {
    return Container(
      width: isMobile ? width * 0.8 : width * 0.2,
      padding: EdgeInsets.all(isMobile ? width * 0.01 : width * 0.005),
      color: isDarker
          ? const Color.fromRGBO(245, 245, 245, 1)
          : const Color.fromRGBO(255, 255, 255, 1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$title:',
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.w500,
              fontSize: isMobile ? width * 0.0388 : width * 0.01,
            ),
          ),
          SizedBox(
            width: isMobile ? width * 0.38 : width * 0.095,
            child: Text(
              description,
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.w400,
                fontSize: isMobile ? width * 0.0388 : width * 0.01,
              ),
            ),
          )
        ],
      ),
    );
  }
}
