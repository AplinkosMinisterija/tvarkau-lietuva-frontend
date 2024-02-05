import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:dashboard/src/adding_report/ui/web/confirmation_screen.dart';
import 'package:flutter/material.dart';
import '../../home/ui/data_security_information.dart';
import '../bloc/adding_bloc.dart';
import 'web/trash_adding_screen_web.dart';
import '../ui/mobile/adding_screen_mobile.dart';
import 'mobile/confirmation_screen_mobile.dart';

class AddingScreenTrash extends StatelessWidget {
  const AddingScreenTrash({
    Key? key,
  }) : super(key: key);

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
                    onAddTap: (email, text, lat, long, files) {
                      context.read<AddingBloc>().add(
                            AddReport(
                              emailValue: email,
                              textValue: text,
                              selectedLat: lat,
                              selectedLong: long,
                              imageFiles: files,
                              type: 'trash',
                            ),
                          );
                    },
                    onDataSecurityTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) =>
                              const DataSecurityInformation());
                    },
                  );
                } else {
                  return AddingScreenMobile(
                    width: width,
                    height: height,
                    reports: state.trashReports,
                    onAddTap: (email, text, lat, long, files) {
                      context.read<AddingBloc>().add(
                            AddReport(
                              emailValue: email,
                              textValue: text,
                              selectedLat: lat,
                              selectedLong: long,
                              imageFiles: files,
                              type: 'trash',
                            ),
                          );
                    },
                    onDataSecurityTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) =>
                              const DataSecurityInformation());
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
                  );
                } else {
                  return ConfirmationScreenMobile(
                    width: width,
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
