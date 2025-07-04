import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:dashboard/src/home/bloc/home_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
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
    bool isMobile = true;
    return Title(
      title: "Tvarkau Lietuvą sistemos klaidos pranešimas",
      color: const Color.fromRGBO(28, 63, 58, 1),
      child: Scaffold(
        body: CupertinoPageScaffold(
          backgroundColor: const Color.fromRGBO(225, 225, 225, 1),
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              if (constraints.maxWidth > 800) {
                isMobile = false;
              }
              return Form(
                key: _formKey,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    BackgroundWidget(
                      width: isMobile
                          ? constraints.maxWidth * 2
                          : constraints.maxWidth,
                      isMobile: false,
                    ),
                    SizedBox(
                      width: isMobile
                          ? constraints.maxWidth * 0.9
                          : constraints.maxWidth * 0.5,
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: constraints.maxWidth * 0.0291,
                          ),
                          SvgPicture.asset('assets/svg/TL_logo.svg'),
                          SizedBox(
                            height: constraints.maxWidth * 0.03,
                          ),
                          BlocProvider(
                              create: (BuildContext context) =>
                                  HomeBloc()..add(LoadSystemErrorReport()),
                              child: BlocBuilder<HomeBloc, HomeState>(
                                builder:
                                    (BuildContext context, HomeState state) {
                                  return BlocBuilder<HomeBloc, HomeState>(
                                    builder: (BuildContext context,
                                        HomeState state) {
                                      switch (state) {
                                        case SystemErrorState():
                                          return Column(
                                            children: [
                                              Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  'Įveskite savo el. pašto adresą ir kuo įmanoma detaliau aprašykite klaidą ar problemą, su kuria susidūrėte, kokiu įrenginiu naudojotės. Su Jumis susisieks administratorius nurodytu el. paštu.',
                                                  style: GoogleFonts.roboto(
                                                    fontSize: isMobile
                                                        ? constraints.maxWidth *
                                                            0.025
                                                        : constraints.maxWidth *
                                                            0.009,
                                                    fontWeight: FontWeight.w400,
                                                    color: const Color.fromRGBO(
                                                        255, 255, 255, 1),
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                              SizedBox(
                                                height: constraints.maxWidth *
                                                    0.0291,
                                              ),
                                              Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  'Jūsų el. pašto adresas',
                                                  style: GoogleFonts.roboto(
                                                    fontSize: isMobile
                                                        ? constraints.maxWidth *
                                                            0.03
                                                        : constraints.maxWidth *
                                                            0.01093,
                                                    fontWeight: FontWeight.w400,
                                                    color: const Color.fromRGBO(
                                                        255, 255, 255, 1),
                                                  ),
                                                ),
                                              ),
                                              Stack(
                                                alignment: Alignment.center,
                                                children: [
                                                  Container(
                                                    height: isMobile
                                                        ? constraints.maxWidth *
                                                            0.09
                                                        : constraints.maxWidth *
                                                            0.03125,
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4)),
                                                  ),
                                                  Container(
                                                    height: isMobile
                                                        ? constraints.maxWidth *
                                                            0.09
                                                        : constraints.maxWidth *
                                                            0.03125,
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                      horizontal:
                                                          constraints.maxWidth *
                                                              0.01,
                                                    ),
                                                    child: TextFormField(
                                                      maxLines: 1,
                                                      textAlignVertical:
                                                          TextAlignVertical.top,
                                                      validator: (value) {
                                                        if (value == null ||
                                                            value.isEmpty) {
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
                                                          fontSize: isMobile
                                                              ? constraints
                                                                      .maxWidth *
                                                                  0.03
                                                              : constraints
                                                                      .maxWidth *
                                                                  0.0125,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: Colors.black),
                                                      decoration:
                                                          const InputDecoration(
                                                        border:
                                                            InputBorder.none,
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
                                                    fontSize: isMobile
                                                        ? constraints.maxWidth *
                                                            0.03
                                                        : constraints.maxWidth *
                                                            0.01093,
                                                    fontWeight: FontWeight.w400,
                                                    color: const Color.fromRGBO(
                                                        255, 255, 255, 1),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: isMobile
                                                    ? constraints.maxWidth * 0.5
                                                    : constraints.maxWidth *
                                                        0.2,
                                                padding: EdgeInsets.all(
                                                  constraints.maxWidth * 0.01,
                                                ),
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4)),
                                                child: TextFormField(
                                                  maxLines: 10,
                                                  validator: (value) {
                                                    if (value == null ||
                                                        value.isEmpty) {
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
                                                      fontSize: isMobile
                                                          ? constraints
                                                                  .maxWidth *
                                                              0.03
                                                          : constraints
                                                                  .maxWidth *
                                                              0.0125,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Colors.black),
                                                  decoration:
                                                      const InputDecoration(
                                                    border: InputBorder.none,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: constraints.maxWidth *
                                                    0.0291,
                                              ),
                                              SizedBox(
                                                width: isMobile
                                                    ? constraints.maxWidth * 0.6
                                                    : constraints.maxWidth *
                                                        0.3,
                                                child: AppButton(
                                                  text: 'Siųsti pranešimą',
                                                  backgroundColor:
                                                      AppTheme.mainThemeColor,
                                                  onPressed: () {
                                                    if (_formKey.currentState!
                                                        .validate()) {
                                                      context
                                                          .read<HomeBloc>()
                                                          .add(
                                                            SendSystemErrorReport(
                                                                email: email,
                                                                description:
                                                                    description),
                                                          );
                                                    }
                                                  },
                                                ),
                                              ),
                                            ],
                                          );
                                        case SystemErrorLoadingState():
                                          return LoaderWidget().loader();
                                        case SystemErrorSuccessState():
                                          return Column(
                                            children: [
                                              Text(
                                                'Ačiū! Jūsų pranešimas sėkmingai išsiųstas. Administratorius su Jumis susisieks pateiktu el. paštu.',
                                                style: GoogleFonts.roboto(
                                                  fontSize: isMobile
                                                      ? constraints.maxWidth *
                                                          0.06
                                                      : constraints.maxWidth *
                                                          0.02093,
                                                  fontWeight: FontWeight.w400,
                                                  color: const Color.fromRGBO(
                                                      255, 255, 255, 1),
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              SizedBox(
                                                height:
                                                    constraints.maxWidth * 0.08,
                                              ),
                                              SizedBox(
                                                width: 200,
                                                child: AppButton(
                                                  text: 'Grįžti į pradžią',
                                                  backgroundColor:
                                                      const Color(0xffff6a3d),
                                                  onPressed: () {
                                                    context.goNamed('home');
                                                  },
                                                ),
                                              ),
                                            ],
                                          );
                                        case ErrorState():
                                          return Column(
                                            children: [
                                              Text(
                                                'Sistemos serveris šiuo metu patiria trikdžius. Stengiamės kuo greičiau sutvarkyti iškilusias problemas. Ačiū už kantrybę.',
                                                style: GoogleFonts.roboto(
                                                  fontSize: isMobile
                                                      ? constraints.maxWidth *
                                                          0.03
                                                      : constraints.maxWidth *
                                                          0.01,
                                                  fontWeight: FontWeight.w400,
                                                  color: const Color.fromRGBO(
                                                      255, 255, 255, 1),
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              SizedBox(
                                                height:
                                                    constraints.maxWidth * 0.08,
                                              ),
                                              SizedBox(
                                                width: 200,
                                                child: AppButton(
                                                  text: 'Grįžti į pradžią',
                                                  backgroundColor:
                                                      const Color(0xffff6a3d),
                                                  onPressed: () {
                                                    context.goNamed('home');
                                                  },
                                                ),
                                              ),
                                            ],
                                          );
                                      }
                                      return const SizedBox.shrink();
                                    },
                                  );
                                },
                              ))
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
