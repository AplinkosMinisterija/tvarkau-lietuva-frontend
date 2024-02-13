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
    return Scaffold(
      backgroundColor: const Color.fromRGBO(250, 242, 234, 1),
      body: _ReportCategoryScreenBody(),
    );
  }
}

class _ReportCategoryScreenBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 600),
        child: ListView(
          padding: const EdgeInsets.all(16),
          shrinkWrap: true,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                onPressed: () {
                  context.goNamed("home");
                },
                icon: const Icon(Icons.arrow_back_rounded),
              ),
            ),
            const SizedBox(height: 24),
            const UrgentWarningWidget(),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 700),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      'Pasirinkite norimą pranešimo kategoriją:',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                  ReportCategorySelector(
                    title: 'Miškai',
                    description:
                        'Jeigu matote sudraskytas samanas, sugadintą miško paklotę, itin gilias provėžas miške arba sugadintą miško kelią',
                    onTap: () {
                      context.goNamed('newReportForest');
                    },
                    iconName: 'forest_icon',
                  ),
                  ReportCategorySelector(
                    title: 'Atliekos',
                    description: 'Jeigu pastebite gamtoje paliktas atliekas',
                    onTap: () {
                      context.goNamed('newReportTrash');
                    },
                    iconName: 'recycle_icon',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
