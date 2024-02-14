import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:dashboard/src/home/bloc/home_bloc.dart';
import 'package:dashboard/src/home/ui/reports_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => HomeBloc()..add(LoadData()),
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (BuildContext context, HomeState state) {
            return BlocBuilder<HomeBloc, HomeState>(
              builder: (BuildContext context, HomeState state) {
                switch (state) {
                  case LoadingState():
                    return LoaderWidget().loader();
                  case InitState():
                    return ReportsScreen(
                      reports: state.reports,
                      dumpReports: null,
                      reportStatistics: state.reportStatistics,
                      onAddTap: (double width, double height) {
                        context.goNamed('report_category');
                      },
                      onInformationTap: (String refId) {
                        int strLength = 8 - refId.length;
                        String str = '0' * strLength;

                        context.goNamed('report', queryParameters: {
                          'id': 'TLP-A$str${refId.toUpperCase()}'
                        });
                      },
                      category: ' ',
                      onCategoryChange: (value) {
                        value == 'Atliekos'
                            ? context.read<HomeBloc>().add(
                                  LoadTrashData(),
                                )
                            : context.read<HomeBloc>().add(
                                  LoadForestData(),
                                );
                      },
                    );
                  case TrashState():
                    return ReportsScreen(
                      reports: state.reports,
                      dumpReports: state.dumpReports,
                      reportStatistics: state.reportStatistics,
                      onAddTap: (double width, double height) {
                        context.goNamed('report_category');
                      },
                      onInformationTap: (String refId) {
                        int strLength = 8 - refId.length;
                        String str = '0' * strLength;

                        context.goNamed('report', queryParameters: {
                          'id': 'TLP-A$str${refId.toUpperCase()}'
                        });
                      },
                      category: 'trash',
                      onCategoryChange: (value) {
                        value == 'Atliekos'
                            ? context.read<HomeBloc>().add(
                                  LoadTrashData(),
                                )
                            : context.read<HomeBloc>().add(
                                  LoadForestData(),
                                );
                      },
                    );
                  case ForestState():
                    return ReportsScreen(
                      reports: state.reports,
                      dumpReports: null,
                      reportStatistics: state.reportStatistics,
                      onAddTap: (double width, double height) {
                        context.goNamed('report_category');
                      },
                      onInformationTap: (String refId) {
                        int strLength = 8 - refId.length;
                        String str = '0' * strLength;

                        context.goNamed('report', queryParameters: {
                          'id': 'TLP-A$str${refId.toUpperCase()}'
                        });
                      },
                      category: 'forest',
                      onCategoryChange: (value) {
                        value == 'Atliekos'
                            ? context.read<HomeBloc>().add(
                                  LoadTrashData(),
                                )
                            : context.read<HomeBloc>().add(
                                  LoadForestData(),
                                );
                      },
                    );
                  case ErrorState():
                    return ErrorReloadWidget(
                      onPressed: () {
                        context.read<HomeBloc>().add(
                              ReloadPage(),
                            );
                      },
                      errorText: state.errorMessage,
                    );
                }
                return const SizedBox.shrink();
              },
            );
          },
        ));
  }
}
