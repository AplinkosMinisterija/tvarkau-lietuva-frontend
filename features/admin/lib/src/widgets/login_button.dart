import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginButton extends StatefulWidget {
  const LoginButton({
    super.key,
    required this.width,
    required this.onLogIn,
    required this.tenant,
  });

  final double width;

  final Function(String) onLogIn;
  final String tenant;

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  late Image tenantLogo;
  late String title;

  @override
  void initState() {
    setInformationByTenant(widget.tenant);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onLogIn(widget.tenant);
      },
      onHover: (hover) {},
      hoverColor: Colors.blue,
      child: Container(
        height: widget.width * 0.05,
        padding: EdgeInsets.symmetric(
            horizontal: widget.width * 0.02, vertical: widget.width * 0.005),
        decoration: BoxDecoration(
            color: const Color.fromRGBO(1, 117, 0, 1.0),
            borderRadius: BorderRadius.circular(45),
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(0.1),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ]),
        child: FittedBox(
          child: Row(
            children: [
              Image.asset(
                'assets/icons/microsoft_logo.png',
                height: widget.width * 0.018,
                width: widget.width * 0.018,
              ),
              SizedBox(width: widget.width * 0.01),
              Text(
                title,
                style: GoogleFonts.poppins(fontSize: 17, color: Colors.white),
              ),
              SizedBox(width: widget.width * 0.01),
              tenantLogo,
            ],
          ),
        ),
      ),
    );
  }

  void setInformationByTenant(String tenant) {
    switch (tenant) {
      case 'aad':
        title = 'Prisijungti per AAD';
        tenantLogo = Image.asset(
          'assets/icons/aad_logo.png',
          height: widget.width * 0.02,
          width: widget.width * 0.02,
        );
      case 'amvmt':
        title = 'Prisijungti per AMVMT';
        tenantLogo = Image.asset(
          'assets/icons/amvmt_logo.png',
          height: widget.width * 0.02,
          width: widget.width * 0.02,
        );
      default:
        title = '';
        tenantLogo = Image.asset(
          'assets/icons/aad-logo.png',
          height: widget.width * 0.02,
          width: widget.width * 0.02,
        );
    }
  }
}
