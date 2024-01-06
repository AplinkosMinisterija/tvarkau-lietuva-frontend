import 'package:admin/src/main/ui/dump_window.dart';
import 'package:admin/src/main/widgets/confirmation.dart';
import 'package:api_client/api_client.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../bloc/dump/dump_bloc.dart';

class UpdatedDumpScreen extends StatefulWidget {
  final String refId;

  const UpdatedDumpScreen({
    required this.refId,
    Key? key,
  }) : super(key: key);

  @override
  State<UpdatedDumpScreen> createState() => _UpdatedDumpScreenState();
}

class _UpdatedDumpScreenState extends State<UpdatedDumpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
          create: (BuildContext context) => DumpBloc(refId: widget.refId),
          child: BlocBuilder<DumpBloc, DumpState>(
            builder: (BuildContext context, DumpState state) {
              return BlocBuilder<DumpBloc, DumpState>(
                builder: (BuildContext context, DumpState state) {
                  if (state is ContentState) {
                    return DumpWindow(
                      dump: state.dumpReport,
                      onBackPress: () {
                        context.goNamed('admin');
                      },
                      onUpdate: (FullDumpDto updatedDump) {
                        context.read<DumpBloc>().add(
                              UpdateDump(
                                id: updatedDump.refId,
                                name: updatedDump.name,
                                moreInformation: updatedDump.moreInformation,
                                workingHours: updatedDump.workingHours,
                                phone: updatedDump.phone ?? '',
                                isVisible: updatedDump.isVisible,
                                longitude: updatedDump.longitude,
                                latitude: updatedDump.latitude,
                                address: updatedDump.address ?? '',
                              ),
                            );
                      },
                    );
                  } else if (state is LoadingState) {
                    return Container(
                      color: const Color.fromRGBO(57, 97, 84, 1),
                      child: Center(
                        child: LoadingAnimationWidget.staggeredDotsWave(
                            color: AppTheme.accentDividerColor, size: 150),
                      ),
                    );
                  } else if (state is ErrorState) {
                    return ErrorReloadWidget(
                      onPressed: () {
                        context.read<DumpBloc>().add(
                              ReloadPage(),
                            );
                      },
                    );
                  } else if (state is DoneState) {
                    return Confirmation(onContinue: () {
                      context.pop();
                      context.goNamed('admin');
                    });
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
