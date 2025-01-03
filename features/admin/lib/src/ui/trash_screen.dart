import 'dart:typed_data';

import 'package:admin/src/ui/trash_window.dart';
import 'package:api_client/api_client.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../bloc/report/report_bloc.dart';

class TrashScreen extends StatefulWidget {
  final String refId;

  const TrashScreen({
    required this.refId,
    super.key,
  });

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
              ReportBloc(refId: getRefId(widget.refId)),
          child: BlocBuilder<ReportBloc, ReportState>(
            builder: (BuildContext context, ReportState state) {
              return BlocBuilder<ReportBloc, ReportState>(
                builder: (BuildContext context, ReportState state) {
                  if (state is ContentState) {
                    return TrashWindow(
                      trash: state.trashReport,
                      onBackPress: () {
                        context.goNamed('admin');
                      },
                      onUpdate: (String name, String comment, String status, String category,
                          bool isVisible, List<Uint8List> officerImages) {
                        context.read<ReportBloc>().add(UpdateReport(
                              id: state.trashReport.id,
                              refId: state.trashReport.refId,
                              name: name,
                              category: category,
                              reportLong: state.trashReport.longitude,
                              reportLat: state.trashReport.latitude,
                              status: status,
                              comment: comment,
                              isVisible: isVisible,
                              isDeleted: state.trashReport.isDeleted,
                              imageUrls: state.trashReport.imageUrls.toList(),
                              officerImageUrls:
                                  state.trashReport.officerImageUrls.toList(),
                              officerImageFiles: officerImages,
                            ));
                      },
                      onDelete: () {
                        context.read<ReportBloc>().add(UpdateReport(
                              id: state.trashReport.id,
                              refId: state.trashReport.refId,
                              name: state.trashReport.name,
                              reportLong: state.trashReport.longitude,
                              reportLat: state.trashReport.latitude,
                              status: state.trashReport.status,
                              comment: state.trashReport.comment,
                              isVisible: state.trashReport.isVisible,
                              isDeleted: true,
                              imageUrls: state.trashReport.imageUrls.toList(),
                              officerImageUrls:
                                  state.trashReport.officerImageUrls.toList(),
                              officerImageFiles: [], category: state.trashReport.category.name,
                            ));
                      },
                      onRestore: () {
                        context.read<ReportBloc>().add(UpdateReport(
                              id: state.trashReport.id,
                              refId: state.trashReport.refId,
                              name: state.trashReport.name,
                              reportLong: state.trashReport.longitude,
                              reportLat: state.trashReport.latitude,
                              status: state.trashReport.status,
                              comment: state.trashReport.comment,
                              isVisible: state.trashReport.isVisible,
                              isDeleted: false,
                              imageUrls: state.trashReport.imageUrls.toList(),
                              officerImageUrls:
                                  state.trashReport.officerImageUrls.toList(),
                              officerImageFiles: [], category: state.trashReport.category.name,
                            ));
                      },
                      onTransfer: (String refId,
                          String name,
                          double longitude,
                          double latitude,
                          String status,
                          DateTime reportDate,
                          String email) {
                        context.read<ReportBloc>().add(TransferReport(
                            refId: refId,
                            name: name,
                            longitude: longitude,
                            latitude: latitude,
                            status: status,
                            reportDate: reportDate,
                            email: email));
                      },
                      permits: state.trashReport.category ==
                              FullReportDtoCategoryEnum.permits
                          ? state.permits
                          : null,
                    );
                  } else if (state is LoadingState) {
                    return LoaderWidget().loader();
                  } else if (state is ErrorState) {
                    return ErrorReloadWidget(
                      onPressed: () {
                        context.read<ReportBloc>().add(
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
