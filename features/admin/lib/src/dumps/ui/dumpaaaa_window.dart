import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../bloc/dump_blocaaaa.dart';

class DumpWindowaaaaa extends StatelessWidget {
  final double screenWidth;

  const DumpWindowaaaaa({
    required this.screenWidth,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => DumpBlocaaa(),
        child: BlocBuilder<DumpBlocaaa, DumpStateaaa>(
          builder: (BuildContext context, DumpStateaaa state) {
            return BlocBuilder<DumpBlocaaa, DumpStateaaa>(
              builder: (BuildContext context, DumpStateaaa state) {
                if (state is ContentState) {
                  return AdminDumpsTable(
                    width: screenWidth,
                    dumps: state.dumpReports,
                    onUpdate: (updatedModel) {
                      Navigator.of(context).pop();
                      context.read<DumpBlocaaa>().add(UpdateDump(
                            id: updatedModel.id,
                            name: updatedModel.name,
                            moreInformation: updatedModel.moreInformation ?? '',
                            workingHours: updatedModel.workingHours ?? '',
                            phone: updatedModel.phone ?? '',
                            isVisible:
                                updatedModel.isVisible! ? "true" : "false",
                            longitude: updatedModel.reportLong,
                        latitude: updatedModel.reportLat,
                        address: updatedModel.address ?? '',
                          ));
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
                      onPressed: () {
                        context.read<DumpBlocaaa>().add(
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
