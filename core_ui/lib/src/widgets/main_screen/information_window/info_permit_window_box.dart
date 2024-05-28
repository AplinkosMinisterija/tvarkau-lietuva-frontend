import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';

class InfoPermitWindowBox extends StatelessWidget {
  InfoPermitWindowBox({
    super.key,
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

  final String? type;
  final String? issuedFrom;
  final String? issuedTo;
  final String? cadastralNumber;
  final String? subdivision;
  final String? forestryDistrict;
  final String? block;
  final String? plot;
  final String? cuttableArea;
  final String? dominantTree;
  final String? cuttingType;
  final String? reinstatementType;

  @override
  Widget build(BuildContext context) {
    return PointerInterceptor(
      child: Container(
        width: 328,
        height: 211,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: Colors.white,
        ),
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            getListTile(titles[0], type ?? '-'),
            getListTile(titles[1], issuedFrom ?? '-'),
            getListTile(titles[2], issuedTo ?? '-'),
            getListTile(titles[3], cadastralNumber ?? '-'),
            getListTile(titles[4], subdivision ?? '-'),
            getListTile(titles[5], forestryDistrict ?? '-'),
            getListTile(titles[6], block ?? '-'),
            getListTile(titles[7], plot ?? '-'),
            getListTile(titles[8], cuttableArea ?? '-'),
            getListTile(titles[9], dominantTree ?? '-'),
            getListTile(titles[10], cuttingType ?? '-'),
            getListTile(titles[11], reinstatementType ?? '-'),
          ],
        ),
      ),
    );
  }

  List<String> titles = [
    'Tipas',
    'Galioja nuo',
    'Galioja iki',
    'Kadastrinis Nr.',
    'VMU padalinys',
    'Girininkija',
    'Kvartalas',
    'Sklypas',
    'Kertamas plotas',
    'Vyraujantys medžiai',
    'Kirtimo rūšis',
    'Atkūrimo būdas'
  ];

  Widget getListTile(String title, String description) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        getListTileItem(title),
        getListTileItem(description),
      ],
    );
  }

  Widget getListTileItem(String content) {
    return Container(
      alignment: Alignment.topCenter,
      margin: const EdgeInsets.symmetric(
        vertical: 5,
      ),
      width: 145,
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        color: Colors.grey.withOpacity(0.1),
      ),
      child: Text(
        content,
        textAlign: TextAlign.center,
        style: getTextStyle(),
      ),
    );
  }

  TextStyle getTextStyle() {
    return GoogleFonts.roboto(
      fontSize: 14,
      fontWeight: FontWeight.w400,
    );
  }
}
