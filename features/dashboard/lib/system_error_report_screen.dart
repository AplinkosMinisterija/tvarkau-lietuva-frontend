import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:dashboard/src/home/bloc/home_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'dart:typed_data';

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
  bool isImagesSizeValid = true;
  List<Uint8List> _selectedImages = [];

  Future<void> getMultipleImageInfos() async {
    final images = await AppImagePicker().pickMultipleImages();

    setState(() {
      _selectedImages = (_selectedImages + images)
          .take(GlobalConstants.maxAllowedImageCount)
          .toList();
      calculateImagesSize();
    });
  }

  void calculateImagesSize() {
    var imageSizes = 0;
    for (var element in _selectedImages) {
      imageSizes += element.lengthInBytes;
    }
    if (imageSizes > GlobalConstants.maxAllowedImageSizeInBytes) {
      isImagesSizeValid = false;
    } else {
      isImagesSizeValid = true;
    }
  }

  void removeSelectedImage(int imageIndex) {
    setState(() {
      _selectedImages.removeAt(imageIndex);
      calculateImagesSize();
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isMobile = true;
    return Title(
      title: "Tvarkau Lietuvą sistemos klaidos pranešimas",
      color: const Color.fromRGBO(28, 63, 58, 1),
      child: Scaffold(
        body: CupertinoPageScaffold(
          backgroundColor: const Color.fromRGBO(225, 225, 225, 1),
          child: SingleChildScrollView(
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
                                                    'Įveskite savo el. pašto adresą ir kuo įmanoma detaliau aprašykite klaidą ar problemą, su kuria susidūrėte, kokiu įrenginiu naudojotės ir pridėkite ekrano vaizdų. Su Jumis susisieks administratorius nurodytu el. paštu.',
                                                    style: GoogleFonts.roboto(
                                                      fontSize: isMobile
                                                          ? constraints
                                                                  .maxWidth *
                                                              0.025
                                                          : constraints
                                                                  .maxWidth *
                                                              0.009,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color:
                                                          const Color.fromRGBO(
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
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    'Jūsų el. pašto adresas',
                                                    style: GoogleFonts.roboto(
                                                      fontSize: isMobile
                                                          ? constraints
                                                                  .maxWidth *
                                                              0.03
                                                          : constraints
                                                                  .maxWidth *
                                                              0.01093,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color:
                                                          const Color.fromRGBO(
                                                              255, 255, 255, 1),
                                                    ),
                                                  ),
                                                ),
                                                Stack(
                                                  alignment: Alignment.center,
                                                  children: [
                                                    Container(
                                                      height: isMobile
                                                          ? constraints
                                                                  .maxWidth *
                                                              0.09
                                                          : constraints
                                                                  .maxWidth *
                                                              0.03125,
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(4)),
                                                    ),
                                                    Container(
                                                      height: isMobile
                                                          ? constraints
                                                                  .maxWidth *
                                                              0.09
                                                          : constraints
                                                                  .maxWidth *
                                                              0.03125,
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                        horizontal: constraints
                                                                .maxWidth *
                                                            0.01,
                                                      ),
                                                      child: TextFormField(
                                                        maxLines: 1,
                                                        textAlignVertical:
                                                            TextAlignVertical
                                                                .top,
                                                        validator: (value) {
                                                          if (value == null ||
                                                              value.isEmpty) {
                                                            return 'Prašome įvesti el. pašto adresą';
                                                          } else if (RegExp(
                                                                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                                              .hasMatch(
                                                                  value)) {
                                                            return null;
                                                          } else {
                                                            return 'Prašome įvesti teisingą el. pašto adresą';
                                                          }
                                                        },
                                                        onChanged:
                                                            (emailValue) {
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
                                                            color:
                                                                Colors.black),
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
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    'Klaidos aprašymas',
                                                    style: GoogleFonts.roboto(
                                                      fontSize: isMobile
                                                          ? constraints
                                                                  .maxWidth *
                                                              0.03
                                                          : constraints
                                                                  .maxWidth *
                                                              0.01093,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color:
                                                          const Color.fromRGBO(
                                                              255, 255, 255, 1),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  height: isMobile
                                                      ? constraints.maxWidth *
                                                          0.5
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
                                                  height: constraints.maxWidth *
                                                      0.007,
                                                ),
                                                ImageAddButton(
                                                  width: isMobile
                                                      ? constraints.maxWidth * 2
                                                      : constraints.maxWidth,
                                                  title: _selectedImages
                                                          .isNotEmpty
                                                      ? 'Įkelti kitas nuotraukas'
                                                      : 'Įkelti nuotraukas',
                                                  onTap: () {
                                                    getMultipleImageInfos();
                                                  },
                                                  isMobile: false,
                                                ),
                                                Align(
                                                  alignment:
                                                      Alignment.topCenter,
                                                  child: Text(
                                                    'Maksimalus nuotraukų kiekis: ${GlobalConstants.maxAllowedImageCount}',
                                                    style: GoogleFonts.roboto(
                                                      fontSize: isMobile
                                                          ? constraints
                                                                  .maxWidth *
                                                              0.02
                                                          : constraints
                                                                  .maxWidth *
                                                              0.009375,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color:
                                                          const Color.fromRGBO(
                                                              0, 0, 0, 1),
                                                    ),
                                                  ),
                                                ),
                                                _selectedImages.isNotEmpty
                                                    ? SizedBox(
                                                        width: isMobile
                                                            ? constraints
                                                                    .maxWidth /
                                                                1.2 *
                                                                0.9111
                                                            : constraints
                                                                    .maxWidth /
                                                                2.4 *
                                                                0.9111,
                                                        height: _selectedImages
                                                                    .length >
                                                                2
                                                            ? isMobile
                                                                ? constraints
                                                                        .maxWidth *
                                                                    0.8111
                                                                : constraints
                                                                        .maxWidth /
                                                                    1.8 *
                                                                    0.7111
                                                            : isMobile
                                                                ? constraints
                                                                        .maxWidth *
                                                                    0.3555
                                                                : constraints
                                                                        .maxWidth /
                                                                    1.8 *
                                                                    0.3555,
                                                        child: AlignedGridView
                                                            .count(
                                                          crossAxisCount: 2,
                                                          mainAxisSpacing: 8,
                                                          crossAxisSpacing: 8,
                                                          physics:
                                                              const NeverScrollableScrollPhysics(),
                                                          itemBuilder:
                                                              (context, index) {
                                                            return ImageGallery()
                                                                .buildPickerImage(
                                                                    image: _selectedImages[
                                                                        index],
                                                                    context:
                                                                        context,
                                                                    width: constraints
                                                                        .maxWidth,
                                                                    onRemoveTap:
                                                                        () {
                                                                      removeSelectedImage(
                                                                          index);
                                                                    });
                                                          },
                                                          itemCount:
                                                              _selectedImages
                                                                  .length,
                                                        ),
                                                      )
                                                    : const SizedBox.shrink(),
                                                !isImagesSizeValid
                                                    ? Text(
                                                        'Maksimalus nuotraukų dydis 20 MB',
                                                        style: TextStyle(
                                                          color: const Color(
                                                              0xFFe53935),
                                                          fontSize: constraints
                                                                  .maxWidth *
                                                              0.01,
                                                        ),
                                                      )
                                                    : const SizedBox.shrink(),
                                                SizedBox(
                                                  height: constraints.maxWidth *
                                                      0.02,
                                                ),
                                                SizedBox(
                                                  width: isMobile
                                                      ? constraints.maxWidth *
                                                          0.6
                                                      : constraints.maxWidth *
                                                          0.3,
                                                  child: AppButton(
                                                    text: 'Siųsti pranešimą',
                                                    backgroundColor:
                                                        AppTheme.mainThemeColor,
                                                    onPressed: () {
                                                      if (_formKey.currentState!
                                                              .validate() &&
                                                          isImagesSizeValid) {
                                                        context
                                                            .read<HomeBloc>()
                                                            .add(
                                                              SendSystemErrorReport(
                                                                email: email,
                                                                description:
                                                                    description,
                                                                images: _selectedImages
                                                                        .isEmpty
                                                                    ? null
                                                                    : _selectedImages,
                                                              ),
                                                            );
                                                      }
                                                    },
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: constraints.maxWidth *
                                                      0.05,
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
                                                  height: constraints.maxWidth *
                                                      0.08,
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
                                                  height: constraints.maxWidth *
                                                      0.08,
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
      ),
    );
  }
}
