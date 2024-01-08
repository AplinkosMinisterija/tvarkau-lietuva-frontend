import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

import '../common/custom_colors.dart';
import '../common/custom_styles.dart';
import 'aad_answer_tab.dart';
import 'historic_data_tab.dart';

enum TabType {
  aad,
  history;
}

extension TabTypeX on TabType {
  String get name {
    return switch (this) {
      TabType.aad => 'AAD atsakymas',
      TabType.history => 'Istoriniai duomenys',
    };
  }
}

class DumpTabs extends StatefulWidget {
  const DumpTabs({super.key, required this.dump});

  final ReportModel dump;

  @override
  State<DumpTabs> createState() => _DumpTabsState();
}

class _DumpTabsState extends State<DumpTabs> {
  TabType selected = TabType.aad;

  Widget get currentTab {
    return switch (selected) {
      TabType.aad => const AddAnswerTab(),
      TabType.history => HistoricDataTab(
          historicData: widget.dump.historyData ?? [],
          statusRecords: widget.dump.statusRecords ?? [],
        ),
    };
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: CustomColors.primary,
      ),
      constraints: const BoxConstraints(
        maxWidth: 480,
      ),
      child: Column(
        children: [
          _BuildCustomTabs(
            tabs: TabType.values,
            selected: selected,
            onChanged: (val) {
              setState(() {
                selected = val;
              });
            },
          ),
          currentTab,
        ],
      ),
    );
  }
}

class _BuildCustomTabs extends StatelessWidget {
  const _BuildCustomTabs({
    required this.tabs,
    required this.selected,
    required this.onChanged,
  });

  final List<TabType> tabs;
  final TabType selected;
  final ValueChanged<TabType> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (var i = 0; i < tabs.length; i++)
          _BuildTab(
            selected: i == selected.index,
            title: tabs[i].name,
            onTap: () => onChanged(tabs[i]),
          ),
      ],
    );
  }
}

class _BuildTab extends StatelessWidget {
  const _BuildTab({
    required this.selected,
    required this.title,
    required this.onTap,
  });

  final bool selected;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(8),
        ),
        hoverColor: CustomColors.primary.withOpacity(0.05),
        onTap: onTap,
        child: Container(
          height: 54,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(8),
            ),
            color: selected ? CustomColors.grey : null,
          ),
          child: Center(
            child: Text(
              title,
              style: CustomStyles.body1.copyWith(
                color: selected ? CustomColors.primary : CustomColors.grey,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
