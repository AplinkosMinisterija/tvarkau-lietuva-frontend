import 'package:dashboard/src/adding_report/ui/widgets/forest_report_category_widget.dart';
import 'package:dashboard/src/adding_report/ui/widgets/urgent_warning_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class ReportCategoryScreen extends StatelessWidget {
  const ReportCategoryScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Title(
      title: "Pasirinkti pranešimo kategoriją",
      color: Colors.green,
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(250, 242, 234, 1),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      width: constraints.maxWidth < 900
                          ? constraints.maxWidth / 1.1
                          : constraints.maxWidth / 1.8,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                          onPressed: () {
                            context.goNamed("home");
                          },
                          icon: Icon(
                            Icons.arrow_back_rounded,
                            size: constraints.maxWidth < 900
                                ? constraints.maxWidth * 0.05
                                : constraints.maxWidth * 0.02,
                          ),
                        ),
                      )),
                  const SizedBox(height: 40),
                  UrgentWarningWidget(
                      constraints: constraints.maxWidth < 900
                          ? constraints * 1.7
                          : constraints),
                  const SizedBox(height: 60),
                  Text(
                    'Pasirinkite norimą pranešimo kategoriją',
                    style: GoogleFonts.roboto(
                      fontSize: constraints.maxWidth < 900
                          ? constraints.maxWidth * 0.045
                          : constraints.maxWidth * 0.018,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ForestReportCategoryWidget(
                    title: 'Miškai',
                    description:
                        'Jeigu įtariate nelegalų kirtimą, pastebite sunkiosios technikos paliktas provėžas',
                    constraints: constraints.maxWidth < 900
                        ? constraints * 2
                        : constraints,
                    onTap: () {
                      context.goNamed('newReportForest');
                    },
                    iconName: 'forest_icon',
                  ),
                  const SizedBox(height: 50),
                  ForestReportCategoryWidget(
                    title: 'Atliekos',
                    description: 'Jeigu pastebite gamtoje paliktas atliekas',
                    constraints: constraints.maxWidth < 900
                        ? constraints * 2
                        : constraints,
                    onTap: () {
                      context.goNamed('newReportTrash');
                    },
                    iconName: 'recycle_icon',
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
