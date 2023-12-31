import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminDumpsTitleBar extends StatelessWidget {
  const AdminDumpsTitleBar({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(width: width * 0.01),
        SizedBox(
          width: width * 0.0963,
          child: AutoSizeText(
            'Aikštelės pavadinimas',
            maxLines: 2,
            style: GoogleFonts.raleway(
              fontWeight: FontWeight.w600,
              fontSize: 12,
              color: const Color(0x660a3328),
            ),
          ),
        ),
        SizedBox(
          width: width * 0.00833,
        ),
        SizedBox(
          width: width * 0.0963,
          child: AutoSizeText(
            'Informacija',
            maxLines: 2,
            style: GoogleFonts.raleway(
              fontWeight: FontWeight.w600,
              fontSize: 12,
              color: const Color(0x660a3328),
            ),
          ),
        ),
        SizedBox(
          width: width * 0.00833,
        ),
        SizedBox(
          width: width * 0.0963,
          child: AutoSizeText(
            'Koordinatės ilguma',
            maxLines: 2,
            style: GoogleFonts.raleway(
              fontWeight: FontWeight.w600,
              fontSize: 12,
              color: const Color(0x660a3328),
            ),
          ),
        ),
        SizedBox(
          width: width * 0.00833,
        ),
        SizedBox(
          width: width * 0.0963,
          child: AutoSizeText(
            'Koordinatės platuma',
            maxLines: 2,
            style: GoogleFonts.raleway(
              fontWeight: FontWeight.w600,
              fontSize: 12,
              color: const Color(0x660a3328),
            ),
          ),
        ),
        SizedBox(
          width: width * 0.00833,
        ),
        SizedBox(
          width: width * 0.0963,
          child: AutoSizeText(
            'Telefono nr.',
            maxLines: 2,
            style: GoogleFonts.raleway(
              fontWeight: FontWeight.w600,
              fontSize: 12,
              color: const Color(0x660a3328),
            ),
          ),
        ),
        SizedBox(
          width: width * 0.00833,
        ),
        SizedBox(
          width: width * 0.0963,
          child: AutoSizeText(
            'Matomumas',
            maxLines: 1,
            style: GoogleFonts.raleway(
              fontWeight: FontWeight.w600,
              fontSize: 12,
              color: const Color(0x660a3328),
            ),
          ),
        ),
        SizedBox(
          width: width * 0.00833,
        ),
        SizedBox(
          width: width * 0.0863,
          child: AutoSizeText(
            'Veiksmai',
            maxLines: 2,
            style: GoogleFonts.raleway(
              fontWeight: FontWeight.w600,
              fontSize: 12,
              color: const Color(0x660a3328),
            ),
          ),
        ),
      ],
    );
  }
}
