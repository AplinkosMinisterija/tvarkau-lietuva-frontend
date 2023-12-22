import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../bloc/trash_bloc.dart';

class TrashWindow extends StatelessWidget {
  final double screenWidth;
  final String viewType;
  final ValueChanged<bool> isHovering;
  final String activeEmail;

  const TrashWindow({
    required this.screenWidth,
    required this.viewType,
    required this.isHovering,
    required this.activeEmail,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => TrashBloc(),
        child: BlocBuilder<TrashBloc, TrashState>(
          builder: (BuildContext context, TrashState state) {
            return BlocBuilder<TrashBloc, TrashState>(
              builder: (BuildContext context, TrashState state) {
                if (state is ContentState) {
                  return viewType == 'chart'
                      ? AdminReportsTable(
                          width: screenWidth,
                          reports: state.trashReports,
                          onUpdate: (updatedModel, officerFiles) {
                            Navigator.of(context).pop();
                            context.read<TrashBloc>().add(
                                  UpdateReport(
                                    id: updatedModel.id,
                                    refId: updatedModel.id,
                                    name: updatedModel.name,
                                    reportLong: updatedModel.reportLong,
                                    reportLat: updatedModel.reportLat,
                                    status: updatedModel.status,
                                    comment: updatedModel.comment ?? '',
                                    isVisible: updatedModel.isVisible!
                                        ? "true"
                                        : "false",
                                    isDeleted: updatedModel.isDeleted!
                                        ? "true"
                                        : "false",
                                    imageUrls: updatedModel.imageUrls ?? [],
                                    officerImageUrls: updatedModel.officerImageUrls??[],
                                    officerImageFiles: officerFiles,
                                  ),
                                );
                          },
                        )
                      : AdminTrashMap(
                          width: screenWidth,
                          trashReports: state.trashReports,
                          isHovering: isHovering,
                          onUpdate: (updatedModel, officerFiles) {
                            Navigator.of(context).pop();
                            context.read<TrashBloc>().add(
                                  UpdateReport(
                                    id: updatedModel.id,
                                    refId: updatedModel.id,
                                    name: updatedModel.name,
                                    reportLong: updatedModel.reportLong,
                                    reportLat: updatedModel.reportLat,
                                    status: updatedModel.status,
                                    comment: updatedModel.comment ?? '',
                                    isVisible: updatedModel.isVisible!
                                        ? "true"
                                        : "false",
                                    isDeleted: updatedModel.isDeleted!
                                        ? "true"
                                        : "false",
                                    officerImageFiles: officerFiles,
                                    officerImageUrls: updatedModel.officerImageUrls??[],
                                    imageUrls: updatedModel.imageUrls??[],
                                  ),
                                );
                          },
                        );
                } else if (state is LoadingState) {
                  return Center(
                    child: LoadingAnimationWidget.staggeredDotsWave(
                        color: AppTheme.mainThemeColor, size: 150),
                  );
                } else if (state is ErrorState) {
                  return SizedBox(
                    height: 300,
                    width: 800,
                    child: ErrorReloadWidget(
                      errorText: 'Autorizacijos klaida\nPrisijunkite iš naujo',
                      onPressed: () {
                        context.read<TrashBloc>().add(
                              ReloadPage(),
                            );
                      },
                    ),
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
