import 'package:admin/src/ui/trash_window.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:dio/dio.dart' as dio;
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
                      onUpdate: (String comment, String status, bool isVisible,
                          List<dio.MultipartFile> officerImages) {
                        context.read<TrashBloc>().add(UpdateReport(
                              id: state.trashReport.id,
                              refId: state.trashReport.refId,
                              name: state.trashReport.name,
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
                        context.read<TrashBloc>().add(UpdateReport(
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
                              officerImageFiles: [],
                            ));
                      },
                      onRestore: () {
                        context.read<TrashBloc>().add(UpdateReport(
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
                              officerImageFiles: [],
                            ));
                      },
                    );
                  } else if (state is LoadingState) {
                    return LoaderWidget().loader();
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
