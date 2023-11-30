import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:dashboard/src/home/bloc/home_bloc.dart';
import 'package:dashboard/src/home/ui/data_security_information.dart';
import 'package:dashboard/src/home/ui/reports_screen.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => HomeBloc(),
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (BuildContext context, HomeState state) {
            return BlocBuilder<HomeBloc, HomeState>(
              builder: (BuildContext context, HomeState state) {
                if (state is ContentState) {
                  final List<ReportModel> trashReports = state.trashReports;
                  final dumpReports = state.dumpReports;
                  return ReportsScreen(
                    trashReports: trashReports,
                    dumpReports: dumpReports,
                    onAddTap: (double width, double height) {
                      context.goNamed('newReport');
                    },
                    onInformationTap: (String refId) {
                      int strLength = 8 - refId.length;
                      String str = '0' * strLength;

                      context.goNamed('report', queryParameters: {
                        'id': 'TLP-A$str${refId.toUpperCase()}'
                      });
                    },
                    onDataSecurityTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) =>
                              const DataSecurityInformation());
                    },
                  );
                } else if (state is LoadingState) {
                  return Center(
                    child: LoadingAnimationWidget.staggeredDotsWave(
                        color: AppTheme.mainThemeColor, size: 150),
                  );
                } else if (state is ErrorState) {
                  return ErrorReloadWidget(
                    onPressed: () {
                      context.read<HomeBloc>().add(
                            ReloadPage(),
                          );
                    },
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            );
          },
        ));
  }
}
