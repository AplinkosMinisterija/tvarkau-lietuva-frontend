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
        create: (BuildContext context) => HomeBloc(),
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (BuildContext context, HomeState state) {
            return BlocBuilder<HomeBloc, HomeState>(
              builder: (BuildContext context, HomeState state) {
                if (state is ContentState) {
                  return ReportsScreen(
                    trashReports: state.trashReports,
                    dumpReports: state.dumpReports,
                    reportStatistics: state.reportStatistics,
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
                  );
                } else if (state is LoadingState) {
                  return LoaderWidget().loader();
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
