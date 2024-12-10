import 'package:admin/src/bloc/main/admin_bloc.dart';
import 'package:admin/admin_window.dart';
import 'package:admin/src/widgets/login_widget.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({
    super.key,
  });

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
                        onLogIn: (tenant) {
                          context.read<AdminBloc>().add(
                                LogIn(tenant: tenant),
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
                      onDeletedChange: (String category) {
                        context.read<AdminBloc>().add(
                              OnViewDeleted(category: category),
                            );
                      },
                      isShowDumps: false,
                      onCategoryChange: (String category) {
                        if (category == 'dump') {
                          context.read<AdminBloc>().add(
                                OnViewDumps(),
                              );
                        } else {
                          context.read<AdminBloc>().add(
                                OnViewReports(category: category),
                              );
                        }
                      },
                      activeCategory: state.category,
                    );
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
                      onDeletedChange: (a) {},
                      onCategoryChange: (String category) {
                        if (category == 'dump') {
                          context.read<AdminBloc>().add(
                                OnViewDumps(),
                              );
                        } else {
                          context.read<AdminBloc>().add(
                                OnViewReports(category: category),
                              );
                        }
                      },
                      isShowDumps: true,
                      activeCategory: 'dump',
                    );
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
                      onDeletedChange: (String category) {
                        context.read<AdminBloc>().add(
                              OnViewReports(category: category),
                            );
                      },
                      onCategoryChange: (String category) {
                        if (category == 'dump') {
                          context.read<AdminBloc>().add(
                                OnViewDumps(),
                              );
                        } else {
                          context.read<AdminBloc>().add(
                                OnViewReports(category: category),
                              );
                        }
                      },
                      isShowDumps: false,
                      activeCategory: state.category,
                    );
                  case ErrorState():
                    return ErrorReloadWidget(
                      onPressed: () {
                        context.read<AdminBloc>().add(
                              ReloadPage(),
                            );
                      },
                      onErrorReport: () {
                        context.goNamed('error_report');
                      },
                      errorText: state.errorMessage,
                      descriptionText: state.errorDescription,
                    );
                }
              },
            );
          },
        ));
  }
}
