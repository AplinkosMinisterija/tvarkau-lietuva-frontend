import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../bloc/information_bloc.dart';
import 'information_screen_mobile.dart';
import 'information_screen_web.dart';

class InformationScreen extends StatelessWidget {
  final String reportId;

  const InformationScreen({
    required this.reportId,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String? refId = getRefId(reportId);
    return BlocProvider(
        create: (BuildContext context) => InformationBloc(refId: refId),
        child: BlocBuilder<InformationBloc, InformationState>(
          builder: (BuildContext context, InformationState state) {
            return BlocBuilder<InformationBloc, InformationState>(
              builder: (BuildContext context, InformationState state) {
                if (state is ContentState) {
                  Size size = MediaQuery.of(context).size;
                  if (size.width > 900) {
                    return InformationScreenWeb(
                        width: size.width / 2.6,
                        height: size.height,
                        report: state.trashReport);
                  } else {
                    return InformationScreenMobile(
                      width: size.width,
                      height: size.height,
                      report: state.trashReport,
                    );
                  }
                } else if (state is LoadingState) {
                  return Scaffold(
                    body: LoaderWidget().loader(),
                  );
                } else if (state is ErrorState) {
                  return Scaffold(
                    body: ErrorReloadWidget(
                      onPressed: () {
                        context.read<InformationBloc>().add(
                              ReloadPage(),
                            );
                      },
                      onErrorReport: () {
                        context.goNamed('error_report');
                      },
                    ),
                  );
                } else if (state is NotFoundState) {
                  return Scaffold(
                    body: NotFoundWidget(
                      onPressed: () {
                        context.goNamed('home');
                      },
                      errorText: state.errorMessage,
                      descriptionText: state.descriptionMessage,
                    ),
                  );
                }else {
                  return const SizedBox.shrink();
                }
              },
            );
          },
        ));
  }

  String? getRefId(String query) {
    try {
      var trimmedQuery = query.replaceAll('TLP-A', '');
      var formattedQuery = trimmedQuery.substring(
          trimmedQuery.indexOf(RegExp(r'[1-9]')), trimmedQuery.length);
      return formattedQuery;
    } catch (e) {
      return null;
    }
  }
}
