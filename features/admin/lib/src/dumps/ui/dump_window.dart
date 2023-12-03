import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../bloc/dump_bloc.dart';

class DumpWindow extends StatelessWidget {
  final double screenWidth;

  const DumpWindow({
    required this.screenWidth,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => DumpBloc(),
        child: BlocBuilder<DumpBloc, DumpState>(
          builder: (BuildContext context, DumpState state) {
            return BlocBuilder<DumpBloc, DumpState>(
              builder: (BuildContext context, DumpState state) {
                if (state is ContentState) {
                  return AdminDumpsTable(
                    width: screenWidth,
                    dumps: state.dumpReports,
                    onUpdate: (updatedModel) {
                      Navigator.of(context).pop();
                      context.read<DumpBloc>().add(UpdateDump(
                            id: updatedModel.id,
                            name: updatedModel.name,
                            moreInformation: updatedModel.moreInformation ?? '',
                            workingHours: updatedModel.workingHours ?? '',
                            phone: updatedModel.phone ?? '',
                            isVisible:
                                updatedModel.isVisible! ? "true" : "false",
                          ));
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
                      context.read<DumpBloc>().add(
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
