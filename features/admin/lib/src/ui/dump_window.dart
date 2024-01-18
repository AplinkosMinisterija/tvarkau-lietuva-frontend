import 'package:core/utils/extensions.dart';
import 'package:api_client/api_client.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import '../common/custom_colors.dart';
import '../common/custom_styles.dart';
import '../widgets/base_admin_screen.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_switch.dart';
import '../widgets/custom_text_button.dart';
import 'package:latlong2/latlong.dart';

class DumpWindow extends StatefulWidget {
  final FullDumpDto dump;
  final VoidCallback onBackPress;
  final Function(FullDumpDto) onUpdate;

  const DumpWindow({
    required this.dump,
    required this.onBackPress,
    required this.onUpdate,
    Key? key,
  }) : super(key: key);

  @override
  State<DumpWindow> createState() => _DumpWindowState();
}

class _DumpWindowState extends State<DumpWindow> {
  String id = '1';
  String name = '';
  String moreInformation = '';
  String workingHours = '';
  String phone = '';
  bool isVisible = false;
  double longitude = 0;
  double latitude = 0;
  String address = '';

  @override
  void initState() {
    id = widget.dump.refId;
    name = widget.dump.name;
    moreInformation = widget.dump.moreInformation;
    workingHours = widget.dump.workingHours;
    phone = widget.dump.phone ?? '';
    isVisible = widget.dump.isVisible;
    longitude = widget.dump.longitude;
    latitude = widget.dump.latitude;
    address = widget.dump.address ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        const minHeight = 300;
        final height = constraints.maxHeight * .6 > minHeight
            ? constraints.maxHeight * .6
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
                      Text(widget.dump.name, style: CustomStyles.h2),
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
                        '${isVisible ? '' : 'Ne'}${isVisible ? "R" : "r"}odomas žemėlapyje',
                        style: CustomStyles.body2.copyWith(
                          color: CustomColors.white,
                        ),
                      ),
                    ],
                  ),
                  48.heightBox,
                  Builder(builder: (context) {
                    final width = MediaQuery.of(context).size.width;
                    if (width < 1000) {
                      return _buildMobileLayout(
                        widget.dump,
                        height.toDouble(),
                      );
                    } else {
                      return _buildDesktopLayout(
                        widget.dump,
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

  Widget _buildForm(bool isMobile) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: CustomColors.grey,
      ),
      constraints: BoxConstraints(maxWidth: isMobile ? double.infinity : 480),
      child: Column(
        children: [
          _BuildInput(
            label: 'Aikštelės pavadinimas',
            onChanged: (value) {
              setState(() {
                name = value;
              });
            },
            value: name,
          ),
          16.heightBox,
          Row(
            children: [
              Expanded(
                  child: _BuildInput(
                label: 'Ilguma',
                value: longitude.toString(),
                onChanged: (value) {
                  setState(() {
                    longitude = double.parse(value);
                  });
                },
              )),
              16.widthBox,
              Expanded(
                  child: _BuildInput(
                label: 'Platuma',
                value: latitude.toString(),
                onChanged: (value) {
                  setState(() {
                    latitude = double.parse(value);
                  });
                },
              )),
            ],
          ),
          16.heightBox,
          _BuildInput(
            label: 'Aikštelės informacija',
            value: moreInformation,
            onChanged: (value) {
              setState(() {
                moreInformation = value;
              });
            },
          ),
          16.heightBox,
          _BuildInput(
            label: 'Telefono numeris',
            value: phone,
            onChanged: (value) {
              setState(() {
                phone = value;
              });
            },
          ),
          16.heightBox,
          _BuildInput(
            label: 'Darbo valandos',
            maxLines: 5,
            value: workingHours,
            onChanged: (value) {
              setState(() {
                workingHours = value;
              });
            },
          ),
          40.heightBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomButton(
                text: 'Atšaukti',
                buttonType: ButtonType.outlined,
                onPressed: widget.onBackPress,
              ),
              16.widthBox,
              CustomButton(
                text: 'Išsaugoti',
                onPressed: () {
                  widget.onUpdate(FullDumpDto((builder) => {
                        builder.refId = id,
                        builder.name = name,
                        builder.moreInformation = moreInformation,
                        builder.workingHours = workingHours,
                        builder.phone = phone,
                        builder.isVisible = isVisible,
                        builder.latitude = latitude,
                        builder.longitude = longitude,
                        builder.address = address,
                        builder.type = 'dump',
                      }));
                },
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildDesktopLayout(FullDumpDto dump, double height) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: _DumpMap(
            height: height.toDouble(),
            dump: dump,
          ),
        ),
        40.widthBox,
        _buildForm(false),
      ],
    );
  }

  Widget _buildMobileLayout(FullDumpDto dump, double height) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _DumpMap(
              height: height.toDouble(),
              dump: widget.dump,
            ),
            32.heightBox,
          ],
        ),
        24.heightBox,
        _buildForm(
          true,
        ),
        24.heightBox,
      ],
    );
  }
}

class _DumpMap extends StatelessWidget {
  const _DumpMap({
    required this.height,
    required this.dump,
  });

  final double height;
  final FullDumpDto dump;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height.toDouble(),
      child: AppMap(
        initialZoom: 9,
        initialCenter: LatLng(dump.latitude, dump.longitude),
        layers: [
          FullDumpsLayer(dumps: [dump]),
        ],
      ),
    );
  }
}

class _BuildInput extends StatelessWidget {
  const _BuildInput({
    required this.label,
    this.maxLines = 1,
    required this.value,
    required this.onChanged,
  });

  final String label;
  final int maxLines;
  final String value;
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: CustomStyles.body2,
        ),
        4.heightBox,
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: TextFormField(
            initialValue: value,
            onChanged: (val) {
              onChanged(val);
            },
            decoration: InputDecoration(
                hoverColor: CustomColors.primary.withOpacity(0.05),
                fillColor: CustomColors.white,
                filled: true,
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: maxLines > 1 ? 16 : 0,
                )),
            style: CustomStyles.body2,
            maxLines: maxLines,
          ),
        ),
      ],
    );
  }
}
