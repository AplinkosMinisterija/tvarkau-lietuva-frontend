import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:dashboard/src/adding_report/ui/web/confirmation_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../bloc/adding_bloc.dart';
import 'web/trash_adding_screen_web.dart';
import '../ui/mobile/trash_adding_screen_mobile.dart';
import 'mobile/confirmation_screen_mobile.dart';

class AddingScreenTrash extends StatelessWidget {
  const AddingScreenTrash({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height;
    return BlocProvider(
      create: (BuildContext context) =>
          AddingBloc('trash')..add(LoadTrashData()),
      child: BlocBuilder<AddingBloc, AddingState>(
        builder: (BuildContext context, AddingState state) {
          return BlocBuilder<AddingBloc, AddingState>(
            builder: (BuildContext context, AddingState state) {
              if (state is TrashContentState) {
                if (width > 900) {
                  return TrashAddingScreenWeb(
                    width: width,
                    height: height,
                    reports: state.trashReports,
                    onAddTap: (email, text, lat, long, files, emailsEnabled) {
                      context.read<AddingBloc>().add(
                            AddReport(
                              emailValue: email,
                              textValue: text,
                              selectedLat: lat,
                              selectedLong: long,
                              images: files,
                              category: 'trash',
                              automaticEmailsEnabled: emailsEnabled,
                            ),
                          );
                    },
                  );
                } else {
                  return TrashAddingScreenMobile(
                    width: width,
                    height: height,
                    reports: state.trashReports,
                    onAddTap: (email, text, lat, long, files, emailsEnabled) {
                      context.read<AddingBloc>().add(
                            AddReport(
                              emailValue: email,
                              textValue: text,
                              selectedLat: lat,
                              selectedLong: long,
                              images: files,
                              category: 'trash',
                              automaticEmailsEnabled: emailsEnabled,
                            ),
                          );
                    },
                    onDataSecurityTap: () {},
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
                    category: 'trash',
                  );
                } else {
                  return ConfirmationScreenMobile(
                    width: width,
                    category: 'trash',
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
