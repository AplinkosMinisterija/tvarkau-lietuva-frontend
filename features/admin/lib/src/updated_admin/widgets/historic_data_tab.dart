import 'package:flutter/material.dart';

import '../common/custom_colors.dart';
import '../common/custom_styles.dart';
import '../common/extensions.dart';

class HistoricDataTab extends StatefulWidget {
  const HistoricDataTab({super.key});

  @override
  State<HistoricDataTab> createState() => _HistoricDataTabState();
}

class _HistoricDataTabState extends State<HistoricDataTab>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
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
          const Expanded(child: _BuildHistoricData()),
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
  const _BuildHistoricData();

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(children: [
        _BuildDataCard(
            date: '2023-08-01 13:37', email: 'vardenis.pavardenis@gmail.com'),
        _BuildDataCard(
            date: '2023-08-01 13:37', email: 'vardenis.pavardenis@gmail.com'),
        _BuildDataCard(
            date: '2023-08-01 13:37', email: 'vardenis.pavardenis@gmail.com'),
      ]),
    );
  }
}

class _BuildDataCard extends StatelessWidget {
  const _BuildDataCard({
    required this.date,
    required this.email,
  });

  final String date;
  final String email;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
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
              child: Container(
                width: 1,
                color: CustomColors.primary,
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
              date,
              style: CustomStyles.body1.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              email,
              style: CustomStyles.body2,
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
                  Text(
                    'Pakeistas pranešimo statusas',
                    style: CustomStyles.body2.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  2.heightBox,
                  Text(
                    'Gautas',
                    style: CustomStyles.body2,
                  )
                ],
              ),
            ),
            20.heightBox,
          ],
        ))
      ],
    );
  }
}
