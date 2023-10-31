import 'package:core/utils/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoDumpWindowBox extends StatefulWidget {
  InfoDumpWindowBox({
    required this.address,
    required this.title,
    required this.phone,
    required this.workingHours,
    required this.moreInformation,
    required this.isHovering,
  });

  final String address;
  final String title;
  final String phone;
  final String workingHours;
  final String moreInformation;
  final ValueChanged<bool> isHovering;

  @override
  State<InfoDumpWindowBox> createState() => _InfoDumpWindowBoxState();
}

class _InfoDumpWindowBoxState extends State<InfoDumpWindowBox> {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() {
        widget.isHovering(true);
      }),
      onExit: (_) => setState(() {
        widget.isHovering(false);
      }),
      child: Container(
        width: 300,
        height: 250,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        padding: EdgeInsets.all(10),
        child: Scrollbar(
          controller: _scrollController,
          thumbVisibility: true,
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  widget.address,
                  style: GoogleFonts.raleway(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  widget.title,
                  style: GoogleFonts.raleway(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'KONTAKTAI:',
                  style: GoogleFonts.raleway(
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      color: const Color.fromRGBO(10, 51, 40, 0.4)),
                ),
                const SizedBox(height: 4),
                InkWell(
                  onTap: () {
                    LaunchUrl().launch('tel:+${widget.phone}');
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: const Color.fromRGBO(10, 51, 40, 0.08),
                    ),
                    child: Center(
                      child: Column(
                        children: [
                          Text(
                            'Aikštelės darbuotojo tel.',
                            maxLines: 1,
                            style: GoogleFonts.raleway(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            widget.phone,
                            style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'DARBO LAIKAS:',
                  style: GoogleFonts.raleway(
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      color: const Color.fromRGBO(10, 51, 40, 0.4)),
                ),
                const SizedBox(height: 4),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: const Color.fromRGBO(10, 51, 40, 0.08),
                  ),
                  child: Center(
                    child: Text(
                      widget.workingHours,
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'DAUGIAU INFORMACIJOS:',
                  style: GoogleFonts.raleway(
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      color: const Color.fromRGBO(10, 51, 40, 0.4)),
                ),
                const SizedBox(height: 4),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: const Color.fromRGBO(10, 51, 40, 0.08),
                  ),
                  child: Center(
                    child: Text(
                      widget.moreInformation,
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
