import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../bloc/trashaaa_bloc.dart';

class TrashWindowaaa extends StatelessWidget {
  final double screenWidth;
  final String viewType;
  final ValueChanged<bool> isHovering;
  final String activeEmail;

  const TrashWindowaaa({
    required this.screenWidth,
    required this.viewType,
    required this.isHovering,
    required this.activeEmail,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => TrashBlocaaa(),
        child: BlocBuilder<TrashBlocaaa, TrashStateaaa>(
          builder: (BuildContext context, TrashStateaaa state) {
            return BlocBuilder<TrashBlocaaa, TrashStateaaa>(
              builder: (BuildContext context, TrashStateaaa state) {
                if (state is ContentState) {
                  return viewType == 'chart'
                      ? AdminReportsTable(
                          width: screenWidth,
                          reports: state.trashReports,
                          onUpdate: (updatedModel, officerFiles) {
                            Navigator.of(context).pop();
                            context.read<TrashBlocaaa>().add(
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
                            context.read<TrashBlocaaa>().add(
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
                        context.read<TrashBlocaaa>().add(
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
