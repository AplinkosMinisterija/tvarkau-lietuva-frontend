import 'package:api_client/api_client.dart';
import 'package:core/core.dart';
import 'package:dashboard/src/home/ui/tile_providers.dart';
import 'package:dashboard/src/report_information/ui/information_screen_widget_utils.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:core_ui/core_ui.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'package:latlong2/latlong.dart';
import 'dart:ui' as ui;

class InformationScreenMobile extends StatefulWidget {
  const InformationScreenMobile({
    required this.width,
    required this.height,
    required this.report,
    super.key,
  });

  final double width;
  final double height;
  final PublicReportDto report;

  @override
  State<InformationScreenMobile> createState() =>
      _InformationScreenMobileState();
}

class _InformationScreenMobileState extends State<InformationScreenMobile> {
  Set<Marker> markers = {};
  int textLinesCount = 0;
  int departmentAnswerTextLinesCount = 0;
  int imageLineCount = 0;

  late Widget statusWidget;
  late Widget firstStageWidget;
  late Widget falseReportWidget;
  late Widget secondStageWidget;
  late Widget thirdStageWidgetFalse;
  late Widget thirdStageWidgetTrue;
  late Widget finalStageWidget;
  double firstStageLineHeight = 0;
  double thirdStageLineHeight = 0;

  late TextSpan span;
  late TextSpan span2;
  late TextPainter tp;
  late TextPainter tp2;
  int strLength = 0;
  String str = '';

  @override
  void initState() {
    span = TextSpan(
        text: widget.report.name,
        style: GoogleFonts.roboto(
          fontSize: widget.width * 0.04444,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        ));
    span2 = TextSpan(
        text: widget.report.comment != ' ' ? widget.report.comment : '',
        style: GoogleFonts.roboto(
          fontSize: widget.width * 0.04444,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        ));
    tp = TextPainter(text: span, textDirection: TextDirection.ltr);
    tp.layout(maxWidth: widget.width);
    textLinesCount = tp.computeLineMetrics().length;
    tp2 = TextPainter(text: span2, textDirection: TextDirection.ltr);
    tp2.layout(maxWidth: widget.width);
    departmentAnswerTextLinesCount = tp2.computeLineMetrics().length;
    if (widget.report.imageUrls.isEmpty) {
      imageLineCount = 0;
    } else if (widget.report.imageUrls.length < 3) {
      imageLineCount = 1;
    } else if (widget.report.imageUrls.length > 2) {
      imageLineCount = 2;
    }
    strLength = 8 - widget.report.refId.length;
    str = '0' * strLength;

    statusWidget = InformationScreenWidgetUtils()
        .getStatusWidget(widget.report.status, widget.width);
    firstStageWidget = getFirstStageWidget();
    falseReportWidget = getFalseReportWidget();
    secondStageWidget = getSecondStageWidget();
    thirdStageWidgetFalse = getThirdStageWidget(false);
    thirdStageWidgetTrue = getThirdStageWidget(true);
    finalStageWidget = getFinalStageWidget();
    firstStageLineHeight = calculateFirstStageDottedLineHeight();
    thirdStageLineHeight = calculateThirdStageDottedLineHeight();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Title(
      title: "Pranešimo informacija",
      color: const Color.fromRGBO(28, 63, 58, 1),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                width: widget.width,
                height: widget.width * 0.8666,
                color: const Color.fromRGBO(28, 63, 58, 1),
              ),
              Padding(
                padding: EdgeInsets.all(widget.width * 0.0444),
                child: Column(
                  children: [
                    SizedBox(height: widget.width * 0.05),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        LogoButton(
                            width: widget.width * 0.4615,
                            onTap: () {
                              context.goNamed('home');
                            }),
                        IconButton(
                            onPressed: () => _showDialog(),
                            icon: Icon(
                              Icons.menu_sharp,
                              size: widget.width * 0.08,
                              color: Colors.white,
                            ))
                      ],
                    ),
                    SizedBox(height: widget.width * 0.1333),
                    InkWell(
                      onTap: () {
                        context.goNamed("home");
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.arrow_back_outlined,
                            size: widget.width * 0.0416,
                            color: Colors.white,
                          ),
                          SizedBox(width: widget.width * 0.0416),
                          SizedBox(
                            width: widget.width * 0.2111,
                            child: FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Text(
                                'Grįžti atgal',
                                style: GoogleFonts.roboto(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: widget.width * 0.0472),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: widget.width * 0.5666,
                          child: FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Text(
                              '#TLP-A$str${widget.report.refId.toUpperCase()}',
                              style: GoogleFonts.roboto(
                                  fontSize: 32,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        statusWidget,
                      ],
                    ),
                    SizedBox(height: widget.width * 0.0333),
                    SizedBox(
                      height: widget.width * 0.7777,
                      width: widget.width * 0.911,
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                        child: Stack(
                          children: [
                            FlutterMap(
                                options: MapOptions(
                                    initialZoom: 14,
                                    initialCenter: LatLng(
                                        widget.report.latitude,
                                        widget.report.longitude)),
                                children: [
                                  openStreetMapTileLayer,
                                  MarkerLayer(markers: [
                                    Marker(
                                        point: LatLng(widget.report.latitude,
                                            widget.report.longitude),
                                        child: SvgPicture.asset(
                                            'assets/svg/pin_icon.svg'))
                                  ])
                                ]),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: widget.width * 0.075),
                    Stack(
                      children: [
                        Padding(
                            padding: EdgeInsets.only(
                                left: widget.width * 0.054166,
                                top: widget.width * 0.1111),
                            child: DottedLine(
                              dashLength: widget.width * 0.01111,
                              dashGapLength: widget.width * 0.01111,
                              lineThickness: widget.width * 0.002777,
                              dashColor: const Color.fromRGBO(222, 224, 224, 1),
                              direction: Axis.vertical,
                              lineLength: firstStageLineHeight,
                            )),
                        firstStageWidget,
                      ],
                    ),
                    widget.report.status == 'nepasitvirtino'
                        ? falseReportWidget
                        : const SizedBox.shrink(),
                    widget.report.status == 'tiriamas'
                        ? Stack(
                            children: [
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: widget.width * 0.054166,
                                      top: widget.width * 0.1111),
                                  child: DottedLine(
                                    dashLength: widget.width * 0.01111,
                                    dashGapLength: widget.width * 0.01111,
                                    lineThickness: widget.width * 0.002777,
                                    dashColor:
                                        const Color.fromRGBO(222, 224, 224, 1),
                                    direction: Axis.vertical,
                                    lineLength: widget.width * 0.125,
                                  )),
                              secondStageWidget,
                            ],
                          )
                        : const SizedBox.shrink(),
                    widget.report.status == 'išspręsta'
                        ? Stack(
                            children: [
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: widget.width * 0.054166,
                                      top: widget.width * 0.1111),
                                  child: DottedLine(
                                    dashLength: widget.width * 0.01111,
                                    dashGapLength: widget.width * 0.01111,
                                    lineThickness: widget.width * 0.002777,
                                    dashColor:
                                        const Color.fromRGBO(222, 224, 224, 1),
                                    direction: Axis.vertical,
                                    lineLength: widget.width * 0.125 +
                                        thirdStageLineHeight,
                                  )),
                              Column(
                                children: [
                                  secondStageWidget,
                                  thirdStageWidgetTrue,
                                  finalStageWidget,
                                ],
                              )
                            ],
                          )
                        : const SizedBox.shrink(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  double calculateFirstStageDottedLineHeight() {
    var textLines = textLinesCount == 1 ? 1 : textLinesCount + 1;
    double firstGap = widget.width * 0.08055;
    double textGap = widget.width * 0.067063 * textLines;
    double secondGap = widget.width * 0.056;
    double imageGap = 0;
    if (imageLineCount == 1) {
      imageGap = widget.width * 0.27777;
    } else if (imageLineCount == 2) {
      imageGap = widget.width * 0.6;
    }
    double thirdGap = widget.width * 0.1111;
    double height = firstGap + textGap + secondGap + imageGap + thirdGap;
    return height;
  }

  double calculateThirdStageDottedLineHeight() {
    var depTextLines = departmentAnswerTextLinesCount == 1
        ? 1
        : departmentAnswerTextLinesCount + 1;
    double imageGap = 0;
    if (widget.report.officerImageUrls.isNotEmpty) {
      imageGap = widget.report.officerImageUrls.length <= 2
          ? widget.width * 0.27778
          : widget.width * 0.61;
    }
    double firstGap = widget.width * 0.2111;
    double textGap = widget.width * 0.067063 * depTextLines;
    double secondGap = widget.width * 0.2111;

    double height = firstGap + textGap + secondGap + imageGap;
    return height;
  }

  Widget getThirdStageWidget(bool isFinal) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: calculateThirdStageDottedLineHeight(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: widget.width * 0.1111,
                width: widget.width * 0.1111,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromRGBO(57, 97, 84, 1)),
                child: SizedBox(
                  height: widget.width * 0.05555,
                  width: widget.width * 0.05555,
                  child: SvgPicture.asset(
                    'assets/svg/progress_third_stage_icon.svg',
                    colorFilter: const ui.ColorFilter.mode(
                      Color.fromRGBO(255, 255, 255, 1),
                      ui.BlendMode.srcIn,
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              !isFinal
                  ? SizedBox(
                      height: calculateThirdStageDottedLineHeight() -
                          widget.width * 0.2222,
                    )
                  : const SizedBox.shrink(),
              !isFinal
                  ? Container(
                      height: widget.width * 0.1111,
                      width: widget.width * 0.1111,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromRGBO(241, 244, 243, 1)),
                      child: SizedBox(
                        height: widget.width * 0.05555,
                        width: widget.width * 0.05555,
                        child: SvgPicture.asset(
                          'assets/svg/progress_fourth_stage_icon.svg',
                          colorFilter: const ui.ColorFilter.mode(
                            Color.fromRGBO(57, 97, 84, 1),
                            ui.BlendMode.srcIn,
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        ),
        SizedBox(width: widget.width * 0.0444),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Pranešimas išspręstas',
              style: GoogleFonts.roboto(
                fontSize: widget.width * 0.05555,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            SizedBox(height: widget.width * 0.01111),
            Text(
              getFormattedDate('išspręsta'),
              style: GoogleFonts.roboto(
                  fontSize: widget.width * 0.03888,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromRGBO(0, 0, 0, 0.72)),
            ),
            SizedBox(
                height:
                    widget.report.comment != ' ' ? widget.width * 0.0805 : 0),
            widget.report.comment != ' ' && widget.report.comment != ''
                ? SizedBox(
                    width: widget.width * 0.73055,
                    child: Text(
                      'AAD atsakymas:',
                      textAlign: TextAlign.left,
                      style: GoogleFonts.roboto(
                        fontSize: widget.width * 0.04444,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
            SizedBox(height: widget.width * 0.02777),
            SizedBox(
              width: widget.width * 0.73055,
              child: Text(
                widget.report.comment,
                textAlign: TextAlign.left,
                style: GoogleFonts.roboto(
                  fontSize: widget.width * 0.04444,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ),
            widget.report.officerImageUrls.isNotEmpty
                ? ImageGallery().buildImages(
                    imageUrls: FormatterUtils().formatImageUrls(
                        widget.report.officerImageUrls.toList()),
                    context: context,
                    width: widget.width * 0.7,
                    titlesEnabled: false,
                    isDownloadEnabled: false,
                  )
                : const SizedBox.shrink(),
          ],
        )
      ],
    );
  }

  Widget getSecondStageWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: widget.width * 0.1111,
          width: widget.width * 0.1111,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color.fromRGBO(241, 244, 243, 1),
          ),
          child: SizedBox(
            height: widget.width * 0.05555,
            width: widget.width * 0.05555,
            child: SvgPicture.asset(
              'assets/svg/progress_second_stage_icon.svg',
              colorFilter: const ui.ColorFilter.mode(
                Color.fromRGBO(57, 97, 84, 1),
                ui.BlendMode.srcIn,
              ),
              fit: BoxFit.fill,
            ),
          ),
        ),
        SizedBox(width: widget.width * 0.0444),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Pranešimas tiriamas',
              style: GoogleFonts.roboto(
                fontSize: widget.width * 0.05555,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            SizedBox(height: widget.width * 0.01111),
            Text(
              getFormattedDate('tiriamas'),
              style: GoogleFonts.roboto(
                  fontSize: widget.width * 0.03888,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromRGBO(0, 0, 0, 0.72)),
            ),
            if (widget.report.status == 'tiriamas') ...[
              SizedBox(
                  height:
                      widget.report.comment != ' ' ? widget.width * 0.0805 : 0),
              widget.report.comment != ' ' && widget.report.comment != ''
                  ? SizedBox(
                      width: widget.width * 0.713055,
                      child: Text(
                        'AAD atsakymas:',
                        textAlign: TextAlign.left,
                        style: GoogleFonts.roboto(
                          fontSize: widget.width * 0.04444,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
              SizedBox(height: widget.width * 0.02777),
              SizedBox(
                width: widget.width * 0.73055,
                child: Text(
                  widget.report.comment,
                  textAlign: TextAlign.left,
                  style: GoogleFonts.roboto(
                    fontSize: widget.width * 0.04444,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ),
              widget.report.officerImageUrls.isNotEmpty
                  ? ImageGallery().buildImages(
                      imageUrls: FormatterUtils().formatImageUrls(
                          widget.report.officerImageUrls.toList()),
                      context: context,
                      width: widget.width * 0.7,
                      titlesEnabled: false,
                      isDownloadEnabled: false,
                    )
                  : const SizedBox.shrink(),
            ],
            SizedBox(height: widget.width * 0.1111),
          ],
        )
      ],
    );
  }

  Widget getFinalStageWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: widget.width * 0.1111,
          width: widget.width * 0.1111,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
              shape: BoxShape.circle, color: Color.fromRGBO(241, 244, 243, 1)),
          child: SizedBox(
            height: widget.width * 0.05555,
            width: widget.width * 0.05555,
            child: SvgPicture.asset(
              'assets/svg/progress_fourth_stage_icon.svg',
              colorFilter: const ui.ColorFilter.mode(
                Color.fromRGBO(57, 97, 84, 1),
                ui.BlendMode.srcIn,
              ),
              fit: BoxFit.fill,
            ),
          ),
        ),
        SizedBox(width: widget.width * 0.0444),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Išspręsta',
              style: GoogleFonts.roboto(
                fontSize: widget.width * 0.05555,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            SizedBox(height: widget.width * 0.01111),
            Text(
              getFormattedDate('išspręsta'),
              style: GoogleFonts.roboto(
                  fontSize: widget.width * 0.03888,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromRGBO(0, 0, 0, 0.72)),
            ),
          ],
        )
      ],
    );
  }

  Widget getFalseReportWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: widget.width * 0.1111,
          width: widget.width * 0.1111,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
              shape: BoxShape.circle, color: Color.fromRGBO(241, 244, 243, 1)),
          child: SizedBox(
            height: widget.width * 0.05555,
            width: widget.width * 0.05555,
            child: SvgPicture.asset(
              'assets/svg/progress_fourth_stage_icon.svg',
              colorFilter: const ui.ColorFilter.mode(
                Color.fromRGBO(57, 97, 84, 1),
                ui.BlendMode.srcIn,
              ),
              fit: BoxFit.fill,
            ),
          ),
        ),
        SizedBox(width: widget.width * 0.0444),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Pranešimas nepasitvirtino',
              style: GoogleFonts.roboto(
                fontSize: widget.width * 0.05555,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            SizedBox(height: widget.width * 0.01111),
            Text(
              getFormattedDate('nepasitvirtino'),
              style: GoogleFonts.roboto(
                  fontSize: widget.width * 0.03888,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromRGBO(0, 0, 0, 0.72)),
            ),
            SizedBox(height: widget.width * 0.0666),
            SizedBox(
              width: widget.width * 0.73055,
              child: Text(
                widget.report.comment,
                textAlign: TextAlign.left,
                style: GoogleFonts.roboto(
                  fontSize: widget.width * 0.04444,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: widget.width * 0.0666),
            widget.report.officerImageUrls.isNotEmpty
                ? ImageGallery().buildImages(
                    imageUrls: FormatterUtils().formatImageUrls(
                        widget.report.officerImageUrls.toList()),
                    context: context,
                    width: widget.width * 0.7,
                    titlesEnabled: false,
                    isDownloadEnabled: false,
                  )
                : const SizedBox.shrink(),
          ],
        )
      ],
    );
  }

  Widget getFirstStageWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: widget.width * 0.1111,
          width: widget.width * 0.1111,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
              shape: BoxShape.circle, color: Color.fromRGBO(241, 244, 243, 1)),
          child: SizedBox(
            height: widget.width * 0.05555,
            width: widget.width * 0.05555,
            child: SvgPicture.asset(
              'assets/svg/progress_first_stage_icon.svg',
              colorFilter: const ui.ColorFilter.mode(
                Color.fromRGBO(57, 97, 84, 1),
                ui.BlendMode.srcIn,
              ),
              fit: BoxFit.fill,
            ),
          ),
        ),
        SizedBox(width: widget.width * 0.0444),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Gautas pranešimas',
              style: GoogleFonts.roboto(
                fontSize: widget.width * 0.05555,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            SizedBox(height: widget.width * 0.01111),
            Text(
              getFormattedDate('gautas'),
              style: GoogleFonts.roboto(
                  fontSize: widget.width * 0.03888,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromRGBO(0, 0, 0, 0.72)),
            ),
            SizedBox(height: widget.width * 0.0666),
            SizedBox(
              width: widget.width * 0.73055,
              child: Text(
                widget.report.name,
                textAlign: TextAlign.left,
                style: GoogleFonts.roboto(
                  fontSize: widget.width * 0.04444,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ),
            widget.report.imageUrls.isNotEmpty
                ? ImageGallery().buildImages(
                    imageUrls: FormatterUtils()
                        .formatImageUrls(widget.report.imageUrls.toList()),
                    context: context,
                    width: widget.width * 0.7,
                    titlesEnabled: false,
                    isDownloadEnabled: false,
                  )
                : const SizedBox.shrink(),
          ],
        )
      ],
    );
  }

  String getFormattedDate(String status) {
    final statusRecord = widget.report.statusRecords
        .where((element) => element.status == status)
        .singleOrNull;
    return FormatterUtils()
        .formatDate(statusRecord?.date ?? widget.report.reportDate);
  }

  void _showDialog() {
    showGeneralDialog(
      context: context,
      pageBuilder: (context, anim1, anim2) {
        return Align(
          alignment: Alignment.bottomRight,
          child: Row(
            children: [
              PointerInterceptor(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: widget.width * 0.1,
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                width: widget.width * 0.9,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    bottomLeft: Radius.circular(5),
                  ),
                ),
                child: PointerInterceptor(
                  child: Scaffold(
                    body: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: widget.width * 0.05,
                          bottom: widget.width * 0.03,
                          right: widget.width * 0.05,
                          top: widget.width * 0.1,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Align(
                              alignment: Alignment.centerRight,
                              child: IconButton(
                                  iconSize: widget.width * 0.08,
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  icon: Icon(
                                    Icons.close_sharp,
                                    color: Colors.black,
                                    size: widget.width * 0.08,
                                  )),
                            ),
                            SizedBox(height: widget.width * 0.0555),
                            Footer(
                              width: widget.width * 0.9,
                              isMobile: true,
                              onErrorReportPress: () {
                                context.goNamed('error_report');
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position: Tween(begin: const Offset(1, 0), end: const Offset(0, 0))
              .animate(anim1),
          child: child,
        );
      },
      transitionDuration: const Duration(milliseconds: 300),
    );
  }
}
