import 'package:admin/src/bloc/main/admin_bloc.dart';
import 'package:admin/admin_window.dart';
import 'package:admin/src/widgets/login_widget.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => AdminBloc(),
        child: BlocBuilder<AdminBloc, AdminState>(
          builder: (BuildContext context, AdminState state) {
            return BlocBuilder<AdminBloc, AdminState>(
              builder: (BuildContext context, AdminState state) {
                switch (state) {
                  case LoadingState():
                    return LoaderWidget().loader();
                  case LogingState():
                    double width = MediaQuery.of(context).size.width;
                    return LoginWidget(
                        width: width,
                        onLogIn: () {
                          context.read<AdminBloc>().add(
                                LogIn(),
                              );
                        });
                  case ReportState():
                    return AdminWindow(
                        name: state.userInfo.name,
                        email: state.userInfo.email,
                        reports: state.reports,
                        dumps: null,
                        onLogout: () {
                          context.read<AdminBloc>().add(
                                LogOut(),
                              );
                        },
                        isShowDeleted: false,
                        onDeletedChange: () {
                          context.read<AdminBloc>().add(
                                OnViewDeleted(),
                              );
                        },
                        onTypeChange: () {
                          context.read<AdminBloc>().add(
                                OnViewDumps(),
                              );
                        },
                        isShowDumps: false);
                  case DumpState():
                    return AdminWindow(
                        name: state.userInfo.name,
                        email: state.userInfo.email,
                        reports: null,
                        dumps: state.dumps,
                        onLogout: () {
                          context.read<AdminBloc>().add(
                                LogOut(),
                              );
                        },
                        isShowDeleted: false,
                        onDeletedChange: () {},
                        onTypeChange: () {
                          context.read<AdminBloc>().add(
                                OnViewReports(),
                              );
                        },
                        isShowDumps: true);
                  case DeletedState():
                    return AdminWindow(
                        name: state.userInfo.name,
                        email: state.userInfo.email,
                        reports: state.reports,
                        dumps: null,
                        onLogout: () {
                          context.read<AdminBloc>().add(
                                LogOut(),
                              );
                        },
                        isShowDeleted: true,
                        onDeletedChange: () {
                          context.read<AdminBloc>().add(
                                OnViewReports(),
                              );
                        },
                        onTypeChange: () {},
                        isShowDumps: false);
                  case ErrorState():
                    return ErrorReloadWidget(
                      onPressed: () {
                        context.read<AdminBloc>().add(
                              ReloadPage(),
                            );
                      },
                      errorText: state.errorMessage,
                      descriptionText: state.errorDescription,
                    );
                }
                //   if (state is ContentState) {
                //     return AdminWindow(
                //       name: state.userInfo.name,
                //       email: state.userInfo.email,
                //       reports: state.reports,
                //       dumps: state.dumps,
                //       onLogout: () {
                //         context.read<AdminBloc>().add(
                //               LogOut(),
                //             );
                //       },
                //       isShowDeleted: false,
                //       onDeletedChange: (bool isShowDeleted) {},
                //       onTypeChange: (bool isShowReports) {},
                //       isShowDumps: false,
                //     );
                //   } else if (state is LogingState) {
                //     double width = MediaQuery.of(context).size.width;
                //     return LoginWidget(
                //         width: width,
                //         onLogIn: () {
                //           context.read<AdminBloc>().add(
                //                 LogIn(),
                //               );
                //         });
                //   } else if (state is LoadingState) {
                //     return LoaderWidget().loader();
                //   } else if (state is ErrorState) {
                //     return ErrorReloadWidget(
                //       onPressed: () {
                //         context.read<AdminBloc>().add(
                //               ReloadPage(),
                //             );
                //       },
                //     );
                //   } else {
                //     return Container(
                //       color: const Color.fromRGBO(57, 97, 84, 1),
                //     );
                //   }
              },
            );
          },
        ));
  }
}
