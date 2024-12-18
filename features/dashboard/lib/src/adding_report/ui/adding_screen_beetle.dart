import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:dashboard/src/adding_report/ui/beetle_information_screen.dart';
import 'package:dashboard/src/adding_report/ui/web/beetle_adding_screen_web.dart';
import 'package:dashboard/src/adding_report/ui/web/confirmation_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../bloc/adding_bloc.dart';
import 'mobile/beetle_adding_screen_mobile.dart';
import 'mobile/confirmation_screen_mobile.dart';

class AddingScreenBeetle extends StatelessWidget {
  const AddingScreenBeetle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height;
    return BlocProvider(
      create: (BuildContext context) =>
          AddingBloc('beetle')..add(LoadBeetleInformation()),
      child: BlocBuilder<AddingBloc, AddingState>(
        builder: (BuildContext context, AddingState state) {
          return BlocBuilder<AddingBloc, AddingState>(
            builder: (BuildContext context, AddingState state) {
              if (state is BeetleInformationState) {
                return BeetleInformationScreen(
                  onContinue: () {
                    context.read<AddingBloc>().add(LoadBeetleData());
                  },
                );
              } else if (state is BeetleContentState) {
                if (width > 900) {
                  return BeetleAddingScreenWeb(
                    width: width,
                    height: height,
                    onAddTap: (email, text, lat, long, files) {
                      context.read<AddingBloc>().add(
                            AddReport(
                              emailValue: email,
                              textValue: text,
                              selectedLat: lat,
                              selectedLong: long,
                              images: files,
                              category: 'beetle',
                              automaticEmailsEnabled: false,
                            ),
                          );
                    },
                    onDataSecurityTap: () {},
                  );
                } else {
                  return BeetleAddingScreenMobile(
                    width: width,
                    height: height,
                    onAddTap: (email, text, lat, long, files) {
                      context.read<AddingBloc>().add(
                            AddReport(
                              emailValue: email,
                              textValue: text,
                              selectedLat: lat,
                              selectedLong: long,
                              images: files,
                              category: 'beetle',
                              automaticEmailsEnabled: false,
                            ),
                          );
                    },
                  );
                }
              } else if (state is LoadingState) {
                return Dialog.fullscreen(
                  backgroundColor: const Color.fromRGBO(250, 242, 234, 1),
                  child: LoaderWidget().loader(),
                );
              } else if (state is ConfirmationState) {
                if (width > 900) {
                  return ConfirmationDialog(
                    width: width,
                    category: 'beetle',
                  );
                } else {
                  return ConfirmationScreenMobile(
                    width: width,
                    category: 'beetle',
                  );
                }
              } else if (state is ErrorState) {
                return ErrorReloadWidget(
                  errorText: state.errorMessage,
                  onPressed: () {
                    context.read<AddingBloc>().add(
                          ReloadPage(),
                        );
                  },
                  onErrorReport: () {
                    context.goNamed('error_report');
                  },
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          );
        },
      ),
    );
  }
}
