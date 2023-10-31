import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:openid_client/openid_client_browser.dart' as open_id;
import 'package:google_fonts/google_fonts.dart';
import 'package:aad_oauth/aad_oauth.dart';
import '../helpers/globals.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  var tenantId = "74edcdf9-ca2e-4601-9982-4e2df1ba3a54";
  var clientId = "0408503a-ada6-4a72-8823-c52ca0fe5b43";
  var scope = "api://0408503a-ada6-4a72-8823-c52ca0fe5b43/User.read";
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          BackgroundWidget(width: screenWidth),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: screenWidth*0.15),
              Text(
                'Neturite prieigos prie šio puslapio!',
                style: GoogleFonts.roboto(fontSize: 30, color: Colors.white),
              ),
              SizedBox(height: screenWidth*0.005),
              Text(
                'Prašome prisijungti',
                style: GoogleFonts.roboto(fontSize: 24, color: Colors.grey),
              ),
              SizedBox(height: screenWidth*0.1),
              InkWell(
                onTap: () {
                  authenticate(
                      Uri.parse(
                          "https://login.microsoftonline.com/$tenantId/v2.0"),
                      clientId,
                      [scope]);
                },
                onHover: (hover) {
                  setState(() {
                    if (hover) {
                      isHover = hover;
                    } else {
                      isHover = hover;
                    }
                  });
                },
                hoverColor: Colors.blue,
                child: Container(
                  height: screenWidth * 0.05,
                  width: screenWidth * 0.25,
                  padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.02,
                      vertical: screenWidth * 0.005),
                  decoration: BoxDecoration(
                      color: isHover
                          ? const Color.fromRGBO(1, 152, 0, 1.0)
                          : const Color.fromRGBO(1, 117, 0, 1.0),
                      borderRadius: BorderRadius.circular(45),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(isHover ? 0.5 : 0.1),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ]),
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/icons/microsoft_logo.png',
                          height: screenWidth * 0.02,
                          width: screenWidth * 0.02,
                        ),
                        SizedBox(width: screenWidth * 0.01),
                        Text(
                          'Prisijungti per AAD',
                          style: GoogleFonts.poppins(
                              fontSize: 20, color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

authenticate(Uri uri, String clientId, List<String> scopes) async {
  var issuer = await open_id.Issuer.discover(uri);
  var client = open_id.Client(issuer, clientId);

  var authenticator = open_id.Authenticator(client, scopes: scopes);
  await authenticator.credential;
  print(authenticator.flow.client.issuer.metadata.userinfoEndpoint.toString());
  //print(authenticator.credential.client.);
  authenticator.authorize();
}
