import 'package:collection/collection.dart';
import 'package:domain/report/report_library.dart';
import 'package:flutter/material.dart';

import '../common/custom_colors.dart';
import '../common/custom_styles.dart';
import '../common/extensions.dart';

class HistoricDataTab extends StatefulWidget {
  const HistoricDataTab({
    super.key,
    required this.historicData,
    required this.statusRecords,
  });

  final List<HistoryData> historicData;
  final List<StatusRecords> statusRecords;

  @override
  State<HistoricDataTab> createState() => _HistoricDataTabState();
}

class _HistoricDataTabState extends State<HistoricDataTab>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  int _tabIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this)
      ..addListener(() {
        setState(() {
          _tabIndex = _tabController.index;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 550,
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(8),
        ),
        color: CustomColors.grey,
      ),
      child: Column(
        children: [
          _BuildTab(
            controller: _tabController,
          ),
          32.heightBox,
          if (_tabIndex == 0)
            Expanded(child: _BuildHistoricData(widget.historicData))
          else
            Expanded(child: _BuildStatusRecords(widget.statusRecords))
        ],
      ),
    );
  }
}

class _BuildTab extends StatelessWidget {
  const _BuildTab({
    required this.controller,
  });

  final TabController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: CustomColors.white,
      ),
      child: LayoutBuilder(builder: (context, constraints) {
        final maxWidth = constraints.maxWidth;
        return TabBar(
          dividerColor: Colors.transparent,
          controller: controller,
          unselectedLabelColor: CustomColors.black,
          labelStyle: CustomStyles.body2,
          labelPadding: EdgeInsets.zero,
          onTap: (value) {},
          labelColor: CustomColors.white,
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: CustomColors.primary,
          ),
          tabs: [
            Tab(
              child: SizedBox(
                width: maxWidth * .5,
                child: const Center(
                  child: Text('Pakeitimų įrašai'),
                ),
              ),
            ),
            Tab(
              child: SizedBox(
                width: maxWidth * .5,
                child: const Center(
                  child: Text('Statusų įrašai'),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}

class _BuildHistoricData extends StatelessWidget {
  const _BuildHistoricData(this.historicData);

  final List<HistoryData> historicData;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        ...historicData.mapIndexed((index, e) => _BuildHistoricDataCard(
              data: e,
              isLast: index == historicData.length - 1,
            ))
      ]),
    );
  }
}

class _BuildStatusRecords extends StatelessWidget {
  const _BuildStatusRecords(this.statusRecords);

  final List<StatusRecords> statusRecords;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        ...statusRecords.mapIndexed((index, e) => _BuildStatusRecordCard(
              data: e,
              isLast: index == statusRecords.length - 1,
            ))
      ]),
    );
  }
}

class DottedLineVerticalPainter extends CustomPainter {
  final double dashWidth;
  final double dashSpace;
  final Paint pnt;

  DottedLineVerticalPainter(
      {this.dashWidth = 4, this.dashSpace = 4.0, Color color = Colors.black})
      : pnt = Paint()
          ..color = color
          ..strokeWidth = 1;

  @override
  void paint(Canvas canvas, Size size) {
    double startY = 0;
    while (startY < size.height) {
      canvas.drawLine(Offset(0, startY), Offset(0, startY + dashWidth), pnt);
      startY += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class _BuildHistoricDataCard extends StatelessWidget {
  const _BuildHistoricDataCard({
    required this.data,
    required this.isLast,
  });

  final HistoryData data;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: CustomColors.white,
                ),
                child: const Icon(
                  Icons.refresh,
                  color: CustomColors.primary,
                  size: 20,
                ),
              ),
              // const Expanded(
              //     child: DottedLine(
              //   direction: Axis.vertical,
              //   dashColor: CustomColors.primary,
              // )),
              Expanded(
                child: CustomPaint(
                  painter: DottedLineVerticalPainter(
                    color: CustomColors.white,
                  ),
                  size: const Size(1, double.infinity),
                ),
              )
            ],
          ),
          24.widthBox,
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data.date ?? '',
                style: CustomStyles.body1.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                data.user ?? '',
                style: CustomStyles.body2,
              ),
              for (final edit in (data.edits ?? <Edits>[])) ...[
                10.heightBox,
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: CustomColors.white,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            edit.field ?? '',
                            style: CustomStyles.body2.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      2.heightBox,
                      Text(
                        edit.change ?? '',
                        style: CustomStyles.body2,
                      )
                    ],
                  ),
                ),
              ],
              if (!isLast) 20.heightBox,
            ],
          ))
        ],
      ),
    );
  }
}

class _BuildStatusRecordCard extends StatelessWidget {
  const _BuildStatusRecordCard({
    required this.data,
    required this.isLast,
  });

  final StatusRecords data;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: CustomColors.white,
                ),
                child: const Icon(
                  Icons.refresh,
                  color: CustomColors.primary,
                  size: 20,
                ),
              ),
              // const Expanded(
              //     child: DottedLine(
              //   direction: Axis.vertical,
              //   dashColor: CustomColors.primary,
              // )),
              Expanded(
                child: CustomPaint(
                  painter: DottedLineVerticalPainter(
                    color: CustomColors.white,
                  ),
                  size: const Size(1, double.infinity),
                ),
              )
            ],
          ),
          24.widthBox,
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data.date ?? '',
                style: CustomStyles.body1.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              10.heightBox,
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: CustomColors.white,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          data.status ?? '',
                          style: CustomStyles.body2.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              20.heightBox,
            ],
          ))
        ],
      ),
    );
  }
}
