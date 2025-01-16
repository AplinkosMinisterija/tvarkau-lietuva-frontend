import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AutomaticEmailsOptionWidget extends StatelessWidget {
  const AutomaticEmailsOptionWidget({
    super.key,
    required this.onTap,
    required this.width,
    required this.isEmailsEnabled,
  });

  final Function(bool?) onTap;
  final double width;
  final bool isEmailsEnabled;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      activeColor: const Color.fromRGBO(57, 97, 84, 1),
      title: SizedBox(
        width: width * 0.2,
        child: Text(
          'Gauti atnaujinimus el. paštu',
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.w400,
            fontSize: width * 0.03,
          ),
        ),
      ),
      value: isEmailsEnabled,
      onChanged: onTap,
      controlAffinity: ListTileControlAffinity.leading,
    );
  }
}
