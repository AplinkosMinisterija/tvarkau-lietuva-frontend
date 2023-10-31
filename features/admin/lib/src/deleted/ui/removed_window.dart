import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../bloc/removed_bloc.dart';

class RemovedWindow extends StatelessWidget {
  final double screenWidth;
  final String viewType;
  final ValueChanged<bool> isHovering;
  final String activeEmail;

  const RemovedWindow({
    required this.screenWidth,
    required this.viewType,
    required this.isHovering,
    required this.activeEmail,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => RemovedBloc(),
        child: BlocBuilder<RemovedBloc, RemovedState>(
          builder: (BuildContext context, RemovedState state) {
            return BlocBuilder<RemovedBloc, RemovedState>(
              builder: (BuildContext context, RemovedState state) {
                if (state is ContentState) {
                  final List<ReportModel> trashReports = state.trashReports;
                  return DeletedReportsTable(
                    width: screenWidth,
                    reports: trashReports,
                    onUpdate: (updatedModel, editor, officerFiles) {
                      Navigator.of(context).pop();
                      context.read<RemovedBloc>().add(
                            UpdateReport(
                              id: updatedModel.id,
                              name: updatedModel.name,
                              reportLong: updatedModel.reportLong,
                              reportLat: updatedModel.reportLat,
                              status: updatedModel.status,
                              comment: updatedModel.comment ?? '',
                              isVisible:
                                  updatedModel.isVisible! ? "true" : "false",
                              isDeleted:
                                  updatedModel.isDeleted! ? "true" : "false",
                              editor: editor,
                              officerImageFiles: officerFiles,
                            ),
                          );
                    }, activeEmail: activeEmail,
                  );
                } else if (state is LoadingState) {
                  return Center(
                    child: LoadingAnimationWidget.staggeredDotsWave(
                        color: AppTheme.mainThemeColor, size: 150),
                  );
                } else if (state is ErrorState) {
                  return ErrorReloadWidget(
                    onPressed: () {
                      context.read<RemovedBloc>().add(
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
