import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:dashboard/src/home/bloc/home_bloc.dart';
import 'package:dashboard/src/home/ui/map_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({
    required this.isMapHover,
    required this.width,
    required this.isMobile,
    super.key,
  });

  final Function(bool) isMapHover;
  final double width;
  final bool isMobile;

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => HomeBloc()..add(LoadData()),
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (BuildContext context, HomeState state) {
            return BlocBuilder<HomeBloc, HomeState>(
              builder: (BuildContext context, HomeState state) {
                switch (state) {
                  case LoadingState():
                    return LoaderWidget().mapLoader(
                      widget.width,
                      widget.isMobile,
                    );
                  case TrashState():
                    return MapWidget(
                      width: widget.width,
                      isHovering: (isHover) {
                        widget.isMapHover(isHover);
                      },
                      reports: state.reports,
                      reportStatistics: state.reportStatistics,
                      onCategoryChange: (category) {
                        context
                            .read<HomeBloc>()
                            .add(ChangeCategory(category: category));
                      },
                      category: 'trash',
                      onInformationTap: (String refId) {
                        int strLength = 8 - refId.length;
                        String str = '0' * strLength;
                        context.goNamed('report', queryParameters: {
                          'id': 'TLP-A$str${refId.toUpperCase()}'
                        });
                      },
                      isMobile: widget.isMobile,
                      cameraPosition: state.cameraPosition,
                    );
                  case DumpsState():
                    return MapWidget(
                      width: widget.width,
                      isHovering: (isHover) {
                        widget.isMapHover(isHover);
                      },
                      onCategoryChange: (category) {
                        context
                            .read<HomeBloc>()
                            .add(ChangeCategory(category: category));
                      },
                      dumps: state.dumpReports,
                      category: 'dumps',
                      isMobile: widget.isMobile,
                      cameraPosition: state.cameraPosition,
                    );
                  case ForestState():
                    return MapWidget(
                      width: widget.width,
                      isHovering: (isHover) {
                        widget.isMapHover(isHover);
                      },
                      reports: state.reports,
                      reportStatistics: state.reportStatistics,
                      onCategoryChange: (category) {
                        context
                            .read<HomeBloc>()
                            .add(ChangeCategory(category: category));
                      },
                      category: 'forest',
                      onInformationTap: (String refId) {
                        int strLength = 8 - refId.length;
                        String str = '0' * strLength;
                        context.goNamed('report', queryParameters: {
                          'id': 'TLP-A$str${refId.toUpperCase()}'
                        });
                      },
                      isMobile: widget.isMobile,
                      cameraPosition: state.cameraPosition,
                    );
                  case PermitsState():
                    return MapWidget(
                      width: widget.width,
                      isHovering: (isHover) {
                        widget.isMapHover(isHover);
                      },
                      reports: state.reports,
                      reportStatistics: state.reportStatistics,
                      onCategoryChange: (category) {
                        context
                            .read<HomeBloc>()
                            .add(ChangeCategory(category: category));
                      },
                      category: 'permits',
                      onInformationTap: (String refId) {
                        int strLength = 8 - refId.length;
                        String str = '0' * strLength;
                        context.goNamed('report', queryParameters: {
                          'id': 'TLP-A$str${refId.toUpperCase()}'
                        });
                      },
                      isMobile: widget.isMobile,
                      cameraPosition: state.cameraPosition,
                    );
                  case ErrorState():
                    return SizedBox(
                      height: widget.isMobile
                          ? widget.width * 0.9
                          : widget.width * 0.4765,
                      width: widget.width * 0.84375,
                      child: ErrorReloadWidget(
                        onPressed: () {
                          context.read<HomeBloc>().add(
                                ReloadPage(),
                              );
                        },
                        onErrorReport: () {
                          context.goNamed('error_report');
                        },
                        errorText: state.errorMessage,
                      ),
                    );
                }
                return const SizedBox.shrink();
              },
            );
          },
        ));
  }
}
