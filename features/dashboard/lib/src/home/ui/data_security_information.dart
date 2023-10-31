import 'package:core_ui/core_ui.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:flutter/material.dart';

class DataSecurityInformation extends StatelessWidget {
  const DataSecurityInformation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return width > 900
        ? Dialog.fullscreen(
            backgroundColor: const Color.fromRGBO(250, 242, 234, 1),
            child: PointerInterceptor(
              child: Drawer(
                width: double.infinity,
                backgroundColor: const Color.fromRGBO(250, 242, 234, 1),
                child: Stack(alignment: Alignment.topCenter, children: [
                  Container(
                    height: height * 0.6,
                    color: const Color.fromRGBO(57, 97, 84, 1),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: height * 0.005),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.arrow_back_outlined,
                                size: width * 0.01386,
                                color: Colors.white,
                              ),
                              SizedBox(width: width * 0.01386),
                              SizedBox(
                                width: width * 0.07036,
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
                        SizedBox(width: width / 6),
                        DepartmentLogoMobile(width: width / 3, onTap: (){
                          Navigator.of(context).pop();
                        },),
                      ],
                    ),
                  ),
                  Container(
                      height: height,
                      width: width / 2.4,
                      padding: EdgeInsets.only(top: height * 0.1),
                      child: SfPdfViewer.asset('assets/documents/BDAR.pdf')),
                ]),
              ),
            ),
          )
        : Dialog.fullscreen(
            backgroundColor: const Color.fromRGBO(250, 242, 234, 1),
            child: PointerInterceptor(
              child: Drawer(
                width: double.infinity,
                backgroundColor: const Color.fromRGBO(250, 242, 234, 1),
                child: Stack(alignment: Alignment.topCenter, children: [
                  Container(
                    height: height * 0.6,
                    color: const Color.fromRGBO(57, 97, 84, 1),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: height * 0.005),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.arrow_back_outlined,
                                size: width * 0.02158,
                                color: Colors.white,
                              ),
                              SizedBox(width: width * 0.02158),
                              SizedBox(
                                width: width * 0.1111,
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
                        SizedBox(width: width / 5),
                        DepartmentLogoMobile(width: width / 1.5, onTap: (){
                          Navigator.of(context).pop();
                        },),
                      ],
                    ),
                  ),
                  Container(
                      height: height,
                      width: width * 0.9,
                      padding: EdgeInsets.only(top: height * 0.1),
                      child: SfPdfViewer.asset('assets/documents/BDAR.pdf')),
                ]),
              ),
            ),
          );
  }
}
