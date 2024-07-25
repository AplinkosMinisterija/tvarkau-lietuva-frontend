import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';

class ExplanationDialogWidget extends StatelessWidget {
  const ExplanationDialogWidget({
    super.key,
    required this.width,
    required this.category,
    required this.isMobile,
  });

  final double width;
  final String category;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return PointerInterceptor(
      child: Dialog(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? width * 0.021 : width * 0.011,
            vertical: isMobile ? width * 0.051 : width * 0.011,
          ),
          child: Material(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        Icons.close_sharp,
                        size: isMobile ? width * 0.0533 : width * 0.0156,
                      )),
                  AddingInformationHeader(
                    width: isMobile ? width : width / 3.4,
                    isBeetleCategory: category == 'beetle',
                    isPermitsCategory: category == 'permits',
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
