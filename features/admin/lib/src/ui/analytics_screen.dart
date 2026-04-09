import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../bloc/analytics/analytics_bloc.dart';
import 'analytics_window.dart';

class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({
    super.key,
  });

  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
          create: (BuildContext context) => AnalyticsBloc(),
          child: BlocBuilder<AnalyticsBloc, AnalyticsState>(
            builder: (BuildContext context, AnalyticsState state) {
              return BlocBuilder<AnalyticsBloc, AnalyticsState>(
                builder: (BuildContext context, AnalyticsState state) {
                  if (state is ContentState) {
                    return AnalyticsWindow(
                      analytics: state.analytics,
                      onBackPress: () {
                        context.goNamed('admin');
                      },
                      onLoadAnalytics: (String dateFrom, String dateTo,
                          String? status, String? category) {
                        context.read<AnalyticsBloc>().add(UpdateAnalyticsData(
                            dateFrom: dateFrom,
                            dateTo: dateTo,
                            status: status,
                            category: category));
                      },
                    );
                  } else if (state is LoadingState) {
                    return LoaderWidget().loader();
                  } else if (state is ErrorState) {
                    return ErrorReloadWidget(
                      onPressed: () {
                        context.read<AnalyticsBloc>().add(
                              ReloadPage(),
                            );
                      },
                      onErrorReport: () {
                        context.goNamed('error_report');
                      },
                    );
                  } else {
                    return Container(
                      color: const Color.fromRGBO(57, 97, 84, 1),
                    );
                  }
                },
              );
            },
          )),
    );
  }
}
