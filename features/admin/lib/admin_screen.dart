import 'package:admin/src/bloc/main/admin_bloc.dart';
import 'package:admin/admin_window.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

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
                if (state is ContentState) {
                  return AdminWindow(
                    name: state.userInfo.name,
                    email: state.userInfo.email,
                    reports: state.reports,
                    dumps: state.dumps,
                    onLogout: () {
                      context.read<AdminBloc>().add(
                            LogOut(),
                          );
                    },
                  );
                } else if (state is LogingState) {
                  double width = MediaQuery.of(context).size.width;
                  return Scaffold(
                    body: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Container(
                          width: width,
                          height: width / 2,
                          color: const Color.fromRGBO(57, 97, 84, 1),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: width / 8,
                            ),
                            DepartmentLogoMobile(
                              width: width,
                              onTap: () {},
                            ),
                            SizedBox(
                              height: width / 8,
                            ),
                            InkWell(
                              onTap: () {
                                context.read<AdminBloc>().add(
                                      LogIn(),
                                    );
                              },
                              onHover: (hover) {},
                              hoverColor: Colors.blue,
                              child: Container(
                                height: width * 0.05,
                                width: width * 0.25,
                                padding: EdgeInsets.symmetric(
                                    horizontal: width * 0.02,
                                    vertical: width * 0.005),
                                decoration: BoxDecoration(
                                    color: const Color.fromRGBO(1, 117, 0, 1.0),
                                    borderRadius: BorderRadius.circular(45),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.white.withOpacity(0.1),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: const Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ]),
                                child: FittedBox(
                                  fit: BoxFit.fitWidth,
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        'assets/icons/microsoft_logo.png',
                                        height: width * 0.02,
                                        width: width * 0.02,
                                      ),
                                      SizedBox(width: width * 0.01),
                                      Text(
                                        'Prisijungti per AAD',
                                        style: GoogleFonts.poppins(
                                            fontSize: 20, color: Colors.white),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
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
                      context.read<AdminBloc>().add(
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
        ));
  }
}
