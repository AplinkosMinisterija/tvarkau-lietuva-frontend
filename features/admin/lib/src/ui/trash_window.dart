import 'dart:typed_data';

import 'package:core/utils/extensions.dart';
import 'package:api_client/api_client.dart';
import 'package:core/utils/image_display/image_display.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../common/custom_colors.dart';
import '../common/custom_styles.dart';
import '../widgets/base_admin_screen.dart';
import '../widgets/base_dump_info.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_switch.dart';
import '../widgets/custom_text_button.dart';
import '../widgets/dump_tabs.dart';

class TrashWindow extends StatefulWidget {
  final FullReportDto trash;
  final VoidCallback onBackPress;
  final Function(String name, String comment, String status, bool isVisible,
      List<Uint8List> officerImages) onUpdate;
  final VoidCallback onDelete;
  final VoidCallback onRestore;

  const TrashWindow({
    required this.trash,
    required this.onBackPress,
    required this.onUpdate,
    required this.onDelete,
    required this.onRestore,
    super.key,
  });

  @override
  State<TrashWindow> createState() => _TrashWindowState();
}

class _TrashWindowState extends State<TrashWindow> {
  bool isVisible = false;
  String comment = '';
  String status = '';
  String name = '';
  List<Uint8List> officerImages = [];
  int statusIndex = 0;

  Set<Marker> markers = {};

  Future<void> setupMarker() async {
    final marker = Marker(
        markerId: MarkerId(widget.trash.refId),
        position: LatLng(
          widget.trash.latitude,
          widget.trash.longitude,
        ),
        icon: await BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(size: Size(50, 50)),
            'assets/svg/pin_icon.svg'));
    setState(() {
      markers.add(marker);
    });
  }

  @override
  void initState() {
    isVisible = widget.trash.isVisible;
    status = widget.trash.status;
    comment = widget.trash.comment;
    name = widget.trash.name;
    setInitStatusIndex(status);
    setupMarker();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        const minHeight = 250;
        final height = constraints.maxHeight * .25 > minHeight
            ? constraints.maxHeight * .25
            : minHeight;
        return BaseAdminScreen(
          child: Center(
            child: Container(
              constraints: const BoxConstraints(
                maxWidth: 1300,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: [
                  42.heightBox,
                  Align(
                    alignment: Alignment.centerLeft,
                    child: CustomTextButton(
                      onPressed: widget.onBackPress,
                      text: 'Grįžti atgal',
                      icon: Icons.arrow_back,
                    ),
                  ),
                  17.heightBox,
                  Row(
                    children: [
                      Text(
                          'TLP-A${'0' * (8 - widget.trash.refId.length)}${widget.trash.refId}',
                          style: CustomStyles.h2),
                      16.widthBox,
                      CustomSwitch(
                        value: isVisible,
                        onChanged: (value) {
                          setState(() {
                            isVisible = !isVisible;
                          });
                        },
                      ),
                      8.widthBox,
                      Text(
                        'Pranešimas ${isVisible ? '' : 'ne'}rodomas',
                        style: CustomStyles.body2.copyWith(
                          color: CustomColors.white,
                        ),
                      ),
                    ],
                  ),
                  48.heightBox,
                  Builder(builder: (context) {
                    final width = MediaQuery.of(context).size.width;
                    if (width < 900) {
                      return _buildMobileLayout(
                        widget.trash,
                        markers,
                        height.toDouble(),
                      );
                    } else {
                      return _buildDesktopLayout(
                        widget.trash,
                        markers,
                        height.toDouble(),
                      );
                    }
                  })
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildDesktopLayout(
      FullReportDto trash, Set<Marker> markers, double height) {
    final List<String> imageUrls = [];
    final List<String> officerImageUrls = [];
    if (trash.imageUrls.isNotEmpty) {
      for (var element in trash.imageUrls) {
        if (element.endsWith('.heic') || element.endsWith('.heif')) {
          var convertedString = element.substring(0, element.length - 5);
          imageUrls.add('$convertedString.jpg');
        } else {
          imageUrls.add(element);
        }
      }
    }
    if (trash.officerImageUrls.isNotEmpty) {
      for (var element in trash.officerImageUrls) {
        if (element.endsWith('.heic') || element.endsWith('.heif')) {
          var convertedString = element.substring(0, element.length - 5);
          officerImageUrls.add('$convertedString.jpg');
        } else {
          officerImageUrls.add(element);
        }
      }
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BaseTrashInfo(
                trash: trash,
              ),
              16.heightBox,
              _BuildMap(
                height: height.toDouble(),
                markers: markers,
                initialTarget: LatLng(
                  trash.latitude,
                  trash.longitude,
                ),
              ),
              16.heightBox,
              TextFormField(
                initialValue: name,
                onChanged: (String value) {
                  setState(() {
                    name = value;
                  });
                },
                style: CustomStyles.body1,
                decoration: InputDecoration(
                  hoverColor: CustomColors.primary.withOpacity(0.05),
                  fillColor: CustomColors.white,
                  filled: true,
                  border: InputBorder.none,
                ),
                maxLines: 5,
              ),
              if (trash.imageUrls.isNotEmpty) ...[
                15.heightBox,
                AppImageDisplay().buildImages(
                  imageUrls: imageUrls,
                  context: context,
                  width: 700,
                ),
              ],
              24.heightBox,
              const Divider(
                height: 1,
                color: Colors.grey,
              ),
              10.heightBox,
              if (trash.comment != ' ' && trash.comment != '') ...[
                Text(
                  'AAD atsakymas ir inspektorių nuotraukos',
                  style: CustomStyles.h2
                      .copyWith(color: Colors.black, fontSize: 20),
                ),
                10.heightBox,
                Text(
                  trash.comment,
                  style: CustomStyles.body1,
                ),
                10.heightBox,
                trash.officerImageUrls.isNotEmpty
                    ? AppImageDisplay().buildImages(
                        imageUrls: officerImageUrls,
                        context: context,
                        width: 700,
                      )
                    : 10.heightBox,
                10.heightBox,
              ],
              !trash.isDeleted
                  ? CustomButton(
                      text: 'Trinti pranešimą',
                      buttonType: ButtonType.outlined,
                      color: CustomColors.red,
                      onPressed: () {
                        widget.onDelete();
                      })
                  : CustomButton(
                      text: 'Atkurti pranešimą',
                      buttonType: ButtonType.outlined,
                      color: CustomColors.blue,
                      onPressed: () {
                        widget.onRestore();
                      }),
            ],
          ),
        ),
        40.widthBox,
        TrashTabs(
          trash: trash,
          onStatusChange: (int value) {
            setState(() {
              statusIndex = value;
              setStatusIndex(value);
            });
          },
          statusValue: statusIndex,
          onAnswerChange: (String value) {
            setState(() {
              comment = value;
            });
          },
          answerValue: comment,
          onImageUpload: (uploadedOfficerImages) {
            setState(() {
              officerImages = uploadedOfficerImages;
            });
          },
          onBackPress: () {
            widget.onBackPress();
          },
          onSave: () {
            widget.onUpdate(name, comment, status, isVisible, officerImages);
          },
        ),
      ],
    );
  }

  void setInitStatusIndex(String status) {
    if (status == 'gautas') {
      statusIndex = 0;
    } else if (status == 'tiriamas') {
      statusIndex = 1;
    } else if (status == 'išspręsta') {
      statusIndex = 2;
    } else if (status == 'nepasitvirtino') {
      statusIndex = 3;
    }
  }

  void setStatusIndex(int index) {
    if (index == 0) {
      status = 'gautas';
    } else if (index == 1) {
      status = 'tiriamas';
    } else if (index == 2) {
      status = 'išspręsta';
    } else if (index == 3) {
      status = 'nepasitvirtino';
    }
  }

  Widget _buildMobileLayout(
      FullReportDto trash, Set<Marker> markers, double height) {
    final List<String> imageUrls = [];
    final List<String> officerImageUrls = [];
    if (trash.imageUrls.isNotEmpty) {
      for (var element in trash.imageUrls) {
        if (element.endsWith('.heic') || element.endsWith('.heif')) {
          var convertedString = element.substring(0, element.length - 5);
          imageUrls.add('$convertedString.jpg');
        } else {
          imageUrls.add(element);
        }
      }
    }
    if (trash.officerImageUrls.isNotEmpty) {
      for (var element in trash.officerImageUrls) {
        if (element.endsWith('.heic') || element.endsWith('.heif')) {
          var convertedString = element.substring(0, element.length - 5);
          officerImageUrls.add('$convertedString.jpg');
        } else {
          officerImageUrls.add(element);
        }
      }
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BaseTrashInfo(
              trash: trash,
            ),
            16.heightBox,
            _BuildMap(
              height: height.toDouble(),
              markers: markers,
              initialTarget: LatLng(
                trash.latitude,
                trash.longitude,
              ),
            ),
            32.heightBox,
            TextFormField(
              initialValue: name,
              onChanged: (String value) {
                setState(() {
                  name = value;
                });
              },
              style: CustomStyles.body1,
              decoration: InputDecoration(
                hoverColor: CustomColors.primary.withOpacity(0.05),
                fillColor: CustomColors.white,
                filled: true,
                border: InputBorder.none,
              ),
              maxLines: 5,
            ),
            if (trash.imageUrls.isNotEmpty) ...[
              15.heightBox,
              AppImageDisplay().buildImages(
                imageUrls: imageUrls,
                context: context,
                width: 700,
              ),
            ],
            15.heightBox,
            const Divider(
              height: 1,
              color: Colors.grey,
            ),
            10.heightBox,
            if (trash.comment != ' ' && trash.comment != '') ...[
              Text(
                'AAD atsakymas ir inspektorių nuotraukos',
                style:
                    CustomStyles.h2.copyWith(color: Colors.black, fontSize: 20),
              ),
              10.heightBox,
              Text(
                trash.comment,
                style: CustomStyles.body1,
              ),
              10.heightBox,
              trash.officerImageUrls.isNotEmpty
                  ? AppImageDisplay().buildImages(
                      imageUrls: officerImageUrls,
                      context: context,
                      width: 700,
                    )
                  : 10.heightBox,
              10.heightBox,
            ],
          ],
        ),
        40.heightBox,
        TrashTabs(
          trash: trash,
          onStatusChange: (int value) {
            setState(() {
              statusIndex = value;
              setStatusIndex(value);
            });
          },
          statusValue: statusIndex,
          onAnswerChange: (String value) {
            setState(() {
              comment = value;
            });
          },
          answerValue: comment,
          onImageUpload: (officerImages) {
            setState(() {
              officerImages = officerImages;
            });
          },
          onBackPress: () {
            widget.onBackPress();
          },
          onSave: () {
            widget.onUpdate(name, comment, status, isVisible, officerImages);
          },
        ),
        24.heightBox,
        !trash.isDeleted
            ? CustomButton(
                text: 'Trinti pranešimą',
                buttonType: ButtonType.outlined,
                color: CustomColors.red,
                onPressed: () {
                  widget.onDelete();
                })
            : CustomButton(
                text: 'Atkurti pranešimą',
                buttonType: ButtonType.outlined,
                color: CustomColors.blue,
                onPressed: () {
                  widget.onRestore();
                }),
      ],
    );
  }
}

class _BuildMap extends StatelessWidget {
  const _BuildMap({
    required this.height,
    required this.markers,
    required this.initialTarget,
  });

  final double height;
  final Set<Marker> markers;
  final LatLng initialTarget;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height.toDouble(),
      child: GoogleMap(
        mapType: MapType.none,
        markers: markers,
        initialCameraPosition: CameraPosition(
          target: initialTarget,
          zoom: 13,
        ),
      ),
    );
  }
}
