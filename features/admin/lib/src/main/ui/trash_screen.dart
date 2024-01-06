import 'package:admin/src/main/ui/dump_window.dart';
import 'package:admin/src/main/ui/trash_window.dart';
import 'package:admin/src/main/widgets/confirmation.dart';
import 'package:api_client/api_client.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../bloc/trash/trash_bloc.dart';

class TrashScreen extends StatefulWidget {
  final String refId;

  const TrashScreen({
    required this.refId,
    Key? key,
  }) : super(key: key);

  @override
  State<TrashScreen> createState() => _TrashScreenState();
}

class _TrashScreenState extends State<TrashScreen> {
  String getRefId(String query) {
    var trimmedQuery = query.replaceAll('TLP-A', '');
    var formattedQuery = trimmedQuery.substring(
        trimmedQuery.indexOf(RegExp(r'[1-9]')), trimmedQuery.length);
    return formattedQuery;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
          create: (BuildContext context) =>
              TrashBloc(refId: getRefId(widget.refId)),
          child: BlocBuilder<TrashBloc, TrashState>(
            builder: (BuildContext context, TrashState state) {
              return BlocBuilder<TrashBloc, TrashState>(
                builder: (BuildContext context, TrashState state) {
                  if (state is ContentState) {
                    return TrashWindow(
                      trash: state.trashReport,
                      onBackPress: () {
                        context.goNamed('admin');
                      },
                      onUpdate: (FullReportDto updatedReport) {},
                    );
                    // return DumpWindow(
                    //   dump: state.dumpReport,
                    //   onBackPress: () {
                    //     context.goNamed('admin');
                    //   },
                    //   onUpdate: (FullDumpDto updatedDump) {
                    //     context.read<DumpBloc>().add(
                    //           UpdateDump(
                    //             id: updatedDump.refId,
                    //             name: updatedDump.name,
                    //             moreInformation: updatedDump.moreInformation,
                    //             workingHours: updatedDump.workingHours,
                    //             phone: updatedDump.phone ?? '',
                    //             isVisible: updatedDump.isVisible,
                    //             longitude: updatedDump.longitude,
                    //             latitude: updatedDump.latitude,
                    //             address: updatedDump.address ?? '',
                    //           ),
                    //         );
                    //   },
                    // );
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
                        context.read<TrashBloc>().add(
                              ReloadPage(),
                            );
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
