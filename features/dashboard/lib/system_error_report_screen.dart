import 'package:core_ui/core_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class SystemErrorReportScreen extends StatefulWidget {
  const SystemErrorReportScreen({
    super.key,
  });

  @override
  State<SystemErrorReportScreen> createState() =>
      _SystemErrorReportScreenState();
}

class _SystemErrorReportScreenState extends State<SystemErrorReportScreen> {
  String email = '';
  String description = '';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Title(
      title: "Tvarkau Lietuvą",
      color: const Color.fromRGBO(28, 63, 58, 1),
      child: Scaffold(
        body: CupertinoPageScaffold(
          backgroundColor: const Color.fromRGBO(225, 225, 225, 1),
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return Form(
                key: _formKey,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    BackgroundWidget(
                      width: constraints.maxWidth,
                      isMobile: false,
                    ),
                    SizedBox(
                      width: constraints.maxWidth * 0.5,
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: constraints.maxWidth * 0.0291,
                          ),
                          Align(
                            alignment: Alignment.topCenter,
                            child: DepartmentLogo(
                              width: constraints.maxWidth,
                            ),
                          ),
                          SizedBox(
                            height: constraints.maxWidth * 0.01,
                          ),
                          Text(
                            'Tvarkau Lietuvą',
                            style: GoogleFonts.raleway(
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                              fontSize: 40,
                            ),
                          ),
                          SizedBox(
                            height: constraints.maxWidth * 0.0291,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Įveskite savo el. pašto adresą ir kuo įmanoma detaliau aprašykite klaidą ar problemą, su kuria susidūrėte. Su Jumis susisieks administratorius nurodytu el. paštu.',
                              style: GoogleFonts.roboto(
                                fontSize: constraints.maxWidth * 0.009,
                                fontWeight: FontWeight.w400,
                                color: const Color.fromRGBO(255, 255, 255, 1),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            height: constraints.maxWidth * 0.0291,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Jūsų el. pašto adresas',
                              style: GoogleFonts.roboto(
                                fontSize: constraints.maxWidth * 0.01093,
                                fontWeight: FontWeight.w400,
                                color: const Color.fromRGBO(255, 255, 255, 1),
                              ),
                            ),
                          ),
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                height: constraints.maxWidth * 0.03125,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(4)),
                              ),
                              Container(
                                height: constraints.maxWidth * 0.03125,
                                padding: EdgeInsets.symmetric(
                                  horizontal: constraints.maxWidth * 0.01,
                                ),
                                child: TextFormField(
                                  maxLines: 1,
                                  textAlignVertical: TextAlignVertical.top,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Prašome įvesti el. pašto adresą';
                                    } else if (RegExp(
                                            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                        .hasMatch(value)) {
                                      return null;
                                    } else {
                                      return 'Prašome įvesti teisingą el. pašto adresą';
                                    }
                                  },
                                  onChanged: (emailValue) {
                                    setState(() {
                                      email = emailValue;
                                    });
                                  },
                                  style: GoogleFonts.roboto(
                                      fontSize: constraints.maxWidth * 0.0125,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black),
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Klaidos aprašymas',
                              style: GoogleFonts.roboto(
                                fontSize: constraints.maxWidth * 0.01093,
                                fontWeight: FontWeight.w400,
                                color: const Color.fromRGBO(255, 255, 255, 1),
                              ),
                            ),
                          ),
                          Container(
                            height: constraints.maxWidth * 0.2,
                            padding: EdgeInsets.all(
                              constraints.maxWidth * 0.01,
                            ),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(4)),
                            child: TextFormField(
                              maxLines: 10,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Prašome įvesti klaidos aprašymą';
                                }
                                return null;
                              },
                              onChanged: (textValue) {
                                setState(() {
                                  description = textValue;
                                });
                              },
                              style: GoogleFonts.roboto(
                                  fontSize: constraints.maxWidth * 0.0125,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: constraints.maxWidth * 0.0291,
                          ),
                          SizedBox(
                            width: constraints.maxWidth * 0.3,
                            child: AppButton(
                              text: 'Siųsti pranešimą',
                              backgroundColor: AppTheme.mainThemeColor,
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  //TODO: Implement email sending logic
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
